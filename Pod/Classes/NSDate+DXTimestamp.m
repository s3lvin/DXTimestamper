//
//  NSDate+DXTimestamp.m
//  TimestampLabel
//
//  Created by Selvin on 16/05/15.
//  Copyright (c) 2015 S3lvin. All rights reserved.
//

#import "NSDate+DXTimestamp.h"
#import "DXTimestamper.h"

@implementation NSDate (DXTimestamp)

- (NSString *)timestampString {

    NSString *timeRemaining = kEmptyString;

    DXFuzzyTimestamper timestamper = [DXTimestamper fuzzyTimestampCalculator];

    if (timestamper != NULL) {
        timeRemaining = timestamper(self);
    }

    return timeRemaining;
}

@end
