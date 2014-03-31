//
//  MF5FeedViewController.m
//  Endless
//
//  Created by John Gulbronson on 3/28/14.
//  Copyright (c) 2014 John Gulbronson. All rights reserved.
//

#import "MF5FeedViewController.h"
#import "MF5ReloadingViewController.h"
#import "MF5LoadingViewController.h"
#import "UIView+FrameHelp.h"

#define PULL_TO_RELOAD_HEIGHT 30.0

@interface MF5FeedViewController () <UIScrollViewDelegate>

@property (nonatomic,weak) IBOutlet UIScrollView *scrollView;

@property (nonatomic,strong) MF5ReloadingViewController *reloadingVC;
@property (nonatomic,strong) MF5LoadingViewController *loadingVC;

@property (nonatomic) BOOL showReload;
@property (nonatomic) BOOL showLoading;

@end

@implementation MF5FeedViewController

- (MF5ReloadingViewController *)reloadingVC
{
    if(!_reloadingVC){
        _reloadingVC = [[MF5ReloadingViewController alloc] init];
    }
    return _reloadingVC;
}

- (MF5LoadingViewController *)loadingVC
{
    if(!_loadingVC){
        _loadingVC = [[MF5LoadingViewController alloc] init];
    }
    return _loadingVC;
}

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
    // Do any additional setup after loading the view from its nib.
    self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.size.width, self.scrollView.frame.size.height + 10);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)reload
{
    [self.feed reset];

    // recognize feed reset
    if([self.delegate respondsToSelector:@selector(mf5FeedVC:loadedFeed:)])
        [self.delegate mf5FeedVC:self loadedFeed:self.feed];
    
    // start loading more
    [self loadMore];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offest = scrollView.contentOffset.y;
    CGFloat contentHeight = scrollView.contentSize.height;
    
    NSLog(@"%.1f",offest);
    /*
    if(offest < 0){
        if(!self.showReload){
            self.showReload = YES;
            [scrollView addSubview:self.reloadingVC.view];
            self.reloadingVC.view.frame = CGRectMake(0, -self.reloadingVC.view.height, scrollView.width, self.reloadingVC.view.height);
            self.scrollView.contentInset = UIEdgeInsetsMake(self.reloadingVC.view.height, 0, scrollView.contentInset.bottom, 0);
        }
    }
    */
    if(offest + scrollView.frame.size.height - contentHeight >= 0){
        if(!self.feed.loading && !self.feed.endOfFeed){
            [self loadMore];
        }
    }
}

- (void)setShowLoading:(BOOL)showLoading
{
    // show loading
    _showLoading = showLoading;
    if(showLoading){
        [self.scrollView addSubview:self.loadingVC.view];
        self.loadingVC.view.y = self.scrollView.contentSize.height;
        self.loadingVC.loading = YES;
        self.scrollView.contentInset = UIEdgeInsetsMake(self.scrollView.contentInset.top, 0, self.loadingVC.view.height, 0);
    }else{
        self.loadingVC.loading = NO;
        [self.loadingVC.view removeFromSuperview];
        [UIView animateWithDuration:0.35 animations:^{
            self.scrollView.contentInset = UIEdgeInsetsMake(self.scrollView.contentInset.top, 0, 0, 0);
        }];
    }
}

- (void)loadMore
{
    // show loading view
    self.showLoading = YES;

    __weak MF5Feed *feed = self.feed;
    [self.feed loadMoreInBackground:^{
        [self.delegate mf5FeedVC:self loadedFeed:feed];
        self.loadingVC.view.y = self.scrollView.contentSize.height;
        
        if([self.delegate respondsToSelector:@selector(mf5FeedVC:loadedFeed:)])
           [self.delegate mf5FeedVC:self loadedFeed:feed];
        
        // prepare end of feed
        if(self.feed.endOfFeed){
            if([self.delegate respondsToSelector:@selector(mf5FeedVC:reachedEndOfFeed:)])
                [self.delegate mf5FeedVC:self reachedEndOfFeed:feed];
            self.showLoading = NO;
        }
    }];
}

- (IBAction)reloadPressed:(id)sender
{
    [self reload];
}

@end
