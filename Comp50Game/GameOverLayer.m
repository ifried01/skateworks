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
    timerLabel = timer;
    timerLabel.color = ccc3(0, 34, 34);
    int time = [[GameLayer node] getFinaltime];
    //int ftime = [self writeCrap:time];
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
