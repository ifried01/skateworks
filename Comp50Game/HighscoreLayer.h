//
//  HighscoreLayer.h
//  Comp50Game
//
//  Created by Eric Douglas on 5/3/12.
//  Copyright 2012 Tufts University. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "SceneManager.h"

@interface HighscoreLayer : CCLayer {
    CCLabelTTF* score1;
    CCLabelTTF* score2;
    CCLabelTTF* score3;
}

-(void) back: (id) sender;
-(void) restart: (id) sender;

@end
