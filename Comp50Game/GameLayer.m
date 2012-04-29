//
//  GameLayer.m
//  Comp50Game
//
//  Created by Eric Douglas on 4/25/12.
//  Copyright 2012 Tufts University. All rights reserved.
//

#import "GameLayer.h"
#import "PlayerClass.h"
#import "SpriteClass.h"


@implementation GameLayer

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	GameLayer *gameLayer = [GameLayer node];
    
	// add layer as a child to scene
    [scene addChild: gameLayer];
	
	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init])) {
        self.isTouchEnabled = YES;
        
        gameTimer = 0;
        //print "Time:" to screen
        CCLabelTTF *timer = [CCLabelTTF labelWithString:@"Time: "  fontName:@"Helvetica" fontSize:24];
        timer.position = ccp(240, 160);
        
        [self schedule:@selector(update:) interval:1.0/60];
        self.isAccelerometerEnabled = YES;
        [[UIAccelerometer sharedAccelerometer] setDelegate:self];
        
       //NSArray* inputImages = [NSArray arrayWithObjects:@"car1.png", @"car3.png", @"car4.png", @"car5.png", @"car6.png", nil];
        
        NSString* image1 = @"car1.png";
        NSString* image2 = @"car3.png";
        NSString* image3 = @"car4.png";
        NSString* image4 = @"car5.png";
        NSString* image5 = @"car6.png";
        NSMutableArray *tempImages = [[NSMutableArray alloc] initWithCapacity:10];
        [tempImages addObject:image1];
        [tempImages addObject:image2];
        [tempImages addObject:image3];
        [tempImages addObject:image4];
        [tempImages addObject:image5];
         
        images = tempImages;
        roadImage = @"road1.png";
        //NSInteger i = arc4random()%[images count] + 1;
        //NSString *carImage = [images objectAtIndex:i];
    
        NSMutableArray* tempSprites = [[NSMutableArray alloc] initWithCapacity:100];
        sprites = tempSprites;
        
        //Road spawn
        NSMutableArray* newLanes = [[NSMutableArray alloc] initWithCapacity:6];
        CCSprite *lane1 = [[CCSprite alloc] initWithFile:roadImage];
        [lane1 setPosition:ccp(240, 27)];
        [self addChild:lane1];
        [newLanes addObject:lane1];
        CCSprite *lane2 = [[CCSprite alloc] initWithFile:roadImage];
        [lane2 setPosition:ccp(240, 27*3)];
        [self addChild:lane2];
        [newLanes addObject:lane2];
        CCSprite *lane3 = [[CCSprite alloc] initWithFile:roadImage];
        [lane3 setPosition:ccp(240, 27*5)];
        [self addChild:lane3];
        [newLanes addObject:lane3];
        CCSprite *lane4 = [[CCSprite alloc] initWithFile:roadImage];
        [lane4 setPosition:ccp(240, 27*7)];
        [self addChild:lane4];
        [newLanes addObject:lane4];
        CCSprite *lane5 = [[CCSprite alloc] initWithFile:roadImage];
        [lane5 setPosition:ccp(240, 27*9)];
        [self addChild:lane5];
        [newLanes addObject:lane5];
        CCSprite *lane6 = [[CCSprite alloc] initWithFile:roadImage];
        [lane6 setPosition:ccp(240, 27*11)];
        [self addChild:lane6];
        [newLanes addObject:lane6];
        
        lanes = newLanes;
        
        PlayerClass* tempPlayer = [[PlayerClass alloc] initWithFile:@"player1.png"];
        player = tempPlayer;
        [self addChild:tempPlayer];
        [self addChild:timer];
        //SpriteClass* tempSprite = [[SpriteClass alloc] initWithFile:@"car6.png"];
        //sprite = tempSprite;
        //[self addChild:tempSprite];    
    }
	return self;
}

- (void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration {
    // Do stuff like sending accel information to player to make him move'
    /*
    int currentX = player.position.x;
    //int currentY = player.position.y;
    
    if (acceleration.x > 0.25) {
        //player.position.x = currentX - acceleration.x
        printf("HERE\n");
        currentX = currentX - acceleration.x;
    }
//
//    [player setPosition:(CGPoint)]*/
    
    //NSLog(@"x: %g", acceleration.x);
    /*
    NSLog(@"y: %g", acceleration.y);
    NSLog(@"z: %g", acceleration.z);
    */
    [player setUpDown:acceleration.x];

    
}

- (void)update:(ccTime)dt {
    
    //COLLISION HANDLING AND CAR SPAWNING
    gameTimer += dt;
    CCArray* deleteMe = [CCArray array];
    /*CCArray* sprites = [self children];
    if ([[SpriteClass self] children] != nil) {
        CCArray* playerArray = [[PlayerClass self] children];
        CCSprite* player = [playerArray objectAtIndex:0];
        for (int i = 0; i < [sprites count]; i++) {
            if (CGRectIntersectsRect([[sprites objectAtIndex:i] boundingBox], [player boundingBox])) {
                //NSLog(@"Colliding");
                [deleteMe addObject:player];
            }
        }
        for (int a = 0; a < [deleteMe count]; a++) {
            [self removeChild:[deleteMe objectAtIndex:a] cleanup:YES];
        }
    }
    
     // NSLog(@"Updating!");
     */
    NSInteger c;
    if (gameTimer < 15) {
     c = arc4random()%100;
    }
    else {
        c = arc4random()%1;
    }
     if (c == 0) {
         NSInteger i = arc4random()%[images count];
         NSString *carImage = [images objectAtIndex:i];
         SpriteClass* tempSprite = [[SpriteClass alloc] initWithFile:carImage];
         [self addChild:tempSprite];
         [sprites addObject:tempSprite];
     }

     for (int b = 0; b < [sprites count]; b++) {
         SpriteClass* temp = [sprites objectAtIndex:b];
         [temp setCarx];
         [temp setPosition:ccp([temp getSpritex], [temp getSpritey])];
         if ([temp getSpritex] < -30) {
             [deleteMe addObject:temp];
         }
         if (CGRectIntersectsRect([temp boundingBox], [player boundingBox])) {
             [player setCollide:true];
         }
     }
    /*for (int z = 0; z < [lanes count]; z++) {
        SpriteClass* tempLane = [lanes objectAtIndex:z];
        [tempLane setRoadx];
        [tempLane setPosition:ccp([tempLane getSpritex], [tempLane getSpritey])];
        if ([tempLane getSpritex] < -250) {
            [deleteMe addObject:tempLane];
        }
    }*/
    for (int a = 0; a < [deleteMe count]; a++) {
        [self removeChild:[deleteMe objectAtIndex:a] cleanup:YES];
    }

    
} 
// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	[super dealloc];
}

@end
