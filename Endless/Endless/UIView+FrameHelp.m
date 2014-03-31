//
//  UIView+FrameHelp.m
//  SeatSideService
//
//  Created by John Gulbronson on 12/28/12.
//  Copyright (c) 2012 SeatSideService. All rights reserved.
//

#import "UIView+FrameHelp.h"

@implementation UIView (FrameHelp)

- (CGFloat)x
{
    return self.frame.origin.x;
}

- (CGFloat)y
{
    return self.frame.origin.y;
}

- (CGFloat)width
{
    return self.frame.size.width;
}

- (CGFloat)height
{
    return self.frame.size.height;
}

- (CGFloat)bottom
{
    return self.frame.size.height + self.frame.origin.y;
}

- (CGFloat)top
{
    return self.frame.origin.y;
}

- (CGFloat)right
{
    return self.frame.size.width + self.frame.origin.x;
}

- (CGFloat)left
{
    return self.frame.origin.x;
}

- (void)setBottom:(CGFloat)bottom resize:(BOOL)resize
{
    CGRect frame = self.frame;
    CGFloat dB = self.bottom - bottom;
    
    if(resize)
        frame.size.height -= dB;
    else
        frame.origin.y -= dB;

    self.frame = frame;
}

- (void)setTop:(CGFloat)top resize:(BOOL)resize
{
    CGRect frame = self.frame;
    CGFloat dB = self.top - top;
    
    if(resize){
        frame.size.height += dB;
        frame.origin.y = top;
    }else
        frame.origin.y -= dB;
    
    self.frame = frame;
}

- (void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (void)setWitdh:(CGFloat)width{
    [self setWidth:width];
}

- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (void)setOrigin:(CGPoint)origin
{
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (void)setSize:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (void)centerHorizontal
{
    CGRect frame = self.frame;
    frame.origin.x = (self.superview.frame.size.width - frame.size.width)/2;
    self.frame = frame;
}

- (void)centerVertical
{
    CGRect frame = self.frame;
    frame.origin.y = (self.superview.frame.size.height - frame.size.height)/2;
    self.frame = frame;
}

- (void)centerView
{
    self.center = self.superview.center;
}

- (void)showAnimated
{
    [UIView animateWithDuration:0.25 animations:^{
        [self setAlpha:1.0];
    }];
}

- (void)hideAnimated
{
    [UIView animateWithDuration:0.25 animations:^{
        [self setAlpha:0];
    }];
}

- (void)logFrame
{
    NSLog(@"x: %.2f  y: %.2f  w: %.2f  h: %.2f",self.x,self.y,self.width,self.height);
}

@end
