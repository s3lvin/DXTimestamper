//
//  NotificationCell.h
//  TimestampLabel
//
//  Created by Selvin on 17/05/15.
//  Copyright (c) 2015 S3lvin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DXTimestampButton.h"

@interface NotificationCell : UITableViewCell

@property(weak, nonatomic) IBOutlet UIImageView *avatar;
@property(weak, nonatomic) IBOutlet UILabel *notificationText;
@property(weak, nonatomic) IBOutlet DXTimestampButton *timestampButton;

@end
