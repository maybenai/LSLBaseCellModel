//
//  LSLBaseCellModel.h
//  LSLBaseMainTableViewController
//
//  Created by lisonglin on 18/05/2017.
//  Copyright © 2017 lisonglin. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

@class LSLBaseCellModel;

typedef void(^ClickActionBlock)(LSLBaseCellModel * model);

@interface LSLBaseCellModel : NSObject

/**
 基础属性
 */
@property(nonatomic, copy) NSString * cellClass;    //该模型绑定的cell类名
@property(nonatomic, copy) NSString * identifier;   //唯一标识符
@property(nonatomic, assign) UITableViewCellStyle cellStyle;    //cellStyle
@property(nonatomic, assign,getter=isCanClick) BOOL canClick; //cell的点击事件
@property(nonatomic, copy) ClickActionBlock actionBlock; //cell点击事件


/**
 显示相关的属性
 */
@property(nonatomic, copy) NSAttributedString * attributeTitle; //cell富文本标题，如果设置了title属性会失效
@property(nonatomic, copy) NSString * title;    //cell标题(左边)
@property(nonatomic, strong) UIImage * icon;    //cell图片(左边)
@property(nonatomic, assign) CGFloat cellHeight;    //cell的高度
@property(nonatomic, assign,getter=isShowArrow) BOOL showArrow; //是否显示右侧的箭头
@property(nonatomic, strong) UIColor * titleColor;   //titleColor
@property(nonatomic, strong) UIFont * titleFont;     //titleFont
@property(nonatomic, assign) CGFloat separateOffset;    //分割线左边间距
@property(nonatomic, assign) CGFloat separateHeight;     //分割线高度
@property(nonatomic, strong) UIColor * separateColor;   //分割线颜色

@property(nonatomic, strong) UIImage * arrowImage;  //箭头image
@property(nonatomic, assign) CGFloat arrowWidth;    //箭头宽度
@property(nonatomic, assign) CGFloat arrowHeight;   //箭头高度




/**
 model

 @param title title
 @param actionBlock block
 @return LSBaseCellModel
 */
- (instancetype)initWithTitle:(NSString *)title actionBlock:(ClickActionBlock)actionBlock;


/**
 model初始化方法
 
 @param attributeTitle 模型富文本标题
 @param actionBlock block
 @return LSBaseCellModel
 */
- (instancetype)initWithAttributeTitle:(NSAttributedString *)attributeTitle actionBlock:(ClickActionBlock)actionBlock;


@end
