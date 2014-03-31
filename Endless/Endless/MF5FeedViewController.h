//
//  MF5FeedViewController.h
//  Endless
//
//  Created by John Gulbronson on 3/28/14.
//  Copyright (c) 2014 John Gulbronson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MF5Feed.h"

@class MF5FeedViewController;

@protocol MF5FeedDelegate <NSObject>

- (void)mf5FeedVC:(MF5FeedViewController *)feedVC loadedFeed:(MF5Feed *)feed;

@optional

// feed loading states
- (void)mf5FeedVC:(MF5FeedViewController *)feedVC startedLoadingFeed:(MF5Feed *)feed;
- (void)mf5FeedVC:(MF5FeedViewController *)feedVC failedLoadingFeed:(MF5Feed *)feed;
- (void)mf5FeedVC:(MF5FeedViewController *)feedVC reachedEndOfFeed:(MF5Feed *)feed;

// views to use
- (UIView *)mf5FeedVC:(MF5FeedViewController *)feedVC loadingViewForFeed:(MF5Feed *)feed;
- (UIView *)mf5FeedVC:(MF5FeedViewController *)feedVC noFeedViewForFeed:(MF5Feed *)feed;
- (UIView *)mf5FeedVC:(MF5FeedViewController *)feedVC endOfFeedViewForFeed:(MF5Feed *)feed;
- (UIView *)mf5FeedVC:(MF5FeedViewController *)feedVC failedLoadingViewForFeed:(MF5Feed *)feed;

@end

@interface MF5FeedViewController : UIViewController

@property (nonatomic,strong) MF5Feed *feed;

@property (nonatomic,weak) IBOutlet id <MF5FeedDelegate> delegate;

- (void)reload;

@end
