//
//  SceneManager.h
//  Comp50Game
//
//  Created by Eric Douglas on 5/2/12.
//  Copyright (c) 2012 Tufts University. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "MenuLayer.h"
#import "GameLayer.h"
#import "InstructionLayer.h"


@interface SceneManager : NSObject {

}

+(void) goMenu;
+(void) goLayer: (CCLayer *) layer;
+(void) goPlay;
+(void)goInstructions;

@end
