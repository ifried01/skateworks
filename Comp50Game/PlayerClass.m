//
//  PlayerClass.m
//  Comp50Game
//
//  Created by Eric Douglas on 4/20/12.
//  Copyright 2012 Tufts University. All rights reserved.
//

#import "PlayerClass.h"


@implementation PlayerClass


-(double)getPlayerstoked {
    return stoked;
}
-(bool)getJump {
    return jumping;
}

- (int) getPlayery {
    return y;
}

- (int) getPlayerx {
    return x;
}

- (void)setUpDown:(double)acceleration {
    
    
    /*int direction = 1;
    double calibration = [[NSUserDefaults standardUserDefaults] doubleForKey:@"accel.x"];
    float calibRangeNeg = 1 - fabs(calibration);
    float calibRangePos = 1 - calibration;
    float acelx = acceleration * direction;
    //float accelx;
    float offset = calibration * (direction * -1 );*/
    /*if (acelx > calibration) {
        accelx = (acelx + offset)/(calibRangePos);
    }
    else if (acelx < calibration) {
        accelx = (acelx + offset)/(calibRangeNeg);
    }
    NSLog(@"%f", accelx);*/
    float accelx = acceleration;
    
    if (accelx < -0.15 && accelx > -0.70) {
        up = true;
        down = false;
        speed = 3;
    }
    else if (accelx > 0.15 && accelx < 0.70) {
        down = true;
        up = false;
        speed = 3;
    }
   else if (accelx <= -0.70 && accelx > -1) {
        up = true;
        down = false;
       speed = 6;
    }
   else if (accelx >= 0.70 && accelx < 1) {
       up = false;
       down = true;
       speed = 6;
   }
   else {
       up = false;
       down = false;
   }
    
}

-(void) jump {
    jumping = true;
    id action1 = [CCScaleBy actionWithDuration:0.6 scale:1.8];
    id action2 = [CCScaleBy actionWithDuration:0.6 scale:0.5555];
    [self runAction:[CCSequence actions:action1, action2, nil]];
    stoked = 16.2;
}

- (void)setUD:(double)acceleration {
    double callib = [[NSUserDefaults standardUserDefaults] doubleForKey:@"accel.x"];
    if (acceleration < callib && fabs(fabs(callib) - fabs(acceleration)) > 0.30 && fabs(fabs(callib) - fabs(acceleration)) < 0.65) {
        down = false;
        up = true;
        speed = 3;
    }
    else if (acceleration > callib && fabs(fabs(callib) - fabs(acceleration)) > 0.30 && fabs(fabs(callib) - fabs(acceleration)) < 0.65) {
        down = true;
        up = false;
        speed = 3;
    }
    else if (acceleration > callib && fabs(fabs(callib) - fabs(acceleration)) >= 0.65 && fabs(fabs(callib) - fabs(acceleration)) < 1) {
        down = true;
        up = false;
        speed = 5;
    }
    else if (acceleration < callib && fabs(fabs(callib) - fabs(acceleration)) >= 0.65 && fabs(fabs(callib) - fabs(acceleration)) < 1) {
        down = false;
        up = true;
        speed = 5;
    }
    else {
        down = false;
        up = true;
    }
    
}


- (bool) setCollide:(bool)collided {
    collide = collided;
    return collide;
}

- (bool) getCollide {
    return collide;
}

-(void) setPlayermove:(float) move {
    y = y + move;
}

- (int) setPlayery {
    if (down == true && y < 280 && !jumping) {
        y = y + speed;
        //down = false;
        //up = false;
    }
    else if (up == true && y > 35 && !jumping) {
        y = y - speed;
        //down = false;
        //up = false;
    }
    NSLog(@"%f", speed);
    
    return y;
}

- (id)initWithFile:(NSString *)filename {
    if( self = [super initWithFile:filename]) {
        [self schedule:@selector(update:) interval:1.0/60];
        [self setPosition:ccp(60, 160)];
        up = false;
        down = false;
        jumping = false;
        speed = 0;
        stoked = 0.5;
        x = 60;
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
    if (stoked < 15) {
        jumping = false;
    }
    [self setPlayery];
    [self setPosition:ccp(x, y)];
    stoked -= dt;
    //NSLog(@"Stokage = %d", (int)stoked);
    
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

