//
//  AlbumController.m
//  Three20PhotoGallery
//
//  Created by Patrick Breiter on 09.01.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//
#import "AlbumController.h"
#import "PhotoSource.h"
#import "Photo.h"

@implementation AlbumController
@synthesize images;

- (id)init
{
	if (self = [super init]) 
	{
		// Initialization code
		self.title = @"All in Vain";
		self.hidesBottomBarWhenPushed=NO;
		self.tabBarItem.image = [UIImage imageNamed:@"020-Appointment.png"];
	}
	return self;
}


- (void)viewDidLoad {

	[self createPhotos]; // method to set up the photos array
	self.photoSource = [[PhotoSource alloc]
						initWithType:PhotoSourceNormal
						title:@"All in Vain"
						photos:images
						photos2:nil];
}

-(void)createPhotos {
	if ([stories count] == 0) {
		NSString * path = @"http://www.allinvain.ch/rss/pictures.xml";
		[self parseXMLFileAtURL:path];
	}
	

	images = [NSMutableArray arrayWithCapacity:[stories count]]; // needs to be mutable
	
	for (int i=0; i< [stories count]; i++) {
        
		NSString * img = [[stories objectAtIndex:i] objectForKey:@"image"];
		img = [img stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]];
		
		NSString * caption = [[stories objectAtIndex:i] objectForKey:@"caption"];
		caption = [caption stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]];

		[images addObject:[[Photo alloc] initWithURL:img smallURL:img size:CGSizeMake(320, 212)]];
	}
}


#pragma mark -
#pragma mark XML Parser Implementation

- (void)parserDidStartDocument:(NSXMLParser *)parser{	
	//NSLog(@"found file and started parsing");
}

- (void)parseXMLFileAtURL:(NSString *)URL
{	
	stories = [[NSMutableArray alloc] init];
	
    //you must then convert the path to a proper NSURL or it won't work
    NSURL *xmlURL = [NSURL URLWithString:URL];
	
    // here, for some reason you have to use NSClassFromString when trying to alloc NSXMLParser, otherwise you will get an object not found error
    // this may be necessary only for the toolchain
    rssParser = [[NSXMLParser alloc] initWithContentsOfURL:xmlURL];
	
    // Set self as the delegate of the parser so that it will receive the parser delegate methods callbacks.
    [rssParser setDelegate:self];
	
    // Depending on the XML document you're parsing, you may want to enable these features of NSXMLParser.
    [rssParser setShouldProcessNamespaces:NO];
    [rssParser setShouldReportNamespacePrefixes:NO];
    [rssParser setShouldResolveExternalEntities:NO];
    [rssParser parse];
}

- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError {
	NSString * errorString = [NSString stringWithFormat:@"Leider ist es nicht möglich die Feeds zu laden. All in Vain Website nicht erreichbar! (Error code %i )", [parseError code]];
	//NSLog(@"error parsing XML: %@", errorString);
	
	UIAlertView * errorAlert = [[UIAlertView alloc] initWithTitle:@"Fehler beim laden der Feeds" message:errorString delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
	[errorAlert show];
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict{			
    //NSLog(@"found this element: %@", elementName);
	currentElement = [elementName copy];
	if ([elementName isEqualToString:@"item"]) {
		// clear out our story item caches...
		item = [[NSMutableDictionary alloc] init];
		currentCaption = [[NSMutableString alloc] init];
		//currentThumbnail = [[NSMutableString alloc] init];
		currentImage = [[NSMutableString alloc] init];
	}
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{     
	//NSLog(@"ended element: %@", elementName);
	if ([elementName isEqualToString:@"item"]) {
		// save values to an item, then store that item into the array...

		//[item setObject:currentThumbnail forKey:@"thumbnail"];
		[item setObject:currentCaption forKey:@"caption"];
		[item setObject:currentImage forKey:@"image"];
		
		[stories addObject:[item copy]];
	}	
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
	
	// save the characters for the current item...
	if ([currentElement isEqualToString:@"thumbnail"]) {
		//[currentThumbnail appendString:string];
	} else if ([currentElement isEqualToString:@"caption"]) {
		[currentCaption appendString:string];
	} else if ([currentElement isEqualToString:@"image"]) {
		[currentImage appendString:string];
	}
}

- (void)parserDidEndDocument:(NSXMLParser *)parser {
	NSLog(@"all done!");
	NSLog(@"stories array has %d items", [stories count]);
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	// Return YES for supported orientations
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


#pragma mark -
#pragma mark Memory Management

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
	// Release anything that's not essential, such as cached data
}

- (void)dealloc {
	
	[currentElement release];
	[rssParser release];
	[stories release];
	[item release];
	[currentCaption release];
	//[currentThumbnail release];
	[currentImage release];
	
	[super dealloc];
}

@end
