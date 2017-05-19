//
//  LSLBaseTableViewCell.h
//  LSLBaseMainTableViewController
//
//  Created by lisonglin on 18/05/2017.
//  Copyright © 2017 lisonglin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LSLBaseCellModel;

@interface LSLBaseTableViewCell : UITableViewCell


@property(nonatomic, weak) UITableView * tableView;//tableView
@property(nonatomic, strong) LSLBaseCellModel * cellModel;//model
@property(nonatomic, weak) UIImageView * arrow; //箭头
@property(nonatomic, weak) CALayer * topLine;   //顶部分割线
@property(nonatomic, weak) CALayer * bottomLine;    //底部分割线



/**
 LSLBaseTableViewCell

 @param identifier identifier
 @param tableView tableView
 @return LSLBaseTableViewCell
 */
+ (LSLBaseTableViewCell *)cellWithIdentifier:(NSString *)identifier tableView:(UITableView *)tableView;


//初始化UI
- (void)setUpUI;

//设置数据源方法
- (void)setUpDataModel:(LSLBaseCellModel *)model;

/**
 Height

 @param model LSLBaseCellModel
 @return CGFloat
 */
+ (CGFloat)getCellHeight:(LSLBaseCellModel *)model;

@end
