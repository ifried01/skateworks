//
//  RoadClass.h
//  Comp50Game
//
//  Created by Eric Douglas on 5/2/12.
//  Copyright 2012 Tufts University. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface RoadClass : CCSprite {
    int speed;
    int x;
    int y;
    bool gone;
    
}

- (int)getRoadx;
- (int)setRoadx;
- (int)getRoady;
- (id)initWithFile:(NSString*)filename atPositionx:(int)xCoord atPositiony:(int)yCoord;

@end
