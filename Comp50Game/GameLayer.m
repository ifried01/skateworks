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
#import "RoadClass.h"
#import "SimpleAudioEngine.h"
#import "CDAudioManager.h"
#import "CocosDenshion.h"
#import "SceneManager.h"
#import "GameOverLayer.h"


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
        isPaused = NO;
        finalTime = 0;
        
        gameTimer = 0;
        //print "Time:" to screen
        CCLabelTTF *timer = [CCLabelTTF labelWithString:@"Time: "  fontName:@"TimesNewRomanPS-ItalicMT" fontSize:24];
        timerLabel = [timer retain];
        timer.position = ccp(425, 10);
        timer.color = ccc3(244, 240, 236);
        
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
        
        roadImage = @"road2.png";
        //NSInteger i = arc4random()%[images count] + 1;
        //NSString *carImage = [images objectAtIndex:i];
    
        NSMutableArray* tempSprites = [[NSMutableArray alloc] initWithCapacity:100];
        sprites = tempSprites;
        
        /*
        NSString* road1 = roadImage;
        NSString* road2 = roadImage;
        NSString* road3 = roadImage;
        NSString* road4 = roadImage;
        NSString* road5 = roadImage;
        NSString* road6 = roadImage;
        NSMutableArray *tempRoads = [[NSMutableArray alloc] initWithCapacity:6];
        [tempRoads addObject:road1];
        [tempRoads addObject:road2];
        [tempRoads addObject:road3];
        [tempRoads addObject:road4];
        [tempRoads addObject:road5];
        [tempRoads addObject:road6];
        
        lanes = tempRoads;*/
        
        //Road spawn
        NSMutableArray* newLanes = [[NSMutableArray alloc] initWithCapacity:12];
        RoadClass *initLane = [[RoadClass alloc] initWithFile:roadImage atPositionx:240 atPositiony:160];
        [self addChild:initLane];
        [newLanes addObject:initLane];
        /*
        RoadClass *lane2 = [[RoadClass alloc] initWithFile:roadImage atPositionx:240 atPositiony:27*3];
        [self addChild:lane2];
        [newLanes addObject:lane2];
        RoadClass *lane3 = [[RoadClass alloc] initWithFile:roadImage atPositionx:240 atPositiony:27*5];
        [self addChild:lane3];
        [newLanes addObject:lane3];
        RoadClass *lane4 = [[RoadClass alloc] initWithFile:roadImage atPositionx:240 atPositiony:27*7];
        [self addChild:lane4];
        [newLanes addObject:lane4];
        RoadClass *lane5 = [[RoadClass alloc] initWithFile:roadImage atPositionx:240 atPositiony:27*9];
        [self addChild:lane5];
        [newLanes addObject:lane5];
        RoadClass *lane6 = [[RoadClass alloc] initWithFile:roadImage atPositionx:240 atPositiony:27*11];
        [self addChild:lane6];
        [newLanes addObject:lane6];*/
        
        RoadClass *secondLane = [[RoadClass alloc] initWithFile:roadImage atPositionx:240+480 atPositiony:160];
        [self addChild:secondLane];
        [newLanes addObject:secondLane];
        /*
        RoadClass *lane8 = [[RoadClass alloc] initWithFile:roadImage atPositionx:240+480 atPositiony:27*3];
        [self addChild:lane8];
        [newLanes addObject:lane8];
        RoadClass *lane9 = [[RoadClass alloc] initWithFile:roadImage atPositionx:240+480 atPositiony:27*5];
        [self addChild:lane9];
        [newLanes addObject:lane9];
        RoadClass *lane10 = [[RoadClass alloc] initWithFile:roadImage atPositionx:240+480 atPositiony:27*7];
        [self addChild:lane10];
        [newLanes addObject:lane10];
        RoadClass *lane11 = [[RoadClass alloc] initWithFile:roadImage atPositionx:240+480 atPositiony:27*9];
        [self addChild:lane11];
        [newLanes addObject:lane11];
        RoadClass *lane12 = [[RoadClass alloc] initWithFile:roadImage atPositionx:240+480 atPositiony:27*11];
        [self addChild:lane12];
        [newLanes addObject:lane12];*/
        
        lanes = newLanes;
        
        CCLabelTTF *pause = [CCLabelTTF labelWithString:@"Chill Out"  fontName:@"TimesNewRomanPS-ItalicMT" fontSize:24];
        pause.position = ccp(430, 305);
        pause.color = ccc3(72, 145, 206);
        [self addChild:pause];
        pauseLabel = pause;
        
        PlayerClass* tempPlayer = [[PlayerClass alloc] initWithFile:@"player1.png"];
        player = tempPlayer;
        [self addChild:tempPlayer];
        [self addChild:timer];
        //SpriteClass* tempSprite = [[SpriteClass alloc] initWithFile:@"car6.png"];
        //sprite = tempSprite;
        //[self addChild:tempSprite]; 
        //[[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"skateboard.mp3"];
    
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

