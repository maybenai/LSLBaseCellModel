//
//  LSLImageCellModel.m
//  LSLBaseMainTableViewController
//
//  Created by lisonglin on 18/05/2017.
//  Copyright © 2017 lisonglin. All rights reserved.
//

#import "LSLImageCellModel.h"
#import "LSLTableViewControllerConst.h"

@implementation LSLImageCellModel

- (instancetype)initWithTitle:(NSString *)title
               placeHolderImg:(UIImage *)placeHolderImage
                     imageUrl:(NSString *)imageUrl
                  actionBlock:(ClickActionBlock)actionBlock
                   imageBlock:(ClickImageBlock)imageBlock
{
    if (self = [super initWithTitle:title actionBlock:actionBlock]) {
        
        self.placeHolderImage = placeHolderImage;

        self.imageUrl = imageUrl;

        self.imageBlock = imageBlock;

        self.imageWidth = LS_LImageWidth;

        self.imageHeight = LS_LImageHeight;

        self.cellHeight = LS_LImageCellHeight;

        self.cellClass = LSLImageCellModelCellClass;

        self.cornerRaduis = 0.f;
    }
    return self;
}


@end
