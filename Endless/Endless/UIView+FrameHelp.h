//
//  UIView+FrameHelp.h
//  SeatSideService
//
//  Created by John Gulbronson on 12/28/12.
//  Copyright (c) 2012 SeatSideService. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (FrameHelp)

- (CGFloat)x;
- (CGFloat)y;
- (CGFloat)width;
- (CGFloat)height;
- (CGFloat)bottom;
- (CGFloat)top;
- (CGFloat)right;
- (CGFloat)left;
- (void)setY:(CGFloat)y;
- (void)setX:(CGFloat)x;
- (void)setBottom:(CGFloat)bottom resize:(BOOL)resize;
- (void)setTop:(CGFloat)top resize:(BOOL)resize;
- (void)setHeight:(CGFloat)height;
- (void)setWidth:(CGFloat)width;
- (void)setWitdh:(CGFloat)width;
- (void)setOrigin:(CGPoint)origin;
- (void)setSize:(CGSize)size;
- (void)centerHorizontal;
- (void)centerVertical;
- (void)centerView;
- (void)hideAnimated;
- (void)showAnimated;
- (void)logFrame;

@end
