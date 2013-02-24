//
//  AppDelegate.h
//  Trip
//
//  Created by Fredrik Gadnell on 2/24/13.
//  Copyright __MyCompanyName__ 2013. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "cocos2d.h"

@interface AppController : NSObject <UIApplicationDelegate, CCDirectorDelegate>

@property (nonatomic, strong) UIWindow *window;
@property (readonly) UINavigationController *navigationController;

@end
