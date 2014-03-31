//
//  MF5ItemsViewController.m
//  Endless
//
//  Created by John Gulbronson on 3/30/14.
//  Copyright (c) 2014 John Gulbronson. All rights reserved.
//

#import "MF5ItemsViewController.h"

@interface MF5ItemsViewController () <MF5FeedTableDelegate>

@end

@implementation MF5ItemsViewController

+ (MF5ItemsViewController *)viewController
{
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Items" bundle:nil];
    return [storyBoard instantiateInitialViewController];
}

- (void)loadView
{
    [super loadView];
    self.delegate = self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.feed = [[MF5Feed alloc] init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)reload
{
    [super reload];

}

- (UITableViewCell *)mf5FeedTableVC:(MF5FeedTableViewController *)feedTableVC
                      cellForObject:(NSString *)object
                        atIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [feedTableVC.tableView dequeueReusableCellWithIdentifier:@"ItemCell"];
    UILabel *label = (UILabel *)[cell viewWithTag:1];
    label.text = object;
    return cell;
}

@end
