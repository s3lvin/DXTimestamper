//
//  DXTimestamper.m
//  TimestampLabel
//
//  Created by Selvin on 16/05/15.
//  Copyright (c) 2015 S3lvin. All rights reserved.
//

#import "DXTimestamper.h"

#import "NSPointerArray+DXCompact.h"

static NSPointerArray *allObjects = nil;

static NSTimer *timestampUpdateTimer = nil;
static NSTimeInterval timestampUpdateTimerRepeatRate = 1.0f;

static NSTimer *compactifyTimer = nil;
static NSTimeInterval compactifyTimerRepeatRate = 60.0f;

static DXFuzzyTimestamper fuzzyTimestampCalculator = nil;
static NSCalendar *gregorianCalendar = nil;

@implementation DXTimestamper

+ (void)initialize {
    if (!allObjects) {
        allObjects = [NSPointerArray weakObjectsPointerArray];
        gregorianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
        // Cleanup once in a minute
        fuzzyTimestampCalculator = [self defaultFuzzyTimeCalculator];
        compactifyTimer = [NSTimer scheduledTimerWithTimeInterval:compactifyTimerRepeatRate
                                                           target:self
                                                         selector:@selector(stopTimerIfNeeded)
                                                         userInfo:nil
                                                          repeats:YES];
        [[NSRunLoop mainRunLoop] addTimer:compactifyTimer forMode:NSRunLoopCommonModes];
    }
}

+ (DXFuzzyTimestamper)defaultFuzzyTimeCalculator {
    DXFuzzyTimestamper timestamper = ^(NSDate *timestamp) {
        NSDate *now = [NSDate date];
        
        NSDate *fromdDate;
        NSDate *toDate;
        
        //calculate from date and to date to keep the result always positive
        if ([now compare:timestamp] == NSOrderedSame) {
            return @" now";
        } else if ([now compare:timestamp] == NSOrderedAscending) {
            fromdDate = now;
            toDate = timestamp;
        } else {
            fromdDate = timestamp;
            toDate = now;
        }
        
        NSDateComponents *comp = [gregorianCalendar components:NSCalendarUnitHour |
                                  NSCalendarUnitMinute |
                                  NSCalendarUnitSecond |
                                  NSCalendarUnitDay
                                                      fromDate:fromdDate
                                                        toDate:toDate
                                                       options:0];
        
        NSInteger days = [comp day];
        NSInteger hours = [comp hour];
        NSInteger minutes = [comp minute];
        NSInteger secs = [comp second];
        NSInteger weeks = days / 7.0;
        
        
        NSString *timeRemaining = kEmptyString;
        
        if (weeks > 0) {
            timeRemaining = [NSString stringWithFormat:@" %ld %@", (long)weeks, @"w"];
        } else if (days > 0) {
            timeRemaining = [NSString stringWithFormat:@" %ld %@", (long)days, @"d"];
        } else if (hours > 0) {
            timeRemaining = [NSString stringWithFormat:@" %ld %@", (long)hours, @"h"];
        } else if (minutes > 0) {
            timeRemaining = [NSString stringWithFormat:@" %ld %@", (long)minutes, @"m"];
        } else if (minutes == 0) {
            if (secs > 0) {
                timeRemaining = [NSString stringWithFormat:@" %ld %@", (long)secs, @"s"];
            } else {
                if (secs == 0) {
                    timeRemaining = @" now";
                }
            }
        }
        return timeRemaining;

    };
    return timestamper;
}

+ (void)setFuzzyTimestampCalculator:(DXFuzzyTimestamper)calculator {
    fuzzyTimestampCalculator = calculator;
}

+ (DXFuzzyTimestamper)fuzzyTimestampCalculator {
    return fuzzyTimestampCalculator;
}

+ (void)startTimerIfNeeded {
    [allObjects dx_compact];
    if (allObjects.count) {
        if (!timestampUpdateTimer) {
            timestampUpdateTimer = [NSTimer scheduledTimerWithTimeInterval:timestampUpdateTimerRepeatRate
                                                                    target:self
                                                                  selector:@selector(updateTimestamps)
                                                                  userInfo:nil
                                                                   repeats:YES];
            [[NSRunLoop mainRunLoop] addTimer:timestampUpdateTimer forMode:NSRunLoopCommonModes];
        }
    }
}

+ (void)stopTimerIfNeeded {
    [allObjects dx_compact];
    if (!allObjects.count) {
        if (timestampUpdateTimer) {
            [timestampUpdateTimer invalidate];
            timestampUpdateTimer = nil;
        }
    }
}

+ (void)updateTimestamps {
    for (id<DXTimestamping> object in allObjects) {
        if (object) {
            [object updateTimestamp];
        }
    }
}

+ (void)trackAndUpdate:(id<DXTimestamping>)timestampControl {
    [allObjects addPointer:(__bridge void *)(timestampControl)];
    [self startTimerIfNeeded];
    [timestampControl updateTimestamp];
}

@end
