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
    
    if (![[SimpleAudioEngine sharedEngine] isBackgroundMusicPlaying]) {
        [[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"Skateworks.mp3"];
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
    //startNew.color = ccc3(0, 0, 0);
    CCMenu *menu = [CCMenu menuWithItems:startNew, instruction, highscore, nil];
    
    CCLabelTTF *credit = [CCLabelTTF labelWithString:@"By Eric Douglas, Inbar Fried, Aaron Wishnick"  fontName:@"Marker Felt" fontSize:20];
    [credit setPosition:ccp(310, 13)];
    credit.color = ccc3(218, 165, 32);
     
    
    
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
    CCSprite* button1 = [[CCSprite alloc] initWithFile:@"skateboardbutton.png"];
    [button1 setPosition:ccp(240, 155)];
     [self addChild:button1];
    
    CCSprite* button2 = [[CCSprite alloc] initWithFile:@"skateboardbutton.png"];
    [button2 setPosition:ccp(240, 105)];
    [self addChild:button2];
    
    CCSprite* button3 = [[CCSprite alloc] initWithFile:@"skateboardbutton.png"];
    [button3 setPosition:ccp(240, 55)];
    [self addChild:button3];
    
    menu.position = ccp(240, 105);
    menu.color = ccc3(255, 255, 255);
    [menu alignItemsVerticallyWithPadding: 15.0f];
    [self addChild:menu];
    
    game = [GameLayer node];
    instructions = [InstructionLayer node];
    
    CCSprite* bg = [[CCSprite alloc] initWithFile:@"cityskate.png"];
    [bg setPosition:ccp(240, 160)];
    //background = bg;
    [self addChild: bg z:-1];
    CCSprite* logo = [[CCSprite alloc] initWithFile:@"logo.png"];
    [logo setPosition:ccp(240, 245)];
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
