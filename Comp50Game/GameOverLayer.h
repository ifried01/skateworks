//
//  GameOverLayer.h
//  Comp50Game
//
//  Created by Eric Douglas on 5/3/12.
//  Copyright 2012 Tufts University. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "SceneManager.h"
#import "GameLayer.h"

@interface GameOverLayer : CCLayer {
    CCLabelTTF* timerLabel;
}
-(void) back: (id) sender;
-(void) restart: (id) sender;
-(void) highscore: (id) sender;


@end
