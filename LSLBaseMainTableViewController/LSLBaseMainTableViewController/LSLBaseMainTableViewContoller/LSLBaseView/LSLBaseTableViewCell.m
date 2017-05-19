//
//  LSLBaseTableViewCell.m
//  LSLBaseMainTableViewController
//
//  Created by lisonglin on 18/05/2017.
//  Copyright © 2017 lisonglin. All rights reserved.
//

#import "LSLBaseTableViewCell.h"
#import "UIColor+LSColor.h"
#import "LSLTableViewControllerConst.h"
#import "UIView+KCView.h"
#import "LSLBaseCellModel.h"

@interface LSLBaseTableViewCell()

@property (nonatomic, weak)NSLayoutConstraint *arrowWidthContraint;  ///<箭头宽度contraint
@property (nonatomic, weak)NSLayoutConstraint *arrowHeightContraint;  ///<箭头高度contraint
@end

@implementation LSLBaseTableViewCell

+ (LSLBaseTableViewCell *)cellWithIdentifier:(NSString *)identifier tableView:(UITableView *)tableView
{
    LSLBaseTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        cell = [[LSLBaseTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self setUpUI];
    }
    return self;
}

- (void)setUpUI
{
    //添加顶部分割线
    CALayer * topLine = [CALayer layer];
    [topLine setFrame:CGRectMake(0, 0, self.frame.size.width, LS_LSeparateHeight)];
    [topLine setBackgroundColor:[UIColor colorWithLSString:LS_LSeparateColor].CGColor];
    [self.contentView.layer addSublayer:topLine];
    self.topLine = topLine;
    
    //添加底部分割线
    CALayer * bottomLine = [CALayer layer];
    [bottomLine setFrame:CGRectMake(0, 0, self.frame.size.width, LS_LSeparateHeight)];
    [bottomLine setBackgroundColor:[UIColor colorWithLSString:LS_LSeparateColor].CGColor];
    [self.contentView.layer addSublayer:bottomLine];
    self.bottomLine = bottomLine;
    
    //添加右边箭头
    UIImageView * arrow = [[UIImageView alloc] init];
    arrow.frame = CGRectZero;
    arrow.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:arrow];
    self.arrow = arrow;
    
    
    //设置约束
    [self setUpArrowImageConstraints];
    
}


- (void)setUpArrowImageConstraints
{
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.arrow attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeRight multiplier:1.0 constant:- LS_LCellMargin]];
    
    NSLayoutConstraint * arrowWidthContrait = [NSLayoutConstraint constraintWithItem:self.arrow attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:LS_LArrowWidth];
    [self.contentView addConstraint:arrowWidthContrait];
    self.arrowWidthContraint = arrowWidthContrait;
    
    NSLayoutConstraint * arrowHeightConstraint = [NSLayoutConstraint constraintWithItem:self.arrow attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:LS_LArrowHeight];
    [self.contentView addConstraint:arrowHeightConstraint];
    self.arrowHeightContraint = arrowHeightConstraint;
    
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.arrow attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0]];
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.bottomLine.ls_width  = self.frame.size.width;
    self.topLine.ls_width = self.frame.size.width;
    
}

- (void)setUpDataModel:(LSLBaseCellModel *)model
{
    self.cellModel = model;
    
    if (self.cellModel.attributeTitle) {
        self.textLabel.attributedText = self.cellModel.attributeTitle;
    }else{
        self.textLabel.text = self.cellModel.title;
        self.textLabel.textColor = self.cellModel.titleColor;
        self.textLabel.font = self.cellModel.titleFont;
    }
    
    self.imageView.image = model.icon;
    self.bottomLine.ls_y = model.cellHeight - model.separateHeight;
    self.bottomLine.ls_height = model.separateHeight;
    self.topLine.ls_height = model.separateHeight;
    [self.bottomLine setBackgroundColor:model.separateColor.CGColor];
    [self.topLine setBackgroundColor:model.separateColor.CGColor];
    
    self.arrow.hidden = !self.cellModel.isShowArrow;
    self.selectionStyle = !model.isCanClick ? UITableViewCellSelectionStyleNone : UITableViewCellSelectionStyleDefault;
    
    self.arrow.image = model.arrowImage;
    self.arrowWidthContraint.constant = model.arrowWidth;
    self.arrowHeightContraint.constant = model.arrowHeight;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}


+ (CGFloat)getCellHeight:(LSLBaseCellModel *)model
{
    return model.cellHeight;
}



@end
