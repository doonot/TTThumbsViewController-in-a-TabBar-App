//
//  ThirdViewController.m
//  Three20PhotoGallery
//
//  Created by Patrick Breiter on 15.01.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ThirdViewController.h"

@implementation ThirdViewController

/*
- (id)init
{
	if (self = [super init]) 
	{
		// Initialization code
		self.title = @"Third View";
		self.hidesBottomBarWhenPushed = NO; 
		self.tabBarItem.image = [UIImage imageNamed:@"231-Cube.png"];
	}
	return self;
}*/

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
		// Initialization code
		self.title = @"Third View";
		self.hidesBottomBarWhenPushed = NO; 
		self.tabBarItem.image = [UIImage imageNamed:@"231-Cube.png"];
    }
    return self;
}


/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
