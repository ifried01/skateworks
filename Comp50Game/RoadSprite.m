//
//  RoadSprite.m
//  Comp50Game
//
//  Created by Eric Douglas on 4/29/12.
//  Copyright 2012 Tufts University. All rights reserved.
//

#import "RoadSprite.h"


@implementation RoadSprite


- (id)initWithFileRoad:(NSString *)filename {
    if( self = [super initWithFile:filename]) {
        
        //NSInteger i = arc4random()%5 + 1;
        //= [NSArray arrayWithObjects:25, 80, 135, 190, nil];
        [self setPosition:ccp(240, 3)];
        x = 240;
        y = 3;
        
        speed = 3;        
        
    }
    return self;
}


- (int)setRoadx {
    x = x - speed;
    return x;
}


- (int)getRoadx {
    return x;
}
- (int)getRoady {
    return y;
}



@end
