//
//  PhotoSource.h
//  Three20PhotoGallery
//
//  Created by Patrick Breiter on 09.01.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <Three20/Three20.h>
#import <Three20/Three20+Additions.h>

typedef enum {
	PhotoSourceNormal = 0,
	PhotoSourceDelayed = 1,
	PhotoSourceVariableCount = 2,
	PhotoSourceLoadError = 4,
} PhotoSourceType;

@interface PhotoSource : TTURLRequestModel <TTPhotoSource> {
	PhotoSourceType _type;
	NSString* _title;
	NSMutableArray* _photos;
	NSArray* _tempPhotos;
	NSTimer* _fakeLoadTimer;
}

- (id)initWithType:(PhotoSourceType)type title:(NSString*)title
			photos:(NSArray*)photos photos2:(NSArray*)photos2;

@end
