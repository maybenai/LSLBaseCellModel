//
//  LSLSwitchTableViewCell.m
//  LSLBaseMainTableViewController
//
//  Created by lisonglin on 18/05/2017.
//  Copyright © 2017 lisonglin. All rights reserved.
//

#import "LSLSwitchTableViewCell.h"
#import "LSLTableViewControllerConst.h"
#import "LSLSwitchCellModel.h"
#import "UIView+KCView.h"

@interface LSLSwitchTableViewCell ()

@property(nonatomic, weak) UISwitch * switchItem;

@end

@implementation LSLSwitchTableViewCell

+ (LSLBaseTableViewCell *)cellWithIdentifier:(NSString *)identifier tableView:(UITableView *)tableView
{
    LSLSwitchTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        cell = [[LSLSwitchTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    return cell;
}

- (void)setUpUI
{
    [super setUpUI];
    
    //添加开关控件
    UISwitch * switchItem = [[UISwitch alloc] initWithFrame:CGRectZero];
    [switchItem addTarget:self action:@selector(switchChange:) forControlEvents:UIControlEventValueChanged];
    switchItem.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:switchItem];
    self.switchItem = switchItem;
    
    [self setupSwitchItemConstraints];
}

- (void)setupSwitchItemConstraints
{
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.switchItem attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeRight multiplier:1.0 constant:-LS_LCellMargin]];
    
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.switchItem attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0]];
    
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.switchItem attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:LS_LSwitchWidth]];
    
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.switchItem attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:LS_LSwitchHeight]];
}


- (void)switchChange:(UISwitch *)switchItem
{
    LSLSwitchCellModel * model = (LSLSwitchCellModel *)self.cellModel;
    
    model.on = switchItem.on;
    
    if (model.switchBlock) {
        model.switchBlock(self.cellModel,switchItem.on);
    }
}


- (void)setUpDataModel:(LSLBaseCellModel *)model
{
    [super setUpDataModel:model];
    
    LSLSwitchCellModel * switchModel = (LSLSwitchCellModel *)model;
    
    self.switchItem.on = switchModel.on;
}

@end
