//
//  LSLImageCellModel.h
//  LSLBaseMainTableViewController
//
//  Created by lisonglin on 18/05/2017.
//  Copyright © 2017 lisonglin. All rights reserved.
//

#import "LSLBaseCellModel.h"

typedef void(^ClickImageBlock)();

@interface LSLImageCellModel : LSLBaseCellModel

@property(nonatomic, strong) UIImage * placeHolderImage;    //默认图片
@property(nonatomic, copy) NSString * imageUrl;             //imageUrl
@property(nonatomic, strong) UIImage * imageIcon;           //imageIcon
@property(nonatomic, assign) CGFloat imageWidth;            //imageWidth
@property(nonatomic, assign) CGFloat imageHeight;           //imageHeight
@property(nonatomic, assign) CGFloat cornerRaduis;          //圆角

@property(nonatomic, copy) ClickImageBlock imageBlock;       //图片点击




/**
 带图片的模型初始化

 @param title title
 @param placeHolderImage placeHolderImage
 @param imageUrl imageUrl
 @param actionBlock actionBlock
 @param imageBlock imageBlock
 @return LSLImageCellModel
 */
- (instancetype)initWithTitle:(NSString *)title
               placeHolderImg:(UIImage *)placeHolderImage
                     imageUrl:(NSString *)imageUrl
                  actionBlock:(ClickActionBlock)actionBlock
                   imageBlock:(ClickImageBlock)imageBlock;

@end
