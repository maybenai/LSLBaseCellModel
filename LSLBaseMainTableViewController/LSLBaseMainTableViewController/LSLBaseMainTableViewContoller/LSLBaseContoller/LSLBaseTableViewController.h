//
//  LSLBaseTableViewController.h
//  LSLBaseMainTableViewController
//
//  Created by lisonglin on 18/05/2017.
//  Copyright © 2017 lisonglin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LSLBaseCellModel;

@interface LSLBaseTableViewController : UITableViewController

@property(nonatomic, strong) NSMutableArray * ls_dataArray; //数据源


/**
 更新cell模型

 @param cellModel LSLBaseCellModel
 */
- (void)updateCellModel:(LSLBaseCellModel *)cellModel;


/**
 更新cell模型方法
 
 @param cellModel model
 @param animation 动画效果
 */
- (void)updateCellModel:(LSLBaseCellModel *)cellModel animation:(UITableViewRowAnimation)animation;


@end
