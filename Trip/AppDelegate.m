//
//  AppDelegate.m
//  Trip
//
//  Created by Fredrik Gadnell on 2/24/13.
//  Copyright __MyCompanyName__ 2013. All rights reserved.
//

#import "cocos2d.h"
#import "CocosManager.h"
#import "AppDelegate.h"
#import "GameScene.h"

@implementation AppController

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
	// Create the main window
	self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    [[CocosManager shared] setupWithFrame:self.window.bounds];

	// and add the scene to the stack. The director will run it when it automatically when the view is displayed.
	[[CocosManager director] pushScene:[[GameScene alloc] init]];

	// Create a Navigation Controller with the Director
	_navigationController = [[UINavigationController alloc] initWithRootViewController:[CocosManager director]];
	self.navigationController.navigationBarHidden = YES;
	
	// set the Navigation Controller as the root view controller
	[self.window setRootViewController:self.navigationController];
	
	// make main window visible
	[self.window makeKeyAndVisible];
	
	return YES;
}

-(void) applicationWillResignActive:(UIApplication *)application
{
	if( [self.navigationController visibleViewController] == [CocosManager director] )
		[[CocosManager director] pause];
}

-(void) applicationDidBecomeActive:(UIApplication *)application
{
	if( [self.navigationController visibleViewController] == [CocosManager director] )
		[[CocosManager director] resume];
}

-(void) applicationDidEnterBackground:(UIApplication*)application
{
	if( [self.navigationController visibleViewController] == [CocosManager director] )
		[[CocosManager director] stopAnimation];
}

-(void) applicationWillEnterForeground:(UIApplication*)application
{
	if( [self.navigationController visibleViewController] == [CocosManager director] )
		[[CocosManager director] startAnimation];
}

- (void)applicationWillTerminate:(UIApplication *)application
{
	CC_DIRECTOR_END();
}

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application
{
	[[CCDirector sharedDirector] purgeCachedData];
}

-(void) applicationSignificantTimeChange:(UIApplication *)application
{
	[[CCDirector sharedDirector] setNextDeltaTimeZero:YES];
}

@end

