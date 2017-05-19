//
//  LSLTextTableViewCell.m
//  LSLBaseMainTableViewController
//
//  Created by lisonglin on 19/05/2017.
//  Copyright © 2017 lisonglin. All rights reserved.
//

#import "LSLTextTableViewCell.h"
#import "LSLTableViewControllerConst.h"
#import "LSLTextCellModel.h"


@interface LSLTextTableViewCell ()

@property(nonatomic, weak) UILabel * detailLabel;   //详细文本内容
@property(nonatomic, weak) NSLayoutConstraint * detailRightConstraint;  //
@property(nonatomic, weak) NSLayoutConstraint * detailLeftConstraint;

@end

@implementation LSLTextTableViewCell

+ (LSLBaseTableViewCell *)cellWithIdentifier:(NSString *)identifier tableView:(UITableView *)tableView
{
    LSLTextTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        
        cell = [[LSLTextTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    return cell;
}


- (void)setUpUI
{
    [super setUpUI];
    
    //添加右边label
    UILabel * detailTextLable = [[UILabel alloc] initWithFrame:CGRectZero];
    detailTextLable.numberOfLines = 0;
    detailTextLable.translatesAutoresizingMaskIntoConstraints = NO;
    detailTextLable.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:detailTextLable];
    self.detailLabel = detailTextLable;
    
    [self setupDetailLabelConstraints];
}


- (void)setupDetailLabelConstraints
{
    NSLayoutConstraint * constraintRight = [NSLayoutConstraint constraintWithItem:self.detailLabel attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeRight multiplier:1.0 constant:-LS_LCellMargin - LS_LCellMargin / 2 - LS_LArrowWidth];
    [self.contentView addConstraint:constraintRight];
    self.detailRightConstraint = constraintRight;
    
    NSLayoutConstraint * constraintLeft = [NSLayoutConstraint constraintWithItem:self.detailLabel attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeLeft multiplier:1.0 constant:LS_LCellTextLeftPading];
    [self.contentView addConstraint:constraintLeft];
    self.detailLeftConstraint = constraintLeft;
    
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.detailLabel attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0]];
    
}


- (void)setUpDataModel:(LSLBaseCellModel *)model
{
    [super setUpDataModel:model];
    
    LSLTextCellModel * rightModel = (LSLTextCellModel *)model;
    
    if (rightModel.attributeDetailText) {
        self.detailLabel.numberOfLines = 1;
        self.detailLabel.attributedText = rightModel.attributeDetailText;
    }else {
        self.detailLabel.numberOfLines = 0;
        self.detailLabel.text = rightModel.detailText;
        self.detailLabel.textColor = rightModel.detailColor;
        self.detailLabel.font = rightModel.detailFont;
    }
    
    //根据箭头显示设置约束
    if (self.cellModel.showArrow) {
        self.detailRightConstraint.constant = -LS_LCellMargin - LS_LCellMargin / 2 - rightModel.arrowWidth;
    }else{
        self.detailRightConstraint.constant = -LS_LCellMargin;
    }
    
    self.detailLeftConstraint.constant = rightModel.leftPadding;
}





@end
