//
//  NSPointerArray+DXCompact.h
//  TimestampLabel
//
//  Created by Selvin on 17/05/15.
//  Copyright (c) 2015 S3lvin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSPointerArray (DXCompact)

/**
 *  For unknown reasons compact method is not removing NULL values. So we gotta do that ourselves.
 */
- (void)dx_compact;

@end
