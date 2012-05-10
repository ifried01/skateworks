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
    CCLabelTTF* pauseLabel;
    int finalTime;
    BOOL isPaused;
    CCLabelTTF *stokage;
    CCLabelTTF* stokeBuild;
    CCLabelTTF* wipeOut;
    float spawnTimer;
    double previousSpawn;
    int laneTimers[5];
    int defaultTimes[5];
    double calibration;
    double reference;
    double upper;
    double lower;
}

+(CCScene *) scene;
- (double)getFinaltime;
-(void) back: (id) sender;
-(void) restart: (id) sender;


@end
