//
//  LSLTableViewControllerConst.h
//  LSLBaseMainTableViewController
//
//  Created by lisonglin on 18/05/2017.
//  Copyright © 2017 lisonglin. All rights reserved.
//

#import <UIKit/UIKit.h>

UIKIT_EXTERN const CGFloat LS_LCellMargin;  //标题左边的默认cell间距
UIKIT_EXTERN const CGFloat LS_LSeparateHeight; //cell分割线默认高度
UIKIT_EXTERN const CGFloat LS_LSectionHeight;//分组section之间的距离
UIKIT_EXTERN const CGFloat LS_LArrowWidth;//箭头默认宽度
UIKIT_EXTERN const CGFloat LS_LArrowHeight;//箭头默认高度
UIKIT_EXTERN const CGFloat LS_LCellTextLeftPading; //右边文本离左边的边距
UIKIT_EXTERN const CGFloat LS_LCellPading; //距离cell上下默认编剧pading
UIKIT_EXTERN const CGFloat LS_LCellHeight; //cell默认高度
UIKIT_EXTERN const CGFloat LS_LSwitchWidth;//开关默认宽度
UIKIT_EXTERN const CGFloat LS_LSwitchHeight;//开关默认高度
UIKIT_EXTERN const CGFloat LS_LImageCellHeight;//大图默认cell高度
UIKIT_EXTERN const CGFloat LS_LImageWidth; //右边大图默认宽度
UIKIT_EXTERN const CGFloat LS_LImageHeight; //右边大图默认高度
UIKIT_EXTERN const CGFloat LS_LTitleFont; //标题默认字体大小
UIKIT_EXTERN const CGFloat LS_LDetailFont; //详细文本默认字体大小

UIKIT_EXTERN NSString *const LS_LSeparateColor; //cell分割线默认颜色
UIKIT_EXTERN NSString *const LS_LTitleColor;//标题默认字体颜色
UIKIT_EXTERN NSString *const LS_LDetailColor; //标题默认详细文本颜色


#define LS_SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define LS_SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)


UIKIT_EXTERN NSString *const LSLBaseCellModelCellClass; //cell的基类
UIKIT_EXTERN NSString *const LSLImageCellModelCellClass;//右边是image的cell
UIKIT_EXTERN NSString *const LSLSwitchCellModelCellClass;//右边是开关的cell
UIKIT_EXTERN NSString *const LSLTextCellModelCellClass;//右边是文本的cell
