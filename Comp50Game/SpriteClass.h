//
//  PlayerClass.h
//  Comp50Game
//
//  Created by Eric Douglas on 4/20/12.
//  Copyright 2012 Tufts University. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"


// HelloWorldLayer
@interface SpriteClass : CCSprite
{
    int speed;
    int x;
    int y;
    int lane;
}

- (int)getSpritex;
- (int)getSpritey;
- (id)initWithFile:(NSString*)filename;
- (int)setCarx;
- (int)getLane;
// returns a CCScene that contains the HelloWorldLayer as the only child


@end
