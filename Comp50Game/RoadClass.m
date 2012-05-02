//
//  RoadClass.m
//  Comp50Game
//
//  Created by Eric Douglas on 5/2/12.
//  Copyright 2012 Tufts University. All rights reserved.
//

#import "RoadClass.h"


@implementation RoadClass

- (id)initWithFile:(NSString *)filename atPositionx:(int)xCoord atPositiony:(int)yCoord {
    if( self = [super initWithFile:filename]) {
        
        //NSInteger i = arc4random()%5 + 1;
        //= [NSArray arrayWithObjects:25, 80, 135, 190, nil];
        [self schedule:@selector(update:) interval:1.0/60];
        [self setPosition:ccp(xCoord, yCoord)];
        x = xCoord;
        y = yCoord;
        speed = 2;        
    }
    return self;
}
/*
- (void)writeCrap {
    // Writing
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:highScore forKey:@"highScore"];
    [defaults synchronize];
    
    // Reading
    int savedHS = [defaults integerForKey:@"highScore"];
}
*/

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



- (void)update:(ccTime)dt {
    [self setRoadx];
    [self setPosition:ccp(x, y)];
    
}

- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	[super dealloc];
}

@end
