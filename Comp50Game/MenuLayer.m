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
    
    [[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"skateboard.mp3"];
    
    //CCLabelTTF *titleLeft = [CCLabelTTF labelWithString:@"Menu " fontName:@"Marker Felt" fontSize:48];
    //CCLabelTTF *titleRight = [CCLabelTTF labelWithString:@" System" fontName:@"Marker Felt" fontSize:48];
    //CCLabelTTF *titleQuotes = [CCLabelTTF labelWithString:@"\"                        \"" fontName:@"Marker Felt" fontSize:48];
    //CCLabelTTF *titleCenterTop = [CCLabelTTF labelWithString:@"How to build a..." fontName:@"Marker Felt" fontSize:26];
    //CCLabelTTF *titleCenterBottom = [CCLabelTTF labelWithString:@"SkateWorks" fontName:@"Marker Felt" fontSize:72];
    
    //CCMenuItemFont *startNew = [CCMenuItemImage itemFromNormalImage:@"shredbutton.png" selectedImage:@"shredbutton.png" target:self selector: @selector(onNewGame:)];
    CCMenuItemFont *startNew = [CCMenuItemFont itemFromString:@"Shred!" target:self selector:@selector(onNewGame:)];
    CCMenuItemFont *instruction = [CCMenuItemFont itemFromString:@"Instructions" target:self selector: @selector(onInstructions:)];
    //startNew.color = ccc3(<#const GLubyte r#>, <#const GLubyte g#>, <#const GLubyte b#>)
    CCMenu *menu = [CCMenu menuWithItems:startNew, instruction, nil];
    
    
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
    
    menu.position = ccp(240, 130);
    [menu alignItemsVerticallyWithPadding: 15.0f];
    [self addChild:menu];
    
    game = [GameLayer node];
    instructions = [InstructionLayer node];
    
    CCSprite* bg = [[CCSprite alloc] initWithFile:@"cityskate.png"];
    [bg setPosition:ccp(240, 160)];
    //background = bg;
    [self addChild: bg z:-1];
    CCSprite* logo = [[CCSprite alloc] initWithFile:@"logo.png"];
    [logo setPosition:ccp(240, 235)];
    //background = bg;
    [self addChild: logo];
    
    return self;
}


- (void)onNewGame:(id)sender{
    //[SceneManager goMenu];
    [SceneManager goPlay];
}


- (void)onInstructions:(id)sender{
    [SceneManager goInstructions];
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
