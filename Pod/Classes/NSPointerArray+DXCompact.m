//
//  NSPointerArray+DXCompact.m
//  TimestampLabel
//
//  Created by Selvin on 17/05/15.
//  Copyright (c) 2015 S3lvin. All rights reserved.
//

#import "NSPointerArray+DXCompact.h"

@implementation NSPointerArray (DXCompact)

- (void)dx_compact {
    for (NSInteger i = 0; i < self.count; i++) {
        id obj = [self pointerAtIndex:(NSUInteger)i];
        if (!obj) {
            [self removePointerAtIndex:(NSUInteger)i];
        }
    }
}

@end
