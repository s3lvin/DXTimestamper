//
//  DXTimestampLabel.h
//  TimestampLabel
//
//  Created by Selvin on 11/05/15.
//  Copyright (c) 2015 S3lvin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DXTimestamper.h"

@interface DXTimestampLabel : UILabel <DXTimestamping>

@property(nullable, nonatomic, strong) NSDate *timestamp;

@end
