//
//  GameOverLayer.m
//  Comp50Game
//
//  Created by Eric Douglas on 5/3/12.
//  Copyright 2012 Tufts University. All rights reserved.
//

#import "GameOverLayer.h"
#import "SimpleAudioEngine.h"
#import "CDAudioManager.h"
#import "CocosDenshion.h"


@implementation GameOverLayer


-(id) init{
    self=[super init];
    
    [[SimpleAudioEngine sharedEngine] playEffect:@"horngoby.wav"];
    
    
     CCSprite* bg = [[CCSprite alloc] initWithFile:@"broken.png"];
     [bg setPosition:ccp(240, 160)];
     //text = txt;
    [self addChild: bg];
    CCSprite* fall = [[CCSprite alloc] initWithFile:@"falling.png"];
    [fall setPosition:ccp(130, 160)];
    //text = txt;
    [self addChild: fall];
    CCSprite* gameOver = [[CCSprite alloc] initWithFile:@"GameOver.png"];
    [gameOver setPosition:ccp(240, 250)];
    //text = txt;
    [self addChild: gameOver];
     /*
     CCSprite* bg = [[CCSprite alloc] initWithFile:@"road2.png"];
     [bg setPosition:ccp(240, 160)];
     //background = bg;
     [self addChild:bg z:-1];*/
    /*CCLabelTTF *titleCenterBottom = [CCLabelTTF labelWithString:@"Time:" fontName:@"Marker Felt" fontSize:36];
    titleCenterBottom.position = ccp(240, 270);
    titleCenterBottom.color = ccc3(96, 47, 107);
    [self addChild:titleCenterBottom];*/
    
    CCLabelTTF *timer = [CCLabelTTF labelWithString:@"Your Time: "  fontName:@"Marker Felt" fontSize:36];
    timerLabel = timer;
    timerLabel.color = ccc3(0, 0, 0);
    int time = [[GameLayer node] getFinaltime];
    //int ftime = [self writeCrap:time];
    [timerLabel setString:[NSString stringWithFormat:@"Last Run: %i",(int)time]];
    timer.position = ccp(240, 165);
    [self addChild:timerLabel];
    

    CCMenuItemFont *back = [CCMenuItemFont itemFromString:@"Menu" target:self selector: @selector(back:)];
    CCMenuItemFont *restart = [CCMenuItemFont itemFromString:@"Restart" target:self selector: @selector(restart:)];
    CCMenu *menu = [CCMenu menuWithItems: back, restart, nil];
    menu.color = ccc3(255, 255, 255);
    menu.position = ccp(243, 85);
    [menu alignItemsVerticallyWithPadding: 6.0f];
    [self addChild: menu];

    return self;
}
    
    

- (int)writeCrap:(int)time  {
 // Writing
 NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
 [defaults setInteger:time forKey:@"highScore"];
 [defaults synchronize];
 
 // Reading
 int savedHS = [defaults integerForKey:@"highScore"];
     
     return savedHS;
 }



-(void) back: (id) sender{
    [SceneManager goMenu];
}

-(void) restart: (id) sender{
    [SceneManager goPlay];
}

@end
