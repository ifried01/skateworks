//
//  HelloWorldLayer.m
//  Comp50Game
//
//  Created by Eric Douglas on 4/13/12.
//  Copyright Tufts University 2012. All rights reserved.
//


// Import the interfaces
#import "HelloWorldLayer.h"

// HelloWorldLayer implementation
@implementation HelloWorldLayer

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	HelloWorldLayer *layer = [HelloWorldLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init])) {
		self.isTouchEnabled = YES;
        CCSprite* icon = [CCSprite spriteWithFile:@"Icon.png"];
        [icon setPosition:ccp(50, 50)];
        [self addChild:icon];
        CCMoveTo* move = [CCMoveBy actionWithDuration:1.0f position:ccp(100,0)];
        CCAction* movereverse = [move reverse];
        CCSequence* seq = [CCSequence actions:move, movereverse, nil];
        CCRepeatForever* backandforth = [CCRepeatForever actionWithAction:seq];
        [icon runAction:backandforth];
        
			}
	return self;
}

-(void)ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event 
{
    UITouch* touch = [touches anyObject];
    CGPoint location = [[CCDirector sharedDirector] convertToGL:[touch locationInView:touch.view]];
    self.isTouchEnabled = YES;
    CCSprite* icon = [CCSprite spriteWithFile:@"Icon.png"];
    [icon setPosition:ccp(location.x, location.y)];
    [self addChild:icon];
    CCMoveTo* move = [CCMoveBy actionWithDuration:1.0f position:ccp(100,0)];
    CCAction* movereverse = [move reverse];
    CCSequence* seq = [CCSequence actions:move, movereverse, nil];
    CCRepeatForever* backandforth = [CCRepeatForever actionWithAction:seq];
    [icon runAction:backandforth];
    
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
