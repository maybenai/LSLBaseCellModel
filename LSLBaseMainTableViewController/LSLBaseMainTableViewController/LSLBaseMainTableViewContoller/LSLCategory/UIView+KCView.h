//
//  UIView+KCView.h
//  集创家
//
//  Created by lisonglin on 08/05/2017.
//  Copyright © 2017 lisonglin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (KCView)

@property(nonatomic, assign) CGFloat width;
@property(nonatomic, assign) CGFloat height;
@property(nonatomic, assign) CGFloat x;
@property(nonatomic, assign) CGFloat y;

@end



@interface CALayer (LSFrame)

@property(nonatomic, assign) CGFloat ls_width;
@property(nonatomic, assign) CGFloat ls_height;
@property(nonatomic, assign) CGFloat ls_x;
@property(nonatomic, assign) CGFloat ls_y;

@end
