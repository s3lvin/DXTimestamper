//
//  DXTimestamper.h
//  TimestampLabel
//
//  Created by Selvin on 16/05/15.
//  Copyright (c) 2015 S3lvin. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "NSDate+DXTimestamp.h"
#define kEmptyString @""

@protocol DXTimestamping <NSObject>

@property(nonatomic, strong) NSDate *timestamp;

- (void)updateTimestamp;

@end

/**
 *  A block that takes in an NSDate and returns a fuzzy timestamp string
 *
 *  @param timestamp timestamp as NSDate
 *
 *  @return Fuzzy string
 */
typedef NSString * (^DXFuzzyTimestamper)(NSDate *timestamp);

@interface DXTimestamper : NSObject

+ (void)trackAndUpdate:(id<DXTimestamping>)timestampControl;

+ (void)setFuzzyTimestampCalculator:(DXFuzzyTimestamper)calculator;

+ (DXFuzzyTimestamper)fuzzyTimestampCalculator;

@end
