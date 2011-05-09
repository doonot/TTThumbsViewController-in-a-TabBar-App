    //
//  FirstViewController.m
//  Three20PhotoGallery
//
//  Created by Patrick Breiter on 10.01.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "FirstViewController.h"


@implementation FirstViewController


@synthesize textField;
@synthesize cmdButton;
@synthesize myView;
@synthesize delegateRef;

- (id)init
{
	if (self = [super init]) 
	{
		// Initialization code
		self.title = @"First View";
		self.hidesBottomBarWhenPushed = NO; 
		self.tabBarItem.image = [UIImage imageNamed:@"040-Wifi.png"];
	}
	return self;
}

- (void)loadView 
{
	// create and configure the view
	CGRect cgRct = CGRectMake(0.0, 0.0, 480, 320); //define size and position of view 
	myView = [[UIView alloc] initWithFrame:cgRct]; //initilize the view	
	myView.autoresizesSubviews = YES;              //allow it to tweak size of elements in view 
	self.view = myView;                            //set view property ov controller to the newly created view
	
	
	// create a UIButton (UIButtonTypeRoundedRect)
	cmdButton = [[UIButton buttonWithType:UIButtonTypeRoundedRect] retain];	
	cmdButton.frame = CGRectMake(100, 100, 100, 50);
	[cmdButton setTitle:@"Click Me" forState:UIControlStateNormal];
	cmdButton.backgroundColor = [UIColor clearColor];
	[cmdButton addTarget:self action:@selector(action:) forControlEvents:UIControlEventTouchUpInside];
	cmdButton.adjustsImageWhenHighlighted = YES;
	
	//create a text field
	cgRct = CGRectMake(60, 170, 200, 50); //define size and position of textbox
	textField = [[UITextField alloc] initWithFrame:cgRct];
	textField.text = @"Enter Text Here";
	textField.borderStyle = UITextBorderStyleBezel;
	
	
	[self.view addSubview:cmdButton];
	[self.view addSubview:textField];
}

- (void)action:(id)sender
{
	[self.textField resignFirstResponder];
	//self.delegateRef.secondViewController.label.text = self.textField.text;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation 
{
	// Return YES for supported orientations
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (void)didReceiveMemoryWarning 
{
	[super didReceiveMemoryWarning]; 
}


- (void)dealloc 
{
	[super dealloc];
}

