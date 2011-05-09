//
//  Three20PhotoGalleryAppDelegate.m
//  Three20PhotoGallery
//
//  Created by Patrick Breiter on 09.01.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Three20PhotoGalleryAppDelegate.h"
#import "AlbumController.h"
#import "SecondViewController.h"
#import "FirstViewController.h"
#import "ThirdViewController.h"
#import <Three20/Three20.h>

@implementation Three20PhotoGalleryAppDelegate

@synthesize window;
@synthesize albumController;
@synthesize firstViewController;
@synthesize secondViewController;
@synthesize tabBarController;
@synthesize thirdViewController; 

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
	
	// set up tab bar controller
	tabBarController = [[UITabBarController alloc] init];        
	
	albumController = [[AlbumController alloc] init];  
	
	firstViewController = [[FirstViewController alloc] init]; 
	firstViewController.title = @"First View";
	
	secondViewController = [[SecondViewController alloc] init];  
	secondViewController.title = @"Second View";
	
	thirdViewController = [[ThirdViewController alloc] initWithNibName:@"ThirdViewController" bundle:nil];
	thirdViewController.title = @"Third View";
	
	UINavigationController* navController = [[[UINavigationController alloc] initWithRootViewController:albumController] autorelease];
	UINavigationController* navController2 = [[[UINavigationController alloc] initWithRootViewController:thirdViewController] autorelease];

	
	tabBarController.viewControllers = [NSArray arrayWithObjects:firstViewController, secondViewController, navController, navController2, nil]; 	
	
	[window addSubview:tabBarController.view];                                             
	[window makeKeyAndVisible];  
}

- (BOOL)application:(UIApplication*)application handleOpenURL:(NSURL*)URL {
	TTOpenURL([URL absoluteString]);
    return YES;
}

- (void)dealloc {
	[tabBarController release];
	[window release];
    [super dealloc];
}

@end