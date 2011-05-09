//
//  Three20PhotoGalleryAppDelegate.h
//  Three20PhotoGallery
//
//  Created by Patrick Breiter on 09.01.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "AlbumController.h"
#import "SecondViewController.h"
#import "FirstViewController.h"
#import "ThirdViewController.h"

@class TabBarAppViewController;
@class AlbumController;
@class SecondViewController;
@class FirstViewController;
@class ThirdViewController;

@interface Three20PhotoGalleryAppDelegate : NSObject <UIApplicationDelegate> {
    
    UIWindow *window;
	UITabBarController *tabBarController;
    AlbumController *albumController;
	FirstViewController *firstViewController;
    SecondViewController *secondViewController;
	ThirdViewController *thirdViewController;
	
@private
    NSManagedObjectContext *managedObjectContext_;
    NSManagedObjectModel *managedObjectModel_;
    NSPersistentStoreCoordinator *persistentStoreCoordinator_;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) UITabBarController *tabBarController;
@property (nonatomic, retain) AlbumController *albumController;
@property (nonatomic, retain) SecondViewController *secondViewController;
@property (nonatomic, retain) FirstViewController *firstViewController;
@property (nonatomic, retain) ThirdViewController *thirdViewController;


@property (nonatomic, retain, readonly) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain, readonly) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, retain, readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (NSURL *)applicationDocumentsDirectory;
- (void)saveContext;

@end

