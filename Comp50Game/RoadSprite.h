//
//  RoadSprite.h
//  Comp50Game
//
//  Created by Eric Douglas on 4/29/12.
//  Copyright 2012 Tufts University. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface RoadSprite : CCSprite {

    int speed;
    int x;
    int y;
    
}

- (int)getRoadx;
- (int)setRoadx;
- (int)getRoady;
- (id)initWithFile:(NSString*)filename int: yPosition;


@end
