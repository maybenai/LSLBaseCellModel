//
//  LSLSwitchCellModel.h
//  LSLBaseMainTableViewController
//
//  Created by lisonglin on 18/05/2017.
//  Copyright © 2017 lisonglin. All rights reserved.
//

#import "LSLBaseCellModel.h"

@class LSLBaseCellModel;

typedef void(^SwitchBlock)(LSLBaseCellModel * model , BOOL on);

@interface LSLSwitchCellModel : LSLBaseCellModel

@property(nonatomic, assign) BOOL on;   //开关状态

@property(nonatomic, copy) SwitchBlock switchBlock;



/**
 带switch的cell初始化

 @param title title
 @param on 开关状态
 @param switchBlock switchBlock
 @return LSLBaseCellModel
 */
- (instancetype)initWithTitle:(NSString *)title swithType:(BOOL)on switchBlock:(SwitchBlock)switchBlock;

@end
