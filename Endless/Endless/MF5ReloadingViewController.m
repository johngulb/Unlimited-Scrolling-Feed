//
//  MF5ReloadingViewController.m
//  Endless
//
//  Created by John Gulbronson on 3/29/14.
//  Copyright (c) 2014 John Gulbronson. All rights reserved.
//

#import "MF5ReloadingViewController.h"

enum MF5ReloadState : NSInteger {
    MF5ReloadWaiting = 0,
    MF5ReloadReloading = 1,
    MF5ReloadFinished = 2
};

@interface MF5ReloadingViewController ()

@property (weak, nonatomic) IBOutlet UILabel *reloadLabel;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicatorView;

@property (nonatomic) MF5ReloadState state;

@end

@implementation MF5ReloadingViewController

- (id)init
{
    self = [super initWithNibName:@"ReloadingView" bundle:nil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
