//
//  SceneManager.m
//  Comp50Game
//
//  Created by Eric Douglas on 5/2/12.
//  Copyright (c) 2012 Tufts University. All rights reserved.
//

#import "SceneManager.h"

@interface SceneManager ()
+(void) goLayer:(CCLayer *)layer;
+(CCScene *) wrap: (CCLayer *) layer;
@end

@implementation SceneManager



+(void) goMenu{
    CCLayer *layer = [MenuLayer node];
    [SceneManager goLayer: layer];
}

+(void) goLayer: (CCLayer *) layer{
    CCDirector *director = [CCDirector sharedDirector];
    CCScene *newScene = [SceneManager wrap:layer];
    if ([director runningScene]) {
        [director replaceScene: newScene];
    }else {
        [director runWithScene:newScene];
    }
}

+(CCScene *) wrap: (CCLayer *) layer{
    CCScene *newScene = [CCScene node];
    [newScene addChild: layer];
    return newScene;
}

+(void) goPlay{
    CCLayer *layer = [GameLayer node];
    [SceneManager goLayer: layer];
}


+(void) goInstructions{
    CCLayer *layer = [InstructionLayer node];
    [SceneManager goLayer: layer];
}


@end

