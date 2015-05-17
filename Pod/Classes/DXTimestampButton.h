//
//  DXTimestampButton.h
//  TimestampLabel
//
//  Created by Selvin on 16/05/15.
//  Copyright (c) 2015 S3lvin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DXTimestamper.h"

@interface DXTimestampButton : UIButton <DXTimestamping>

@property(nonatomic, strong) NSDate *timestamp;

@end