- (void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInView:[touch view]];
    CGRect pauseLoc = CGRectMake(400, 0, 90, 30);
    if (CGRectContainsPoint(pauseLoc, location)) {
        if (!isPaused) {
            [[CCDirector sharedDirector] pause];
        } else {
            [[CCDirector sharedDirector] resume];
        }
        isPaused = !isPaused;
        if (!isPaused) {
            [pauseLabel setString:@"Chill Out"];
        }
        else {
            [pauseLabel setString:@"Carve On"];
        }
    }
}


- (void)update:(ccTime)dt {
    
    //COLLISION HANDLING AND CAR SPAWNING
    if (![player getCollide]) {
        gameTimer += dt;
    }
    [timerLabel setString:[NSString stringWithFormat:@"Time: %i",(int)gameTimer]];
    CCArray* deleteMe = [CCArray array];
    /*CCArray* spritßes = [self children];
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
    
    //NSInteger z = [lanes count];

    NSInteger c;
    if (gameTimer < 15) {
     c = rand()%60;
    }
    else if (gameTimer >= 15 && gameTimer < 45) {
        c = rand()%40;
    }
    else if (gameTimer >= 45 && gameTimer < 90) {
        c = rand()%20;
    }
    else {
        c =rand()%10;
    }
     if (c == 0) {
         NSInteger i = arc4random()%[images count];
         NSString *carImage = [images objectAtIndex:i];
         SpriteClass* tempSprite = [[SpriteClass alloc] initWithFile:carImage];
         [sprites addObject:tempSprite];
         [self addChild:tempSprite];
         for (int x = 0; x < [sprites count]; x++) {
             if (CGRectIntersectsRect([tempSprite boundingBox], [[sprites objectAtIndex:x] boundingBox]) && tempSprite != [sprites objectAtIndex:x]) {
                 [deleteMe addObject:tempSprite];
             }
         }
     }
    
    
    //WHY CAN'T XCODE RECOGNIZE the class ROADSPRITE?????!!!!!??!?!?!?!
    /*//add road pictures
    for (int h = 0; h < [lanes count]; h++){
        NSString *roadPic = [lanes objectAtIndex:h];
        RoadSprite* road1 = [[RoadSprite alloc] initWithFile:roadPic];
        [self addChild:road1];
    }
    
    //move the lanes to give the impression that the player is moving
    for (int g = 0; g < [lanes count]; g++){
        RoadSprite* temp = [lanes objectAtIndex:g];
        [temp setRoadx];
        [temp setPosition:ccp([temp getRoadx], [temp getRoady])];
    }*/
    
    for (int b = 0; b < [sprites count]; b++) {
         SpriteClass* temp = [sprites objectAtIndex:b];
         [temp setCarx];
         [temp setPosition:ccp([temp getSpritex], [temp getSpritey])];
         if ([temp getSpritex] < -30) {
             [deleteMe addObject:temp];
         }
         if (CGRectIntersectsRect([temp boundingBox], [player boundingBox]) && ![player getCollide]) {
             [player setCollide:true];
             
             finalTime = (int)gameTimer;
             CCSprite* outline = [[CCSprite alloc] initWithFile:@"outline.png"];
             [outline setPosition:ccp([player getPlayerx], [player getPlayery])];
             //text = txt;
             [self addChild: outline];
             [self removeChild:player cleanup:YES];
             
             int hs1 = [[NSUserDefaults standardUserDefaults] integerForKey:@"highScore1"];
             int hs2 = [[NSUserDefaults standardUserDefaults] integerForKey:@"highScore2"];
             int hs3 = [[NSUserDefaults standardUserDefaults] integerForKey:@"highScore3"];
             
             NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
             if (gameTimer >= hs1) {
                 [defaults setInteger:(int)hs1 forKey:@"highScore2"];
                 [defaults setInteger:(int)hs2 forKey:@"highScore3"];
                 [defaults setInteger:(int)gameTimer forKey:@"highScore1"];
             }
             else if (hs1 > gameTimer && gameTimer >= hs2) {
                 [defaults setInteger:(int)hs2 forKey:@"highScore3"];
                 [defaults setInteger:(int)gameTimer forKey:@"highScore2"];
             }
             else if (hs2 > gameTimer && gameTimer >= hs3) {
                 [defaults setInteger:(int)gameTimer forKey:@"highScore3"];
             }
             [defaults setInteger:(int)gameTimer forKey:@"gametime"];
             [defaults synchronize];
             
             if ([[SimpleAudioEngine sharedEngine] isBackgroundMusicPlaying]) {
                 [[SimpleAudioEngine sharedEngine] playEffect:@"horngoby.wav"];
             }
             
             
             [SceneManager goGameover];
             //[[SimpleAudioEngine sharedEngine] playEffect:@"carcrash.mp3"];
             //[deleteMe addObject:player];
         }
     }
    for (int z = 0; z < [lanes count]; z++) {
        RoadClass* tempLane = [lanes objectAtIndex:z];
        if ([tempLane getRoadx] < -235) {
            [deleteMe addObject:tempLane];
            [lanes removeObject:tempLane];
            RoadClass *newLane = [[RoadClass alloc] initWithFile:roadImage atPositionx:240+480 atPositiony:[tempLane getRoady]];
            [self addChild:newLane z:-1];
            [lanes addObject:newLane];
            
        }
    }
    for (int a = 0; a < [deleteMe count]; a++) {
        [self removeChild:[deleteMe objectAtIndex:a] cleanup:YES];
    }
    
    /*NSInteger s = arc4random()%200;
    if (s == 0) {
        [[SimpleAudioEngine sharedEngine] playEffect:@"horngoby.wav"];
    }*/
    /*if ([player getCollide]) {
        finalTime = (int)gameTimer;
        [self removeChild:player cleanup:YES];
        int hs1 = [[NSUserDefaults standardUserDefaults] integerForKey:@"highScore1"];
        int hs2 = [[NSUserDefaults standardUserDefaults] integerForKey:@"highScore2"];
        int hs3 = [[NSUserDefaults standardUserDefaults] integerForKey:@"highScore3"];
        
        NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
        if (gameTimer >= hs1) {
            [defaults setInteger:(int)hs1 forKey:@"highScore2"];
            [defaults setInteger:(int)hs2 forKey:@"highScore3"];
            [defaults setInteger:(int)gameTimer forKey:@"highScore1"];
        }
        else if (hs1 > gameTimer && gameTimer >= hs2) {
            [defaults setInteger:(int)hs2 forKey:@"highScore3"];
            [defaults setInteger:(int)gameTimer forKey:@"highScore2"];
        }
        else if (hs2 > gameTimer && gameTimer >= hs3) {
            [defaults setInteger:(int)gameTimer forKey:@"highScore3"];
        }
        [defaults setInteger:(int)gameTimer forKey:@"gametime"];
        [defaults synchronize];
        
        
        [SceneManager goGameover];
    }*/
    
    /*if (isPaused) {
        CCMenuItemFont *back = [CCMenuItemFont itemFromString:@"Menu" target:self selector: @selector(back:)];
        CCMenuItemFont *restart = [CCMenuItemFont itemFromString:@"Restart" target:self selector: @selector(restart:)];
        CCMenu *menu = [CCMenu menuWithItems: back, restart, nil];
        
        menu.position = ccp(240, 130);
        [menu alignItemsVerticallyWithPadding: 10.0f];
        [self addChild: menu];
    }
    */
} 


-(void) back: (id) sender{
    [SceneManager goMenu];
}

-(void) restart: (id) sender{
    [SceneManager goPlay];
}

- (double)getFinaltime {
    return finalTime;
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
