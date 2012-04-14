//
//  AppDelegate.h
//  Comp50Game
//
//  Created by Eric Douglas on 4/13/12.
//  Copyright Tufts University 2012. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RootViewController;

@interface AppDelegate : NSObject <UIApplicationDelegate> {
	UIWindow			*window;
	RootViewController	*viewController;
}

@property (nonatomic, retain) UIWindow *window;

@end
