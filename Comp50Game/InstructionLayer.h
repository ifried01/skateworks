//
//  InstructionLayer.h
//  Comp50Game
//
//  Created by Eric Douglas on 5/2/12.
//  Copyright 2012 Tufts University. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface InstructionLayer : CCLayer {
    CCSprite* background;
    CCSprite* text;
}

+(CCScene *) scene;

@end
