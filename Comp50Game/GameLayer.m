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
        
        [self schedule:@selector(update:) interval:1.0/60];
        self.isAccelerometerEnabled = YES;
        [[UIAccelerometer sharedAccelerometer] setDelegate:self];
        
        
        PlayerClass* tempPlayer = [[PlayerClass alloc] initWithFile:@"player1.png"];
        player = tempPlayer;
    
        NSMutableArray* tempSprites = [NSMutableArray arrayWithCapacity:100];
        sprites = tempSprites;
        [self addChild:tempPlayer];        
        
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
//    [player setPosition:<#(CGPoint)#>]*/
    
    NSLog(@"x: %g", acceleration.x);
    /*
    NSLog(@"y: %g", acceleration.y);
    NSLog(@"z: %g", acceleration.z);
    */
    [player setUpDown:acceleration.x];

    
}

- (void)update:(ccTime)dt {
    NSLog(@"Inbar");
    
    /*COLLISION HANDLING AND CAR SPAWNING
     
    CCArray* deleteMe = [CCArray array];
    CCArray* sprites = [self children];
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
     NSInteger c = arc4random()%100 + 1;
     if (c == 75) {
         SpriteClass* tempSprite = [[SpriteClass alloc] initWithFile:@"car1.png"];
         
         [sprites addObject:tempSprite];
     }

     //for (int b = 0; b < [sprites count]; b++) {
     //   if ([[sprites objectAtIndex:b] ]
     //}
    
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
