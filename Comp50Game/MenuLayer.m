//
//  MyCocos2DClass.m
//  Comp50Game
//
//  Created by Eric Douglas on 5/2/12.
//  Copyright 2012 Tufts University. All rights reserved.
//


#import "MenuLayer.h"
#import "GameLayer.h"
#import "SimpleAudioEngine.h"
#import "InstructionLayer.h"
#import "CDAudioManager.h"
#import "CocosDenshion.h"
#import "GameOverLayer.h"

@implementation MenuLayer

-(id) init{
    self = [super init];
    
    self.isTouchEnabled = YES;
    self.isAccelerometerEnabled = YES;
    //paused = false;
    if (![[SimpleAudioEngine sharedEngine] isBackgroundMusicPlaying]) {
        [[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"Skateworks.mp3"];
        [[SimpleAudioEngine sharedEngine] pauseBackgroundMusic];
    }
    
    //CCLabelTTF *titleLeft = [CCLabelTTF labelWithString:@"Menu " fontName:@"Marker Felt" fontSize:48];
    //CCLabelTTF *titleRight = [CCLabelTTF labelWithString:@" System" fontName:@"Marker Felt" fontSize:48];
    //CCLabelTTF *titleQuotes = [CCLabelTTF labelWithString:@"\"                        \"" fontName:@"Marker Felt" fontSize:48];
    //CCLabelTTF *titleCenterTop = [CCLabelTTF labelWithString:@"How to build a..." fontName:@"Marker Felt" fontSize:26];
    //CCLabelTTF *titleCenterBottom = [CCLabelTTF labelWithString:@"SkateWorks" fontName:@"Marker Felt" fontSize:72];
    
    //CCMenuItemFont *startNew = [CCMenuItemImage itemFromNormalImage:@"shredbutton.png" selectedImage:@"shredbutton.png" target:self selector: @selector(onNewGame:)];
    CCMenuItemFont *startNew = [CCMenuItemFont itemFromString:@"Shred" target:self selector:@selector(onNewGame:)];
    CCMenuItemFont *instruction = [CCMenuItemFont itemFromString:@"Skate 101" target:self selector: @selector(onInstructions:)];
    CCMenuItemFont *highscore = [CCMenuItemFont itemFromString:@"Sick Runs" target:self selector:@selector(onHighscore:)];
    //startNew.color = ccc3(218, 165, 32);
    CCMenu *menu = [CCMenu menuWithItems:startNew, instruction, highscore, nil];
    
    CCLabelTTF *credit = [CCLabelTTF labelWithString:@"Created by Aaron Wishnick, Inbar Fried, Eric Douglas"  fontName:@"Marker Felt" fontSize:20];
    [credit setPosition:ccp(275, 13)];
    credit.color = ccc3(255, 255, 255);
     
    
    
    ///titleCenterTop.position = ccp(160, 380);
    //[self addChild: titleCenterTop];
    /*titleCenterBottom.position = ccp(240, 220);
    titleCenterBottom.color = ccc3(96, 47, 107);
    [self addChild: titleCenterBottom];*/

    
    //titleQuotes.position = ccp(160, 345);
    //[self addChild: titleQuotes];
    
    //titleLeft.position = ccp(80, 345);
    //[self addChild: titleLeft];
    
    //titleRight.position = ccp(220, 345);
    //[self addChild: titleRight];
    CCSprite* button1 = [[CCSprite alloc] initWithFile:@"sb1.png"];
    [button1 setPosition:ccp(240, 170)];
     [self addChild:button1];
    
    CCSprite* button2 = [[CCSprite alloc] initWithFile:@"sb1.png"];
    [button2 setPosition:ccp(240, 117)];
    [self addChild:button2];
    
    CCSprite* button3 = [[CCSprite alloc] initWithFile:@"sb1.png"];
    [button3 setPosition:ccp(240, 63)];
    [self addChild:button3];
    
    CCSprite* musicbut = [[CCSprite alloc] initWithFile:@"speaker.png"];
    [musicbut setPosition:ccp(35, 40)];
    [self addChild:musicbut];

    
    menu.position = ccp(240, 115);
    menu.color = ccc3(147, 39, 36);
    [menu alignItemsVerticallyWithPadding: 18.0f];
    [self addChild:menu];
    
    game = [GameLayer node];
    instructions = [InstructionLayer node];
    
    CCSprite* bg = [[CCSprite alloc] initWithFile:@"skateshop.png"];
    [bg setPosition:ccp(240, 160)];
    //background = bg;
    [self addChild: bg z:-1];
    CCSprite* logo = [[CCSprite alloc] initWithFile:@"logo2.png"];
    [logo setPosition:ccp(245, 245)];
    //background = bg;
    [self addChild: logo];
    [self addChild:credit];
    
    return self;
}


- (void)onNewGame:(id)sender{
    //[SceneManager goMenu];
    [SceneManager goPlay];
}


- (void)onInstructions:(id)sender{
    [SceneManager goInstructions];
}
                                 
                               
- (void)onHighscore:(id)sender{
    [SceneManager goHighscore];
}


- (void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInView:[touch view]];
    CGRect musicLoc = CGRectMake(0, 250, 60, 60);
    if (CGRectContainsPoint(musicLoc, location)) {
        if (![[SimpleAudioEngine sharedEngine] isBackgroundMusicPlaying]) {
            [[SimpleAudioEngine sharedEngine] resumeBackgroundMusic];
        } else {
            [[SimpleAudioEngine sharedEngine] pauseBackgroundMusic];
        }
        paused = !paused;
    }
}
/*-(void)ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event 
{
    UITouch* touch = [touches location];
    CGPoint location = [[CCDirector sharedDirector] convertToGL:[touch locationInView:touch.view]];
    CGRect musicLoc = CGRectMake(0, 0, 30, 30);
    if (CGRectContainsPoint(musicLoc, touch)) {
        
}*/

- (void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration {
    // Do stuff like sending accel information to player to make him move'
    /*
     int currentX = player.position.x;
     //int currentY = player.position.y;
     
     if (acceleration.x > 0.25) {*/
    
    //NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    //[defaults setDouble:acceleration.x forKey:@"accel.x"];
    //NSLog(@"%f", (double)acceleration.x);

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
