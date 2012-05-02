
//
//  HelloWorldLayer.m
//  Comp50Game
//
//  Created by Eric Douglas on 4/13/12.
//  Copyright Tufts University 2012. All rights reserved.
//


// Import the interfaces
#import "PlayerClass.h"
#import "SpriteClass.h"


// HelloWorldLayer implementation
@implementation SpriteClass


//- (void)update:(ccTime)dt {
    
    //[self setSpritex];
    //[self setPosition:ccp(x, y)];
    // NSLog(@"Updating!");
    /*
    NSInteger r = arc4random()%200 + 1;
    NSInteger c = arc4random()%100 + 1;
    if (c == 75) {
        CCSprite* icon = [CCSprite spriteWithFile:@"car1.png"];
        [icon setPosition:ccp(500, r)];
        [self addChild:icon];
    }
    CCMoveTo* move = [CCMoveBy actionWithDuration:10.0f position:ccp(-700,0)];
    CCArray* dodg = [self children];
    for (int a =0; a < [dodg count]; a++) {
        [[dodg objectAtIndex:a] runAction:move];
    }
    //for (int b = 0; b < [sprites count]; b++) {
    //   if ([[sprites objectAtIndex:b] ]
    //}
     */
//}

- (int)setCarx {
    x = x - speed;
    return x;
}


- (int)getSpritex {
    return x;
}
- (int)getSpritey {
    return y;
}

// on "init" you need to initialize your instance
- (id)initWithFile:(NSString *)filename {
    if( self = [super initWithFile:filename]) {
        
        //NSInteger i = arc4random()%5 + 1;
        int i = rand() % 5 + 1;
        if (i == 5) {
            speed = 7;
        }
        else if (i == 1) {
            speed = 5;
        }
        else if (i == 4) {
            speed = 4;
        }
        else if (i == 3) {
            speed = 6;
        }
        else {
            speed = 3;
        }
         //= [NSArray arrayWithObjects:25, 80, 135, 190, nil];
        [self setPosition:ccp(500, i*54)];
        x = 500;
        y = 54*i;
        
        
    }
    return self;
}



- (void) myMethod:(ccTime)dt
{
    NSLog(@"Your method should do something every frame here...");
}

/*-(void)ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event 
 {
 UITouch* touch = [touches anyObject];
 CGPoint location = [[CCDirector sharedDirector] convertToGL:[touch locationInView:touch.view]];
 self.isTouchEnabled = YES;
 CCSprite* mover = [[self children] objectAtIndex:0];
 CCMoveTo* move = [CCMoveTo actionWithDuration:1.0f position:ccp(location.x,location.y)];
 [mover runAction:move];
 [mover setPosition:ccp(location.x, location.y)];
 
 
 CCSprite* icon2 = [CCSprite spriteWithFile:@"Icon.png"];
 [icon2 setPosition:ccp(location.x, location.y)];
 [self addChild:icon2];
 CCMoveTo* move = [CCMoveBy actionWithDuration:1.0f position:ccp(100,0)];
 CCAction* movereverse = [move reverse];
 CCSequence* seq = [CCSequence actions:move, movereverse, nil];
 CCRepeatForever* backandforth = [CCRepeatForever actionWithAction:seq];
 [icon2 runAction:backandforth];
 
 }*/

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
