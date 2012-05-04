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
    CCMenuItemFont *game = [CCMenuItemFont itemFromString:@"Attempt a Sick Run" target:self selector: @selector(restart:)];
    CCMenu *menu = [CCMenu menuWithItems: back, game, nil];
    
    menu.position = ccp(240, 260);
    menu.color = ccc3(255, 127, 0);
    [menu alignItemsHorizontallyWithPadding: 40.0f];
    [self addChild: menu];
    
    CCLabelTTF *scorest = [CCLabelTTF labelWithString:@"Gnarliest: "  fontName:@"Marker Felt" fontSize:30];
    score1 = scorest;
    score1.color = ccc3(218, 165, 32);
    [score1 setPosition:ccp(240, 140)];
    
    CCLabelTTF *scorer = [CCLabelTTF labelWithString:@"Gnarlier: "  fontName:@"Marker Felt" fontSize:30];
    score2 = scorer;
    score2.color = ccc3(218, 165, 32);
    [score2 setPosition:ccp(240, 100)];
    
    CCLabelTTF *score = [CCLabelTTF labelWithString:@"Gnarly: "  fontName:@"Marker Felt" fontSize:30];
    score3 = score;
    score3.color = ccc3(218, 165, 32);
    [score3 setPosition:ccp(240, 60)];
    
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
