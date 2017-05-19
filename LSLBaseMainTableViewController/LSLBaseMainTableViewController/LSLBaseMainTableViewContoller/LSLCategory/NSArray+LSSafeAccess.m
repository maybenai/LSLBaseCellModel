//
//  NSArray+LSSafeAccess.m
//  集创家
//
//  Created by lisonglin on 11/05/2017.
//  Copyright © 2017 lisonglin. All rights reserved.
//

#import "NSArray+LSSafeAccess.h"

@implementation NSArray (LSSafeAccess)

- (instancetype)ls_objectWithIndex:(NSUInteger)index
{
    if (index < self.count) {
        return self[index];
    }else{
        return nil;
    }
}

@end
