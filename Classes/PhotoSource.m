//
//  PhotoSource.m
//  Three20PhotoGallery
//
//  Created by Patrick Breiter on 09.01.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "PhotoSource.h"

@implementation PhotoSource
@synthesize title = _title;

- (void)fakeLoadReady {
    _fakeLoadTimer = nil;
	
    if (_type & PhotoSourceLoadError) {
		[_delegates makeObjectsPerformSelector: @selector(model:didFailLoadWithError:)
									withObject: self
									withObject: nil];
    } else {
		NSMutableArray* newPhotos = [NSMutableArray array];
		
		for (int i = 0; i < _photos.count; ++i) {
			id<TTPhoto> photo = [_photos objectAtIndex:i];
			if ((NSNull*)photo != [NSNull null]) {
				[newPhotos addObject:photo];
			}
		}
		
		[newPhotos addObjectsFromArray:_tempPhotos];
		TT_RELEASE_SAFELY(_tempPhotos);
		
		[_photos release];
		_photos = [newPhotos retain];
		
		for (int i = 0; i < _photos.count; ++i) {
			id<TTPhoto> photo = [_photos objectAtIndex:i];
			if ((NSNull*)photo != [NSNull null]) {
				photo.photoSource = self;
				photo.index = i;
			}
		}
		
		[_delegates makeObjectsPerformSelector:@selector(modelDidFinishLoad:) withObject:self];
	}
}

- (id)initWithType:(PhotoSourceType)type title:(NSString*)title photos:(NSArray*)photos
		   photos2:(NSArray*)photos2 {
	if (self = [super init]) {
		_type = type;
		_title = [title copy];
		_photos = photos2 ? [photos mutableCopy] : [[NSMutableArray alloc] init];
		_tempPhotos = photos2 ? [photos2 retain] : [photos retain];
		_fakeLoadTimer = nil;
		
		for (int i = 0; i < _photos.count; ++i) {
			id<TTPhoto> photo = [_photos objectAtIndex:i];
			if ((NSNull*)photo != [NSNull null]) {
				photo.photoSource = self;
				photo.index = i;
			}
		}
		
		if (!(_type & PhotoSourceDelayed || photos2)) {
			[self performSelector:@selector(fakeLoadReady)];
		}
	}
	return self;
}

- (id)init {
	return [self initWithType:PhotoSourceNormal title:nil photos:nil photos2:nil];
}

- (void)dealloc {
	[_fakeLoadTimer invalidate];
	TT_RELEASE_SAFELY(_photos);
	TT_RELEASE_SAFELY(_tempPhotos);
	TT_RELEASE_SAFELY(_title);
	[super dealloc];
}

- (BOOL)isLoading {
	return !!_fakeLoadTimer;
}

- (BOOL)isLoaded {
	return !!_photos;
}

- (void)load:(TTURLRequestCachePolicy)cachePolicy more:(BOOL)more {
	if (cachePolicy & TTURLRequestCachePolicyNetwork) {
		[_delegates makeObjectsPerformSelector:@selector(modelDidStartLoad:) withObject:self];
		
		TT_RELEASE_SAFELY(_photos);
		_fakeLoadTimer = [NSTimer scheduledTimerWithTimeInterval:2 target:self
														selector:@selector(fakeLoadReady) userInfo:nil repeats:NO];
	}
}

- (void)cancel {
	[_fakeLoadTimer invalidate];
	_fakeLoadTimer = nil;
}

- (NSInteger)numberOfPhotos {
	if (_tempPhotos) {
		return _photos.count + (_type & PhotoSourceVariableCount ? 0 : _tempPhotos.count);
	} else {
		return _photos.count;
	}
}

- (NSInteger)maxPhotoIndex {
	return _photos.count-1;
}

- (id<TTPhoto>)photoAtIndex:(NSInteger)photoIndex {
	if (photoIndex < _photos.count) {
		id photo = [_photos objectAtIndex:photoIndex];
		if (photo == [NSNull null]) {
			return nil;
		} else {
			return photo;
		}
	} else {
		return nil;
	}
}

@end
