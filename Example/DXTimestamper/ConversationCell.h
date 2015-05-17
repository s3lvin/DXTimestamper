//
//  ConversationCell.h
//  TimestampLabel
//
//  Created by Selvin on 17/05/15.
//  Copyright (c) 2015 S3lvin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DXTimestampLabel.h"

@interface ConversationCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *avatar;
@property(weak, nonatomic) IBOutlet UILabel *fromLabel;
@property(weak, nonatomic) IBOutlet UILabel *recentMessageLabel;
@property(weak, nonatomic) IBOutlet DXTimestampLabel *updatedTimeLabel;

@end
