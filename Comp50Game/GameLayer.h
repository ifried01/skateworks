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
@class RoadClass;

@interface GameLayer : CCLayer <UIAccelerometerDelegate> {
    PlayerClass* player;
    NSMutableArray *sprites;
    NSMutableArray *images;
    NSString* roadImage;
    NSMutableArray* lanes;
    double gameTimer;
    CCLabelTTF* timerLabel;
    int finalTime;
    BOOL isPaused;
}

+(CCScene *) scene;
- (double)getFinaltime;
-(void) back: (id) sender;
-(void) restart: (id) sender;


@end
