//
//  MF5LoadingViewController.m
//  Endless
//
//  Created by John Gulbronson on 3/30/14.
//  Copyright (c) 2014 John Gulbronson. All rights reserved.
//

#import "MF5LoadingViewController.h"

@interface MF5LoadingViewController ()

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activitityIndicator;

@end

@implementation MF5LoadingViewController

- (id)init
{
    if(self = [super initWithNibName:@"LoadingView" bundle:nil]){
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.loading = NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setLoading:(BOOL)loading
{
    _loading = loading;
    if(loading){
        [self.activitityIndicator startAnimating];
        self.activitityIndicator.alpha = 1.0;
    }else{
        [self.activitityIndicator stopAnimating];
        self.activitityIndicator.alpha = 0.0;
    }
}

@end
