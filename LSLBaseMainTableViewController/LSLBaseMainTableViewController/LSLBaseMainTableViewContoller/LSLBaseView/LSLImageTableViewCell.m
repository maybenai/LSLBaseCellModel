//
//  LSLImageTableViewCell.m
//  LSLBaseMainTableViewController
//
//  Created by lisonglin on 18/05/2017.
//  Copyright © 2017 lisonglin. All rights reserved.
//

#import "LSLImageTableViewCell.h"
#import "LSLTableViewControllerConst.h"
#import "LSLImageCellModel.h"
//#import <UIImageView+WebCache.h>
#import "UIView+KCView.h"

@interface LSLImageTableViewCell ()

@property(nonatomic, weak) UIImageView * bigImageView;  //右边图片显示
@property(nonatomic, weak) NSLayoutConstraint * bigImageRightConstraint;    //大图约束
@property(nonatomic, weak) NSLayoutConstraint * bigImageWidthConstraint;    //大图宽度
@property(nonatomic, weak) NSLayoutConstraint * bigImageHeightConstraint;   //大图高度


@end

@implementation LSLImageTableViewCell

+ (LSLBaseTableViewCell *)cellWithIdentifier:(NSString *)identifier tableView:(UITableView *)tableView
{
    LSLImageTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        
        cell = [[LSLImageTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    return cell;
}



- (void)setUpUI
{
    [super setUpUI];
    
    //添加默认图片
    UIImageView * imageView = [[UIImageView alloc] init];
    imageView.frame = CGRectZero;
    imageView.clipsToBounds = YES;
    imageView.userInteractionEnabled = YES;
    imageView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:imageView];
    
    self.bigImageView = imageView;
    
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickImage:)];
    
    [self.bigImageView addGestureRecognizer:tap];
    
    [self setupBigImageConstraint];
    
}


//设置大图约束
- (void)setupBigImageConstraint
{
    
    NSLayoutConstraint *bigImageRightConstraint = [NSLayoutConstraint constraintWithItem:self.bigImageView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeRight multiplier:1.0 constant:-LS_LCellMargin];
    [self.contentView addConstraint:bigImageRightConstraint];
    self.bigImageRightConstraint = bigImageRightConstraint;
    
    
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.bigImageView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0]];
    
    
    NSLayoutConstraint *bigImageWidthConstraint = [NSLayoutConstraint constraintWithItem:self.bigImageView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:LS_LImageWidth];
    [self.contentView addConstraint:bigImageWidthConstraint];
    self.bigImageWidthConstraint = bigImageWidthConstraint;
    
    
    NSLayoutConstraint *bigImageHeightConstaint = [NSLayoutConstraint constraintWithItem:self.bigImageView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:LS_LImageHeight];
    [self.contentView addConstraint:bigImageHeightConstaint];
    self.bigImageHeightConstraint = bigImageHeightConstaint;
    
}

- (void)setUpDataModel:(LSLBaseCellModel *)model
{
    [super setUpDataModel:model];
    
    LSLImageCellModel * bigModel = (LSLImageCellModel *)model;
    
    if (!bigModel.imageIcon) {
//        [self.bigImageView sd_setImageWithURL:[NSURL URLWithString:bigModel.imageUrl] placeholderImage:bigModel.placeHolderImage];
    }else{
        self.bigImageView.image = bigModel.imageIcon;
    }
    
    self.bigImageView.layer.cornerRadius = bigModel.cornerRaduis > 0 ? bigModel.cornerRaduis : 0.f;
    
    if (bigModel.imageWidth > 0) {
        self.bigImageWidthConstraint.constant = bigModel.imageWidth;
    }
    
    if (bigModel.imageHeight > 0) {
        self.bigImageHeightConstraint.constant = bigModel.imageHeight;
    }
    
    if (bigModel.showArrow) {
        self.bigImageRightConstraint.constant = -LS_LCellMargin - LS_LCellMargin / 2 - LS_LArrowWidth;
    }else{
        self.bigImageRightConstraint.constant = -LS_LCellMargin;
    }
}


#pragma mark -- 图片手势
- (void)clickImage:(UITapGestureRecognizer *)gesture
{
    LSLImageCellModel * bigModel = (LSLImageCellModel *)self.cellModel;
    
    if (bigModel.imageBlock) {
        bigModel.imageBlock();
    }
    
    
}

@end
