//
//  MF5FeedCollectionViewController.h
//  Endless
//
//  Created by John Gulbronson on 3/28/14.
//  Copyright (c) 2014 John Gulbronson. All rights reserved.
//

#import "MF5FeedViewController.h"

@class MF5FeedCollectionViewController;

@protocol MF5FeedCollectionDelegate <MF5FeedDelegate>

@optional
- (UICollectionViewCell *)mf5FeedCollectionVC:(MF5FeedCollectionViewController *)feedCollectionVC
                                cellForObject:(id)object
                                  atIndexPath:(NSIndexPath *)indexPath;

@end

@interface MF5FeedCollectionViewController : MF5FeedViewController <MF5FeedDelegate,UICollectionViewDataSource,UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (nonatomic,weak) IBOutlet id <MF5FeedCollectionDelegate> delegate;

@end
