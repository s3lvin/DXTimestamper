//
//  ConversationViewController.m
//  TimestampLabel
//
//  Created by Selvin on 17/05/15.
//  Copyright (c) 2015 S3lvin. All rights reserved.
//

#import "ConversationViewController.h"
#import "ConversationCell.h"

@interface ConversationViewController () {
    NSMutableArray *_datasource;
    __weak IBOutlet UITableView *_tableview;
}
@end

@interface Conversation : NSObject

@property(nonatomic, strong) UIImage *image;
@property(nonatomic, strong) NSString *from;
@property(nonatomic, strong) NSString *recentMessage;
@property(nonatomic, strong) NSDate *timestamp;

@end

@implementation ConversationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _datasource = [NSMutableArray new];

    {
        Conversation *model = [Conversation new];
        model.image = [UIImage imageNamed:@"user_male_circle_filled-100"];
        model.from = @"Fevic";
        model.recentMessage = @"K... talk to ya laterzz..";
        model.timestamp = [[NSDate date] dateByAddingTimeInterval:-356];
        [_datasource addObject:model];
    }

    {
        Conversation *model = [Conversation new];
        model.image = [UIImage imageNamed:@"user_male_circle_filled-100"];
        model.from = @"You";
        model.recentMessage = @"Tommy Emmanuel is the best guitar player!";
        model.timestamp = [[NSDate date] dateByAddingTimeInterval:-52];
        [_datasource addObject:model];
    }

    {
        Conversation *model = [Conversation new];
        model.image = [UIImage imageNamed:@"user_male_circle_filled-100"];
        model.from = @"Michael";
        model.recentMessage = @"Hey! I'm back on Whatsapp... Will send you the..";
        model.timestamp = [[NSDate date] dateByAddingTimeInterval:88000];
        [_datasource addObject:model];
    }

    {
        Conversation *model = [Conversation new];
        model.image = [UIImage imageNamed:@"user_male_circle_filled-100"];
        model.from = @"Selvin";
        model.recentMessage = @"I'm Ironman";
        model.timestamp = [[NSDate date] dateByAddingTimeInterval:88000 * 7];
        [_datasource addObject:model];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _datasource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    ConversationCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ConversationCell"];
    Conversation *model = _datasource[indexPath.row % _datasource.count];

    cell.avatar.image = model.image;
    cell.fromLabel.text = model.from;
    cell.recentMessageLabel.text = model.recentMessage;
    cell.updatedTimeLabel.timestamp = model.timestamp;

    return cell;
}

- (void)deleteData {
    [_datasource removeAllObjects];
    _datasource = nil;
    [_tableview reloadData];
}

@end

@implementation Conversation

@end
