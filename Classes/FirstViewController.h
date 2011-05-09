//
//  FirstViewController.h
//  Three20PhotoGallery
//
//  Created by Patrick Breiter on 10.01.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Three20PhotoGalleryAppDelegate.h"

@class Three20PhotoGalleryAppDelegate;

@interface FirstViewController : UIViewController {
	
	UITextField				*textField;
	UIButton				*cmdButton;
	UIView					*myView;
	Three20PhotoGalleryAppDelegate	*delegateRef;
	
}

@property (nonatomic, retain) 	UITextField				*textField;
@property (nonatomic, retain)	UIButton				*cmdButton;
@property (nonatomic, retain)	UIView					*myView;
@property (nonatomic, assign)	Three20PhotoGalleryAppDelegate	*delegateRef;
@end