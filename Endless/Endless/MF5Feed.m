//
//  MF5Feed.m
//  Endless
//
//  Created by John Gulbronson on 3/28/14.
//  Copyright (c) 2014 John Gulbronson. All rights reserved.
//

#import "MF5Feed.h"

@interface MF5Feed ()

@property (nonatomic) BOOL endOfFeed;

@end

@implementation MF5Feed

- (id)init
{
    if(self = [super init]){
        self.skip = 25;
        self.max = 50;
    }
    return self;
}

- (NSArray *)objects
{
    if(!_objects)
        _objects = [NSArray array];
    return _objects;
}

- (void)loadMoreInBackground:(void(^)())completed
{
    // stop at end of feed
    if(self.endOfFeed || self.loading)
        return;
    
    self.loading = YES;
    
    // simulate loading
    double delayInSeconds = 1.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){

        // add fake objects
        NSMutableArray *newObjects = self.objects.mutableCopy;
        for (NSInteger i=0; i<self.skip; i++) {
            [newObjects addObject:[NSString stringWithFormat:@"Item - %u",newObjects.count + 1]];
        }
        self.objects = newObjects;
        
        // mark end of feed
        if((self.objects.count >= self.max && self.max) || newObjects.count < self.skip)
            self.endOfFeed = YES;
        
        
        self.loading = NO;

        // retrieved new objects
        if(completed)
            completed();
    });
}

- (void)reset
{
    // clear objects
    self.objects = nil;
    
    // no longer at end
    self.endOfFeed = NO;
}

@end
