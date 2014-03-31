//
//  MF5Feed.h
//  Endless
//
//  Created by John Gulbronson on 3/28/14.
//  Copyright (c) 2014 John Gulbronson. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum MF5FeedState : NSInteger MF5FeedState;

enum MF5FeedState : NSInteger {
    MF5FeedLoading = 0,
    MF5FeedFailed = 1,
    MF5FeedWaiting = 2
};

@interface MF5Feed : NSObject

// list of objects in feed
@property (nonatomic,strong) NSArray *objects;

// number of new object to fetch and maximum
@property (nonatomic) NSInteger skip;
@property (nonatomic) NSInteger max;
@property (nonatomic) BOOL loading;

@property (nonatomic) MF5FeedState state;

// load more objects in background
- (void)loadMoreInBackground:(void(^)())completed;

// indicates end of feed
- (BOOL)endOfFeed;

// reset the feed
- (void)reset;

@end
