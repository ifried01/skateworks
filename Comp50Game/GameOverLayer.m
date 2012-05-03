//
//  GameOverLayer.m
//  Comp50Game
//
//  Created by Eric Douglas on 5/3/12.
//  Copyright 2012 Tufts University. All rights reserved.
//

#import "GameOverLayer.h"


@implementation GameOverLayer


-(id) init{
    self=[super init];
    
    
     CCSprite* txt = [[CCSprite alloc] initWithFile:@"skatemenu.png"];
     [txt setPosition:ccp(240, 160)];
     //text = txt;
     [self addChild:txt];
     /*
     CCSprite* bg = [[CCSprite alloc] initWithFile:@"road2.png"];
     [bg setPosition:ccp(240, 160)];
     //background = bg;
     [self addChild:bg z:-1];*/
    CCLabelTTF *titleCenterBottom = [CCLabelTTF labelWithString:@"Game Over" fontName:@"Marker Felt" fontSize:72];
    titleCenterBottom.position = ccp(240, 250);
    titleCenterBottom.color = ccc3(178, 34, 34);
    [self addChild:titleCenterBottom];
    
    CCLabelTTF *timer = [CCLabelTTF labelWithString:@"Your Time: "  fontName:@"Marker Felt" fontSize:36];
    timerLabel = [timer retain];
    timerLabel.color = ccc3(0, 34, 34);
    double time = [[GameLayer node] getTimer];
    [timerLabel setString:[NSString stringWithFormat:@"Your Time: %i",(int)time]];
    timer.position = ccp(240, 180);
    [self addChild:timerLabel];
    

    CCMenuItemFont *back = [CCMenuItemFont itemFromString:@"Menu" target:self selector: @selector(back:)];
    CCMenuItemFont *restart = [CCMenuItemFont itemFromString:@"Restart" target:self selector: @selector(restart:)];
    CCMenu *menu = [CCMenu menuWithItems: back, restart, nil];

    menu.position = ccp(240, 100);
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

@end
