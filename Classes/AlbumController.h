//
//  AlbumController.h
//  Three20PhotoGallery
//
//  Created by Patrick Breiter on 09.01.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Three20/Three20.h>

@interface AlbumController : TTThumbsViewController {
	// images
	NSMutableArray *images;
	
	// parser
	NSXMLParser * rssParser;
	NSMutableArray * stories;
	NSMutableDictionary * item;
	NSString * currentElement;
	NSMutableString * currentImage;
	NSMutableString * currentCaption;
}

@property (nonatomic, retain) NSMutableArray *images;

@end
