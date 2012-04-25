//
//  PlayerClass.m
//  Comp50Game
//
//  Created by Eric Douglas on 4/20/12.
//  Copyright 2012 Tufts University. All rights reserved.
//

#import "PlayerClass.h"


@implementation PlayerClass

- (id)initWithFile:(NSString *)filename {
    if( self = [super initWithFile:filename]) {
        [self schedule:@selector(update:) interval:1.0/60];
        [self setPosition:ccp(50, 50)];
        up = false;
        down = false;
        speed = 10;
        
    }
    return self;
}
/*
-(void)ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event 
{
    UITouch* touch = [touches anyObject];
    CGPoint location = [[CCDirector sharedDirector] convertToGL:[touch locationInView:touch.view]];
    CCSprite* mover = [[self children] objectAtIndex:0];
    CCMoveTo* move = [CCMoveTo actionWithDuration:1.0f position:ccp(location.x,location.y)];
    [mover runAction:move];
    [mover setPosition:ccp(location.x, location.y)];
}*/

- (void)update:(ccTime)dt {
    if (up == true) {
        
    }
    
}


// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	[super dealloc];
}


@end

