//
//  LSLSwitchCellModel.m
//  LSLBaseMainTableViewController
//
//  Created by lisonglin on 18/05/2017.
//  Copyright © 2017 lisonglin. All rights reserved.
//

#import "LSLSwitchCellModel.h"
#import "LSLTableViewControllerConst.h"


@implementation LSLSwitchCellModel

- (instancetype)initWithTitle:(NSString *)title swithType:(BOOL)on switchBlock:(SwitchBlock)switchBlock
{
    if (self = [super initWithTitle:title actionBlock:nil]) {
        
        self.cellClass = LSLSwitchCellModelCellClass;
        self.switchBlock = switchBlock;
        self.canClick = NO;
        self.showArrow = NO;
        self.on = on;
    }
    return self;
}

@end
