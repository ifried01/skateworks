//
//  MyCocos2DClass.h
//  Comp50Game
//
//  Created by Eric Douglas on 5/2/12.
//  Copyright 2012 Tufts University. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "SceneManager.h"

@interface MenuLayer : CCLayer {
    CCLayer* game;
    CCLayer* instructions;
    //CCSprite* background;
}

- (void)onNewGame:(id)sender;
- (void)onInstructions:(id)sender;
- (void)onHighscore:(id)sender;


@end
