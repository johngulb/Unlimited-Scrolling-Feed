//
//  MF5FeedTableViewController.h
//  Endless
//
//  Created by John Gulbronson on 3/28/14.
//  Copyright (c) 2014 John Gulbronson. All rights reserved.
//

#import "MF5FeedViewController.h"

@class MF5FeedTableViewController;

@protocol MF5FeedTableDelegate <MF5FeedDelegate>

@optional
- (UITableViewCell *)mf5FeedTableVC:(MF5FeedTableViewController *)feedTableVC
                   cellForObject:(id)object
                     atIndexPath:(NSIndexPath *)indexPath;

@end

@interface MF5FeedTableViewController : MF5FeedViewController <MF5FeedDelegate>

@property (nonatomic,weak) IBOutlet UITableView *tableView;

@property (nonatomic,weak) IBOutlet id <MF5FeedTableDelegate> delegate;

@end
