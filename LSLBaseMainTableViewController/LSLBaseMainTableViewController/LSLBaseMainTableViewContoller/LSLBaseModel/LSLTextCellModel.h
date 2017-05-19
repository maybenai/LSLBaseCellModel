//
//  LSLTextCellModel.h
//  LSLBaseMainTableViewController
//
//  Created by lisonglin on 19/05/2017.
//  Copyright © 2017 lisonglin. All rights reserved.
//

#import "LSLBaseCellModel.h"

@interface LSLTextCellModel : LSLBaseCellModel

@property(nonatomic, copy) NSString * detailText;   //详细文本
@property(nonatomic, copy) NSAttributedString * attributeDetailText;    //设置富文本内容后detailText将失效
@property(nonatomic, assign) CGFloat heightOne;     //一行文本的高度
@property(nonatomic, assign) CGFloat heightMore;    //多行文本的高度
@property(nonatomic, strong) UIColor * detailColor; //cell详细文本color
@property(nonatomic, strong) UIFont * detailFont;   //cell详细文本font
@property(nonatomic, assign) CGFloat leftPadding;   //距离左边的间距



/**
 带text的cell初始化

 @param title title
 @param detailText 详细文本
 @param block block
 @return LSLTextCellModel
 */
- (instancetype)initWithTitle:(NSString *)title
                   detailText:(NSString *)detailText
                  actionBlock:(ClickActionBlock)block;


/**
 带text的cell初始化

 @param title title
 @param attributeDetailText 详细富文本
 @param block block
 @return LSLTextCellModel
 */
- (instancetype)initWithTitle:(NSString *)title
          attributeDetailText:(NSAttributedString *)attributeDetailText
                  actionBlock:(ClickActionBlock)block;



/**
 带text的cell初始化

 @param attributeTitle 富文本标题
 @param attributeDetailText 详细富文本
 @param actionBlock block
 @return LSLTextCellModel
 */
- (instancetype)initWithAttributeTitle:(NSAttributedString *)attributeTitle
                   detailAttributeText:(NSAttributedString *)attributeDetailText
                           actionBlock:(ClickActionBlock)actionBlock;



/**
 带text的cell初始化

 @param attributeTitle 富文本标题
 @param detailText 详细文本
 @param actionBlock block
 @return LSLTextCellModel
 */
- (instancetype)initWithAttributeTitle:(NSAttributedString *)attributeTitle
                   detailText:(NSString *)detailText
                           actionBlock:(ClickActionBlock)actionBlock;


@end
