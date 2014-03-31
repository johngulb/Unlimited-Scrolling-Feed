//
//  MF5FeedCollectionViewController.m
//  Endless
//
//  Created by John Gulbronson on 3/28/14.
//  Copyright (c) 2014 John Gulbronson. All rights reserved.
//

#import "MF5FeedCollectionViewController.h"

@interface MF5FeedCollectionViewController ()

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation MF5FeedCollectionViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
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

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    id object = [self.feed.objects objectAtIndex:indexPath.row];
    return [self.delegate mf5FeedCollectionVC:self cellForObject:object atIndexPath:indexPath];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.feed.objects.count;
}

- (void)mf5FeedVC:(MF5FeedViewController *)feedVC loadedFeed:(MF5Feed *)feed
{
    [self.collectionView reloadData];
}

@end
