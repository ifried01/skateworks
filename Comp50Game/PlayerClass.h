//
//  HelloWorldLayer.h
//  Comp50Game
//
//  Created by Eric Douglas on 4/13/12.
//  Copyright Tufts University 2012. All rights reserved.
//


// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"

// HelloWorldLayer
@interface PlayerClass : CCSprite
{
    int x;
    int y;
    bool up;
    bool down;
    float speed;
    bool collide;
    bool jumping;
    double stoked;
}   

- (int)getPlayery;
- (int)getPlayerx;
- (id)initWithFile:(NSString*)filename;
- (void)setUpDown:(double)acceleration;
- (void)setUD:(double)acceleration;
- (int)setPlayery;
- (bool)setCollide:(bool)collided;
- (bool)getCollide;
-(void) setPlayermove:(float) move;
-(void) jump;
-(double)getPlayerstoked;
-(bool)getJump;

@end
