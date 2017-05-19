//
//  NSArray+LSSafeAccess.h
//  集创家
//
//  Created by lisonglin on 11/05/2017.
//  Copyright © 2017 lisonglin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (LSSafeAccess)


/**
 按照索引安全返回数组元素

 @param index index
 @return self
 */
- (instancetype)ls_objectWithIndex:(NSUInteger)index;

@end
