//
//  UIView+KCView.m
//  集创家
//
//  Created by lisonglin on 08/05/2017.
//  Copyright © 2017 lisonglin. All rights reserved.
//

#import "UIView+KCView.h"

@implementation UIView (KCView)

- (void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)x
{
    return self.frame.origin.x;
}

- (void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)y
{
    return self.frame.origin.y;
}


- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)width
{
    return self.frame.size.width;
}

- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)height
{
    return self.frame.size.height;
}

@end



@implementation CALayer (LSFrame)

- (void)setLs_x:(CGFloat)ls_x
{
    CGRect frame = self.frame;
    frame.origin.x = ls_x;
    self.frame = frame;
}

- (CGFloat)ls_x
{
    return self.frame.origin.x;
}


- (void)setLs_y:(CGFloat)ls_y
{
    CGRect frame = self.frame;
    frame.origin.y = ls_y;
    self.frame = frame;
}

- (CGFloat)ls_y
{
    return self.frame.origin.y;
}


- (void)setLs_width:(CGFloat)ls_width
{
    CGRect frame = self.frame;
    frame.size.width = ls_width;
    self.frame = frame;
}

- (CGFloat)ls_width
{
    return self.frame.size.width;
}

- (void)setLs_height:(CGFloat)ls_height
{
    CGRect frame = self.frame;
    frame.size.height = ls_height;
    self.frame = frame;
}

- (CGFloat)ls_height
{
    return self.frame.size.height;
}

@end






