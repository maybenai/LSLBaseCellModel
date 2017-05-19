//
//  LSLTextCellModel.m
//  LSLBaseMainTableViewController
//
//  Created by lisonglin on 19/05/2017.
//  Copyright © 2017 lisonglin. All rights reserved.
//

#import "LSLTextCellModel.h"
#import "LSLTableViewControllerConst.h"
#import "UIColor+LSColor.h"
#import "NSString+LSHeight.h"

@implementation LSLTextCellModel

- (instancetype)initWithTitle:(NSString *)title
                   detailText:(NSString *)detailText
                  actionBlock:(ClickActionBlock)block
{
    if (self = [super initWithTitle:title actionBlock:block]) {
        
        self.leftPadding = LS_LCellTextLeftPading;
        
        self.detailFont = [UIFont systemFontOfSize:LS_LDetailFont];
        
        self.detailColor = [UIColor colorWithLSString:LS_LDetailColor];
        
        self.detailText = detailText;
        
        self.cellClass = LSLTextCellModelCellClass;
        
    }
    return self;
}

- (instancetype)initWithTitle:(NSString *)title
          attributeDetailText:(NSAttributedString *)attributeDetailText
                  actionBlock:(ClickActionBlock)block
{
    if (self = [super initWithTitle:title actionBlock:block]) {
        
        self.leftPadding = LS_LCellTextLeftPading;
        self.detailFont = [UIFont systemFontOfSize:LS_LDetailFont];
        self.detailColor = [UIColor colorWithLSString:LS_LDetailColor];
        self.attributeDetailText = attributeDetailText;
        self.cellClass = LSLTextCellModelCellClass;
        
    }
    return self;
}

- (instancetype)initWithAttributeTitle:(NSAttributedString *)attributeTitle
                   detailAttributeText:(NSAttributedString *)attributeDetailText
                           actionBlock:(ClickActionBlock)actionBlock
{
    if (self = [super initWithAttributeTitle:attributeTitle actionBlock:actionBlock]) {
        
        self.leftPadding = LS_LCellTextLeftPading;
        self.attributeDetailText = attributeDetailText;
        self.cellClass = LSLTextCellModelCellClass;
    }
    return self;
}


- (instancetype)initWithAttributeTitle:(NSAttributedString *)attributeTitle
                            detailText:(NSString *)detailText
                           actionBlock:(ClickActionBlock)actionBlock
{
    if (self = [super initWithAttributeTitle:attributeTitle actionBlock:actionBlock]) {
        
        self.leftPadding = LS_LCellTextLeftPading;
        self.detailFont = [UIFont systemFontOfSize:LS_LDetailFont];
        self.detailColor = [UIColor colorWithLSString:LS_LDetailColor];
        self.detailText = detailText;
        self.cellClass = LSLTextCellModelCellClass;
    }
    return self;
}


- (void)setShowArrow:(BOOL)showArrow
{
    [super setShowArrow:showArrow];
    
    [self setDetailText:self.detailText];
}


- (void)setDetailFont:(UIFont *)detailFont
{
    _detailFont = detailFont;
    
    [self setDetailText:self.detailText];
}


- (void)setLeftPadding:(CGFloat)leftPadding
{
    _leftPadding = leftPadding;
    
    [self setDetailText:self.detailText];
}


- (void)setDetailText:(NSString *)detailText
{
    if (detailText == nil) {//如果detailText为nil返回为空，为空不能反回
        return;
    }
    
    _detailText = detailText;
    
    if (self.attributeDetailText) {
        //如果外部设置过富文本 则忽略纯文本计算
        return;
    }
    
    [self heightSizeWithTextObject:detailText];
}


- (void)setAttributeDetailText:(NSAttributedString *)attributeDetailText
{
    if (attributeDetailText == nil) {
        return;
    }
    
    _attributeDetailText = attributeDetailText;
    
    [self heightSizeWithTextObject:attributeDetailText];
}



- (void)heightSizeWithTextObject:(id)object
{
    //初始化文本高度 外部不可任意改变 不然看起来很怪
    self.cellHeight = 0.f;
    UIDeviceOrientation duration = [[UIDevice currentDevice] orientation];
    
    CGFloat screenWidth = 0;
    
    if (duration == UIDeviceOrientationLandscapeLeft || duration == UIDeviceOrientationLandscapeRight) {
        screenWidth = LS_SCREEN_HEIGHT > LS_SCREEN_WIDTH ? LS_SCREEN_HEIGHT : LS_SCREEN_WIDTH;
    }else{
        screenWidth = LS_SCREEN_HEIGHT < LS_SCREEN_WIDTH ? LS_SCREEN_HEIGHT : LS_SCREEN_WIDTH;
    }
    
    CGFloat height = 0.f;
    UIFont * font;
    if ([object isKindOfClass:[NSString class]]) {
        height = [(NSString *)object ls_heightwithFont:self.detailFont constraintedToWidth:screenWidth - self.leftPadding - (self.showArrow ? LS_LCellMargin + LS_LCellMargin / 2 + self.arrowWidth : LS_LCellMargin)];
        
        font = self.detailFont;
    }
    
    if (height < font.pointSize + 5 || height == 0) {
        //说明只有1行
        self.heightOne = height;
        self.heightMore = 0.f;
        self.cellHeight = LS_LCellHeight;
    }else{
        self.heightMore = height;
        self.heightOne = 0.f;
        self.cellHeight = height + 2 * LS_LCellPading;
    }
    
}

@end
