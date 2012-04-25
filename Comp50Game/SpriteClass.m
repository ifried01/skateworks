
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


- (void)update:(ccTime)dt {
    // NSLog(@"Updating!");
    CCArray* deleteMe = [CCArray array];
    CCArray* sprites = [self children];
    if ([[SpriteClass self] children] != nil) {
        CCArray* playerArray = [[PlayerClass self] children];
        CCSprite* player = [playerArray objectAtIndex:0];
        for (int i = 0; i < [sprites count]; i++) {
            if (CGRectIntersectsRect([[sprites objectAtIndex:i] boundingBox], [player boundingBox])) {
                //NSLog(@"Colliding");
                [deleteMe addObject:player];
            }
        }
        for (int a = 0; a < [deleteMe count]; a++) {
            [self removeChild:[deleteMe objectAtIndex:a] cleanup:YES];
        }
    }
    NSInteger r = arc4random()%200 + 1;
    NSInteger c = arc4random()%100 + 1;
    if (c == 75) {
        CCSprite* icon = [CCSprite spriteWithFile:@"Icon-Small.png"];
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
}

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init])) {
        
        [self schedule:@selector(update:) interval:1.0/60];
        
		// self.isTouchEnabled = YES;
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
