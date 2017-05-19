//
//  NSString+LSHeight.h
//  LSLBaseMainTableViewController
//
//  Created by lisonglin on 19/05/2017.
//  Copyright © 2017 lisonglin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (LSHeight)


/**
 根据字体大小和宽度约束返回高度

 @param font font
 @param width width
 @return 文本高度
 */
- (CGFloat)ls_heightwithFont:(UIFont *)font constraintedToWidth:(CGFloat)width;


@end
