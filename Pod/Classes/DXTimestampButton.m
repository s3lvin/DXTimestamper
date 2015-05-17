//
//  DXTimestampButton.m
//  TimestampLabel
//
//  Created by Selvin on 16/05/15.
//  Copyright (c) 2015 S3lvin. All rights reserved.
//

#import "DXTimestampButton.h"

@implementation DXTimestampButton

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
        [self setTitle:kEmptyString forState:UIControlStateNormal];
    } else {
        [self updateTimestamp];
    }
}

- (void)updateTimestamp {
    if (self.timestamp == nil) {
        [self setTitle:kEmptyString forState:UIControlStateNormal];
    } else {
        [self setTitle:[self.timestamp timestampString] forState:UIControlStateNormal];
    }
}

@end
