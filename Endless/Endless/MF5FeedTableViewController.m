//
//  MF5FeedTableViewController.m
//  Endless
//
//  Created by John Gulbronson on 3/28/14.
//  Copyright (c) 2014 John Gulbronson. All rights reserved.
//

#import "MF5FeedTableViewController.h"

@interface MF5FeedTableViewController () <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,weak) IBOutlet UITableView *scrollView;

@end

@implementation MF5FeedTableViewController

- (id)init
{
    if (self = [super initWithNibName:@"FeedTableView" bundle:nil]) {
        // Custom initialization
    }
    return self;
}

- (void)loadView
{
    [super loadView];
    self.feed = [[MF5Feed alloc] init];
    self.scrollView = self.tableView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)reload
{
    [super reload];
    [self.tableView reloadData];
}

#pragma mark Feed Delegate

- (void)mf5FeedVC:(MF5FeedViewController *)feedVC loadedFeed:(MF5Feed *)feed
{
    [self.tableView reloadData];
}

#pragma mark Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.feed.objects.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if([self.delegate respondsToSelector:@selector(mf5FeedTableVC:cellForObject:atIndexPath:)]){
        id object = [self.feed.objects objectAtIndex:indexPath.row];
        UITableViewCell *cell = [self.delegate mf5FeedTableVC:self cellForObject:object atIndexPath:indexPath];
        if([cell isKindOfClass:[UITableViewCell class]])
            return cell;
    }
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ErrorCell"];
    if(!cell)
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ErrorCell"];
    cell.textLabel.text = @"Error creating cell!";
    return cell;
}

@end
