//
//  HighscoreLayer.m
//  Comp50Game
//
//  Created by Eric Douglas on 5/3/12.
//  Copyright 2012 Tufts University. All rights reserved.
//

#import "HighscoreLayer.h"


@implementation HighscoreLayer

-(id) init{
    self=[super init];
    CCSprite* bg = [[CCSprite alloc] initWithFile:@"highscore.png"];
    [bg setPosition:ccp(240, 160)];
    [self addChild:bg];
    
   /* CCSprite* arrow = [[CCSprite alloc] initWithFile:@"LeftArrow.png"];
    [arrow setPosition:ccp(180, 270)];
    //background = bg;
    [self addChild:arrow];*/
    
    CCMenuItemFont *back = [CCMenuItemFont itemFromString:@"Main Menu" target:self selector: @selector(back:)];
    [back setFontName:@"STHeitiTC-Medium"];
    [back setFontSize:28];
    CCMenu *menu = [CCMenu menuWithItems: back, nil];
    
    menu.position = ccp(260, 260);
    menu.color = ccc3(15, 77, 146);
    [menu alignItemsHorizontallyWithPadding: 40.0f];
    [self addChild: menu];
    
    int hs1 = [[NSUserDefaults standardUserDefaults] integerForKey:@"highScore1"];
    int hs2 = [[NSUserDefaults standardUserDefaults] integerForKey:@"highScore2"];
    int hs3 = [[NSUserDefaults standardUserDefaults] integerForKey:@"highScore3"];
    
    CCLabelTTF *scorest = [CCLabelTTF labelWithString:@"Gnarliest: "  fontName:@"STHeitiTC-Medium" fontSize:26];
    score1 = scorest;
    score1.color = ccc3(218, 165, 32);
    [score1 setPosition:ccp(250, 145)];
    [score1 setString:[NSString stringWithFormat:@"Gnarliest: %i",(int)hs1]];
    
    CCLabelTTF *scorer = [CCLabelTTF labelWithString:@"Gnarlier: "  fontName:@"STHeitiTC-Medium" fontSize:26];
    score2 = scorer;
    score2.color = ccc3(218, 165, 32);
    [score2 setPosition:ccp(250, 95)];
    [score2 setString:[NSString stringWithFormat:@"Gnarlier: %i",(int)hs2]];
    
    CCLabelTTF *score = [CCLabelTTF labelWithString:@"Gnarly: "  fontName:@"STHeitiTC-Medium" fontSize:26];
    score3 = score;
    score3.color = ccc3(218, 165, 32);
    [score3 setPosition:ccp(250, 45)];
    [score3 setString:[NSString stringWithFormat:@"Gnarly: %i",(int)hs3]];
    
    CCSprite* flame = [[CCSprite alloc] initWithFile:@"mmsb.png"];
    [flame setPosition:ccp(220, 260)];
    //text = txt;
    [self addChild: flame];
    
    CCSprite* flower = [[CCSprite alloc] initWithFile:@"flower.png"];
    [flower setPosition:ccp(35, 40)];
    //text = txt;
    [self addChild: flower];
    
    CCSprite* ride = [[CCSprite alloc] initWithFile:@"rideon.png"];
    [ride setPosition:ccp(85, 50)];
    //text = txt;
    [self addChild: ride];
    
    
    [self addChild:score1];
    [self addChild:score2];
    [self addChild:score3];
    
    return self;
}

-(void) back: (id) sender{
    [SceneManager goMenu];
}

-(void) restart: (id) sender{
    [SceneManager goPlay];
}


@end
