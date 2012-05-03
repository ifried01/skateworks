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

@implementation MenuLayer

-(id) init{
    self = [super init];
    
    [[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"skateboard.mp3"];
    
    //CCLabelTTF *titleLeft = [CCLabelTTF labelWithString:@"Menu " fontName:@"Marker Felt" fontSize:48];
    //CCLabelTTF *titleRight = [CCLabelTTF labelWithString:@" System" fontName:@"Marker Felt" fontSize:48];
    //CCLabelTTF *titleQuotes = [CCLabelTTF labelWithString:@"\"                        \"" fontName:@"Marker Felt" fontSize:48];
    //CCLabelTTF *titleCenterTop = [CCLabelTTF labelWithString:@"How to build a..." fontName:@"Marker Felt" fontSize:26];
    CCLabelTTF *titleCenterBottom = [CCLabelTTF labelWithString:@"SkateWorks" fontName:@"Marker Felt" fontSize:72];
    
    CCMenuItemFont *startNew = [CCMenuItemFont itemFromString:@"New Game" target:self selector: @selector(onNewGame:)];
    CCMenuItemFont *credits = [CCMenuItemFont itemFromString:@"Instructions" target:self selector: @selector(onCredits:)];
    CCMenu *menu = [CCMenu menuWithItems:startNew, credits, nil];
    
    
    ///titleCenterTop.position = ccp(160, 380);
    //[self addChild: titleCenterTop];
    titleCenterBottom.position = ccp(240, 220);
    titleCenterBottom.color = ccc3(96, 47, 107);
    [self addChild: titleCenterBottom];

    
    //titleQuotes.position = ccp(160, 345);
    //[self addChild: titleQuotes];
    
    //titleLeft.position = ccp(80, 345);
    //[self addChild: titleLeft];
    
    //titleRight.position = ccp(220, 345);
    //[self addChild: titleRight];
    
    menu.position = ccp(240, 110);
    [menu alignItemsVerticallyWithPadding: 30.0f];
    [self addChild:menu z: 2];
    
    game = [GameLayer node];
    instructions = [InstructionLayer node];
    
    CCSprite* bg = [[CCSprite alloc] initWithFile:@"skatemenu.png"];
    [bg setPosition:ccp(240, 160)];
    //background = bg;
    [self addChild: bg z:-1];
    
    return self;
}


- (void)onNewGame:(id)sender{
    //[SceneManager goMenu];
    [SceneManager goLayer:game];
}


- (void)onCredits:(id)sender{
    [SceneManager goLayer:instructions];
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
