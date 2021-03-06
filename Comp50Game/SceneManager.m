//
//  SceneManager.m
//  Comp50Game
//
//  Created by Eric Douglas on 5/2/12.
//  Copyright (c) 2012 Tufts University. All rights reserved.
//

#import "SceneManager.h"



#define TRANSITION_DURATION (1.2f)

@interface FadeWhiteTransition : CCTransitionFade

+(id) transitionWithDuration:(ccTime) t scene:(CCScene*)s;

@end

@interface ZoomFlipXLeftOver : CCTransitionZoomFlipX

+(id) transitionWithDuration:(ccTime) t scene:(CCScene*)s;
@end

@interface ZoomFlipXRightOver : CCTransitionZoomFlipX

+(id) transitionWithDuration:(ccTime)t scene:(CCScene *)s;
@end

@interface FlipYDownOver : CCTransitionFlipY
+(id) transitionWithDuration:(ccTime) t scene:(CCScene*)s;
@end

@implementation FadeWhiteTransition

+(id) transitionWithDuration:(ccTime) t scene:(CCScene*)s {
    return [self transitionWithDuration:t scene:s withColor:ccWHITE];
}

@end

@implementation ZoomFlipXLeftOver

+(id) transitionWithDuration:(ccTime) t scene:(CCScene*)s {
    return [self transitionWithDuration:t scene:s orientation:kOrientationLeftOver];

}

@end

@implementation ZoomFlipXRightOver

+(id) transitionWithDuration:(ccTime)t scene:(CCScene *)s {
    return [self transitionWithDuration:t scene:s orientation:kOrientationRightOver];
}

@end

@implementation FlipYDownOver

+(id) transitionWithDuration:(ccTime) t scene:(CCScene*)s {
    return [self transitionWithDuration:t scene:s orientation:kOrientationDownOver];
}
@end


static int sceneIdx=0;

static NSString *transitions[] = {
    @"FlipYDownOver",
    @"FadeWhiteTransition",
    @"ZoomFlipXLeftOver",
    @"ZoomFlipXRightOver",
};

Class nextTransition()
{
    // HACK: else NSClassFromString will fail
    [CCTransitionRadialCCW node];

    //sceneIdx++;
    //sceneIdx = sceneIdx % ( sizeof(transitions) / sizeof(transitions[0]) );
    NSString *r = transitions[sceneIdx];
    Class c = NSClassFromString(r);
    return c;
}









@interface SceneManager ()
+(void) goLayer:(CCLayer *)layer;
+(CCScene *) wrap: (CCLayer *) layer;
@end

@implementation SceneManager



+(void) goMenu{
    sceneIdx = 0;
    CCLayer *layer = [MenuLayer node];
    [SceneManager goLayer: layer];
}

+(void) goLayer: (CCLayer *) layer{
    CCDirector *director = [CCDirector sharedDirector];
    CCScene *newScene = [SceneManager wrap:layer];
   /* 
    if (layer == [GameLayer node]) {
        sceneIdx = 1;
    }
    else if (layer == [MenuLayer node]) {
        sceneIdx = 0;
    }
    else {
        sceneIdx = 2;
    }
    */
    Class transition = nextTransition();

    if ([director runningScene]) {
        [director replaceScene:[transition transitionWithDuration:TRANSITION_DURATION scene:newScene]];
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
    sceneIdx = 1;
    CCLayer *layer = [GameLayer node];
    [SceneManager goLayer: layer];
}


+(void) goInstructions{
    sceneIdx = 2;
    CCLayer *layer = [InstructionLayer node];
    [SceneManager goLayer: layer];
}

+(void) goHighscore{
    sceneIdx = 3;
    CCLayer* layer = [HighscoreLayer node];
    [SceneManager goLayer: layer];
}

+(void) goGameover {
    sceneIdx = 1;
    CCLayer* layer = [GameOverLayer node];
    [SceneManager goLayer:layer];
    
}


@end

