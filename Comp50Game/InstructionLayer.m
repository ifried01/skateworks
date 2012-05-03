//
//  InstructionLayer.m
//  Comp50Game
//
//  Created by Eric Douglas on 5/2/12.
//  Copyright 2012 Tufts University. All rights reserved.
//

#import "InstructionLayer.h"


@implementation InstructionLayer

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	InstructionLayer *instructionLayer = [InstructionLayer node];
    
	// add layer as a child to scene
    [scene addChild: instructionLayer];
	
	// return the scene
	return scene;
}

-(id) init{
    self = [super init];
    
    CCSprite* bg = [[CCSprite alloc] initWithFile:@"instructionbg.png"];
    [bg setPosition:ccp(240, 160)];
    //background = bg;
    [self addChild: bg z:-1];
    
    
    
    
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
