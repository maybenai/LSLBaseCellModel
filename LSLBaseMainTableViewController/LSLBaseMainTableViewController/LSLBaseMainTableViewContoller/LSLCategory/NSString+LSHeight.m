//
//  NSString+LSHeight.m
//  LSLBaseMainTableViewController
//
//  Created by lisonglin on 19/05/2017.
//  Copyright © 2017 lisonglin. All rights reserved.
//

#import "NSString+LSHeight.h"

@implementation NSString (LSHeight)


- (CGFloat)ls_heightwithFont:(UIFont *)font constraintedToWidth:(CGFloat)width
{
    UIFont * textFont = font ? font : [UIFont systemFontOfSize:[UIFont systemFontSize]];
    
    NSMutableParagraphStyle * paragraph = [[NSMutableParagraphStyle alloc] init];
    
    paragraph.lineBreakMode = NSLineBreakByWordWrapping;
    
    NSDictionary * attributes = @{NSFontAttributeName:textFont,
                                  NSParagraphStyleAttributeName:paragraph};
    
    CGSize textSize = [self boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX) options:(NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingTruncatesLastVisibleLine) attributes:attributes context:nil].size;
    
    return textSize.height;
}

@end
