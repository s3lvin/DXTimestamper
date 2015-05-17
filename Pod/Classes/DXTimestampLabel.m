//
//  DXTimestampLabel.m
//  TimestampLabel
//
//  Created by Selvin on 11/05/15.
//  Copyright (c) 2015 S3lvin. All rights reserved.
//

#import "DXTimestampLabel.h"

@implementation DXTimestampLabel

- (instancetype)init {
    if (self = [super init]) {
        [DXTimestamper trackAndUpdate:self];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [DXTimestamper trackAndUpdate:self];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [DXTimestamper trackAndUpdate:self];
    }
    return self;
}

- (void)setTimestamp:(NSDate *__nullable)timestamp {
    _timestamp = timestamp;
    if (timestamp == nil) {
        self.text = kEmptyString;
    } else {
        [self updateTimestamp];
    }
}

- (void)updateTimestamp {
    dispatch_async(dispatch_get_main_queue(), ^{
        if (self.timestamp == nil) {
            self.text = kEmptyString;
        } else {
            self.text = [self.timestamp timestampString];
        }
    });
}

@end
