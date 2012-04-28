//
//  GameLayer.h
//  Comp50Game
//
//  Created by Eric Douglas on 4/25/12.
//  Copyright 2012 Tufts University. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@class PlayerClass;
@class SpriteClass;

@interface GameLayer : CCLayer <UIAccelerometerDelegate> {
    PlayerClass* player;
    NSMutableArray *sprites;
    NSMutableArray *images;
}

@end
