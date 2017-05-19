//
//  UIColor+LSColor.h
//  集创家
//
//  Created by lisonglin on 08/05/2017.
//  Copyright © 2017 lisonglin. All rights reserved.
//  通过16进制设置颜色

#import <UIKit/UIKit.h>

@interface UIColor (LSColor)


/**
 通过16进制设置颜色

 @param color colorString
 @return color
 */
+ (UIColor *)colorWithLSString:(NSString *)color;

/**
 <#Description#>

 @param color 带alpha的通过16进制设置颜色
 @param alpha alpha
 @return color
 */
+ (UIColor *)colorWithLSString:(NSString *)color alpha:(CGFloat)alpha;

@end
