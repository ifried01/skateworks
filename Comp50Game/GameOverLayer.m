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
    

     CCSprite* bg = [[CCSprite alloc] initWithFile:@"skateboardhs.png"];
     [bg setPosition:ccp(240, 160)];
     //text = txt;
    [self addChild: bg];
    CCSprite* fall = [[CCSprite alloc] initWithFile:@"falling.png"];
    [fall setPosition:ccp(130, 160)];
    //text = txt;
    [self addChild: fall];
    CCSprite* sign = [[CCSprite alloc] initWithFile:@"crossing.png"];
    [sign setPosition:ccp(240, 120)];
    //text = txt;
    [self addChild: sign];
    CCSprite* gameOver = [[CCSprite alloc] initWithFile:@"GameOver.png"];
    [gameOver setPosition:ccp(375, 245)];
    //text = txt;
    [self addChild: gameOver];
    CCSprite* deck = [[CCSprite alloc] initWithFile:@"goverdeck3.png"];
    [deck setPosition:ccp(105, 255)];
    //text = txt;
    [self addChild: deck];
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
    timerLabel.color = ccc3(201, 192, 187);
    int time = [[NSUserDefaults standardUserDefaults] integerForKey:@"gametime"];
    //int ftime = [self writeCrap:time];
    [timerLabel setString:[NSString stringWithFormat:@"Session: %i",(int)time]];
    timer.position = ccp(105, 255);
    [self addChild:timerLabel];
    
    

    CCMenuItemFont *back = [CCMenuItemFont itemFromString:@"Main Menu" target:self selector: @selector(back:)];
    CCMenuItemFont *restart = [CCMenuItemFont itemFromString:@"Reboard" target:self selector: @selector(restart:)];
    CCMenuItemFont *highscore = [CCMenuItemFont itemFromString:@"Killer Rides" target:self selector: @selector(highscore:)];
    [back setFontSize:25];
    [restart setFontSize:25];
    [highscore setFontSize:25];
    [back setFontName:@"Trebuchet-BoldItalic"];
    [restart setFontName:@"Trebuchet-BoldItalic"];
    [highscore setFontName:@"Trebuchet-BoldItalic"];
    CCMenu *menu = [CCMenu menuWithItems: restart, highscore, back, nil];
    menu.color = ccc3(192, 192, 192);
    menu.position = ccp(239, 127);
    [menu alignItemsVerticallyWithPadding: 10.0f];
    [self addChild: menu];

    return self;
}
    



-(void) back: (id) sender{
    [SceneManager goMenu];
}

-(void) restart: (id) sender{
    [SceneManager goPlay];
}

-(void) highscore: (id) sender{
    [SceneManager goHighscore];
}

@end
