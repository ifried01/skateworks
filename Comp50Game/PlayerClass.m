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

- (int) getPlayerx {
    return x;
}

- (void)setUpDown:(double)acceleration {
    if (acceleration < -0.15 && acceleration > -0.65) {
        up = true;
        down = false;
        speed = 3;
    }
    else if (acceleration > 0.15 && acceleration < 0.65) {
        down = true;
        up = false;
        speed = 3;
    }
   else if (acceleration <= -0.65 && acceleration > -1) {
        up = true;
        down = false;
       speed = 6;
    }
   else if (acceleration >= 0.65 && acceleration < 1) {
       up = false;
       down = true;
       speed = 6;
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
    if (down == true && y < 280) {
        y = y + speed;
        //down = false;
        //up = false;
    }
    else if (up == true && y > 35) {
        y = y - speed;
        //down = false;
        //up = false;
    }
    
    return y;
}

- (id)initWithFile:(NSString *)filename {
    if( self = [super initWithFile:filename]) {
        [self schedule:@selector(update:) interval:1.0/60];
        [self setPosition:ccp(70, 160)];
        up = false;
        down = false;
        speed = 3;
        x = 50;
        y = 160;
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
    //NSLog(@"Collide = %d", (int)collide);
    
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

