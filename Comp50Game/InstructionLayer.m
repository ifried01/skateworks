//
//  InstructionLayer.m
//  Comp50Game
//
//  Created by Eric Douglas on 5/3/12.
//  Copyright 2012 Tufts University. All rights reserved.
//

#import "InstructionLayer.h"


@implementation InstructionLayer

/*-(id) init{
    self=[super init];
    
    
    CCSprite* txt = [[CCSprite alloc] initWithFile:@"skatemenu.png"];
    [txt setPosition:ccp(240, 160)];
    //text = txt;
    [self addChild:txt];
    
     CCSprite* bg = [[CCSprite alloc] initWithFile:@"road2.png"];
     [bg setPosition:ccp(240, 160)];
     //background = bg;
     [self addChild:bg z:-1];
    
    
    return self;
    
    
}*/
-(id) init{
    self=[super init];
    
    self.isAccelerometerEnabled = YES;
    
    CCSprite* bg = [[CCSprite alloc] initWithFile:@"instructionbg.png"];
    [bg setPosition:ccp(240, 160)];
    //text = txt;
    [self addChild:bg];
    
     CCSprite* txt = [[CCSprite alloc] initWithFile:@"Instructions.png"];
     [txt setPosition:ccp(240, 194)];
     //background = bg;
    
    CCSprite* arrow = [[CCSprite alloc] initWithFile:@"downarrow.png"];
    [arrow setPosition:ccp(305, 18)];
    //background = bg;
    [self addChild:arrow];
    CCSprite* inverter = [[CCSprite alloc] initWithFile:@"inverter.png"];
    [inverter setPosition:ccp(220, 195)];
    //background = bg;
    [self addChild:inverter];

    [self addChild:txt];
    /*CCLabelTTF *titleCenterBottom = [CCLabelTTF labelWithString:@"Game Over" fontName:@"Marker Felt" fontSize:72];
    titleCenterBottom.position = ccp(240, 250);
    titleCenterBottom.color = ccc3(178, 34, 34);
    [self addChild:titleCenterBottom];
    
    CCLabelTTF *timer = [CCLabelTTF labelWithString:@"Your Time: "  fontName:@"Marker Felt" fontSize:36];
    timerLabel = [timer retain];
    timerLabel.color = ccc3(178, 34, 34);
    double time = [[GameLayer node] getTimer];
    [timerLabel setString:[NSString stringWithFormat:@"Your Time: %i",(int)time]];
    timer.position = ccp(240, 200);
    [self addChild:timerLabel];*/
    
    
    CCMenuItemFont *back = [CCMenuItemFont itemFromString:@"Go Back" target:self selector: @selector(back:)];
    CCMenuItemFont *restart = [CCMenuItemFont itemFromString:@"Go Skate" target:self selector: @selector(restart:)];
    [back setFontName:@"CourierNewPS-BoldMT"];
    [restart setFontName:@"CourierNewPS-BoldMT"];
    [back setFontSize:28];
    [restart setFontSize:28];
    CCMenu *menu = [CCMenu menuWithItems: restart, back, nil];
    
    menu.position = ccp(224, 40);
    menu.color = ccc3(153, 50, 204);
    [menu alignItemsVerticallyWithPadding: 3.0f];
    [self addChild: menu];
    
    return self;
}



- (void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration {
    // Do stuff like sending accel information to player to make him move'
    /*
     int currentX = player.position.x;
     //int currentY = player.position.y;
     
     if (acceleration.x > 0.25) {*/
    
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    [defaults setDouble:acceleration.x forKey:@"accel.x"];
    [defaults setDouble:acceleration.z forKey:@"accel.z"];
    //NSLog(@"%f", (double)acceleration.x);
    
}


-(void) back: (id) sender{
    [SceneManager goMenu];
}

-(void) restart: (id) sender{
    [SceneManager goPlay];
}


@end
