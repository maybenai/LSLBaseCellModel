//
//  UIColor+LSColor.m
//  集创家
//
//  Created by lisonglin on 08/05/2017.
//  Copyright © 2017 lisonglin. All rights reserved.
//

#import "UIColor+LSColor.h"

@implementation UIColor (LSColor)

+ (UIColor *)colorWithLSString:(NSString *)color
{
    return [self colorWithLSString:color alpha:1];
}


+ (UIColor *)colorWithLSString:(NSString *)color alpha:(CGFloat)alpha
{
    NSString * cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    if (cString.length < 6) {
        return [UIColor clearColor];
    }
    
    if ([cString hasPrefix:@"0X"]) {
        cString = [cString substringFromIndex:2];
    }
    if ([cString hasPrefix:@"#"]) {
        cString = [cString substringFromIndex:1];
    }
    
    if (cString.length < 6) {
        return [UIColor clearColor];
    }
    
    NSRange range;
    range.location = 0;
    range.length = 2;
    
    //r
    NSString * rString = [cString substringWithRange:range];
    
    //g
    range.location = 2;
    NSString * gString = [cString substringWithRange:range];
    
    //b
    range.location = 4;
    NSString * bString = [cString substringWithRange:range];
    
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    
    return [UIColor colorWithRed:(float)r / 255.0  green:(float)g / 255.0 blue:(float)b / 255.0 alpha:alpha];
}


@end
