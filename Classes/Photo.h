//
//  Photo.h
//  Three20PhotoGallery
//
//  Created by Patrick Breiter on 09.01.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <Three20/Three20.h>

@interface Photo : NSObject <TTPhoto> {
	id<TTPhotoSource> _photoSource;
	NSString* _thumbURL;
	NSString* _smallURL;
	NSString* _URL;
	CGSize _size;
	NSInteger _index;
	NSString* _caption;
}

- (id)initWithURL:(NSString*)URL smallURL:(NSString*)smallURL size:(CGSize)size;

- (id)initWithURL:(NSString*)URL smallURL:(NSString*)smallURL size:(CGSize)size
		  caption:(NSString*)caption;

@end
