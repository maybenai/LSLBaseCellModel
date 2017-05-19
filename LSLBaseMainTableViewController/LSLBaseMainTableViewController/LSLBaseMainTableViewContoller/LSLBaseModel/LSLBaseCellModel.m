//
//  LSLBaseCellModel.m
//  LSLBaseMainTableViewController
//
//  Created by lisonglin on 18/05/2017.
//  Copyright © 2017 lisonglin. All rights reserved.
//

#import "LSLBaseCellModel.h"
#import "LSLTableViewControllerConst.h"
#import "UIColor+LSColor.h"

@implementation LSLBaseCellModel


- (instancetype)initWithTitle:(NSString *)title actionBlock:(ClickActionBlock)actionBlock
{
    if (self = [super init]) {
        
        self.cellHeight = LS_LCellHeight;
        self.title = title;
        self.showArrow = YES;
        self.identifier = [NSString stringWithFormat:@"%lf",CFAbsoluteTimeGetCurrent()];
        self.actionBlock = actionBlock;
        self.canClick = YES;
        self.cellClass = LSLBaseCellModelCellClass;
        self.separateOffset = LS_LCellMargin;
        self.separateColor = [UIColor colorWithLSString:LS_LSeparateColor];
        self.separateHeight = LS_LSeparateHeight;
        self.titleFont = [UIFont systemFontOfSize:LS_LTitleFont];
        self.arrowImage = [UIImage imageNamed:@"ic_hs_tableView_arrow"];
        self.arrowHeight = LS_LArrowHeight;
        self.arrowWidth = LS_LArrowWidth;
    }
    return self;
}


- (instancetype)initWithAttributeTitle:(NSAttributedString *)attributeTitle actionBlock:(ClickActionBlock)actionBlock
{
    if (self = [super init]) {
        
        self.cellHeight = LS_LCellHeight;
        self.attributeTitle = attributeTitle;
        self.showArrow = YES;
        self.identifier = [NSString stringWithFormat:@"%lf",CFAbsoluteTimeGetCurrent()];
        self.actionBlock = actionBlock;
        self.cellClass = LSLBaseCellModelCellClass;
        self.canClick = YES;
        self.separateColor = [UIColor colorWithLSString:LS_LSeparateColor];
        self.separateHeight = LS_LSeparateHeight;
        self.titleFont = [UIFont systemFontOfSize:LS_LTitleFont];
        self.titleColor = [UIColor colorWithLSString:LS_LTitleColor];
        self.arrowImage = [UIImage imageNamed:@"ic_hs_tableView_arrow"];
        self.arrowWidth = LS_LArrowWidth;
        self.arrowHeight = LS_LArrowHeight;
        
    }
    return self;
}



@end
