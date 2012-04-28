//
//  PlayerClass.m
//  Comp50Game
//
//  Created by Eric Douglas on 4/20/12.
//  Copyright 2012 Tufts University. All rights reserved.
//

#import "PlayerClass.h"


@implementation PlayerClass


- (int) getPlayery {
    return y;
}

- (void)setUpDown:(double)acceleration {
    if (acceleration < -0.1) {
        down = true;
        up = false;
    }
    else if (acceleration > 0.1) {
        up = true;
        down = false;
    }
   else {
        up = false;
        down = false;
    }
    
}


- (bool) setCollide:(bool)collided {
    collide = collided;
    return collide;
}

- (bool) getCollide {
    return collide;
}


- (int) setPlayery {
    if (down == true && y < 300) {
        y = y + speed;
        //down = false;
        //up = false;
    }
    else if (up == true && y > 20) {
        y = y - speed;
        //down = false;
        //up = false;
    }
    
    return y;
}

- (id)initWithFile:(NSString *)filename {
    if( self = [super initWithFile:filename]) {
        [self schedule:@selector(update:) interval:1.0/60];
        [self setPosition:ccp(50, 50)];
        up = false;
        down = false;
        speed = 3;
        x = 50;
        y = 50;
        collide = false;
        
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
    [self setPlayery];
    [self setPosition:ccp(x, y)];
    NSLog(@"Collide = %d", (int)collide);
    
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

