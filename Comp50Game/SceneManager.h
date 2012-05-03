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

@interface SceneManager : NSObject {

}

+(void) goMenu;
+(void) goLayer: (CCLayer *) layer;

@end
