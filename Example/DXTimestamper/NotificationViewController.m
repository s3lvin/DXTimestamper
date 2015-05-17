//
//  NotificationViewController.m
//  TimestampLabel
//
//  Created by Selvin on 17/05/15.
//  Copyright (c) 2015 S3lvin. All rights reserved.
//

#import "NotificationViewController.h"
#import "NotificationCell.h"

@interface NotificationViewController () {
    NSMutableArray *_datasource;
}

@end

@interface Notification : NSObject

@property(nonatomic, strong) UIImage *image;
@property(nonatomic, strong) NSString *message;
@property(nonatomic, strong) NSDate *timestamp;

@end

@implementation NotificationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _datasource = [NSMutableArray new];

    {
        Notification *notif = [Notification new];
        notif.image = [UIImage imageNamed:@"Bruce"];
        notif.message = @"Bruce is searching for Cat";
        notif.timestamp = [[NSDate date]dateByAddingTimeInterval:-60*60*24*2];
        [_datasource addObject:notif];
    }

    {
        Notification *notif = [Notification new];
        notif.image = [UIImage imageNamed:@"Gordan"];
        notif.message = @"Gordan is searching for Bruce";
        notif.timestamp = [[NSDate date]dateByAddingTimeInterval:-60*60*24*7];
        [_datasource addObject:notif];
    }

    {
        Notification *notif = [Notification new];
        notif.image = [UIImage imageNamed:@"Alfred"];
        notif.message = @"Alfred is looking for Police";
        notif.timestamp = [[NSDate date]dateByAddingTimeInterval:-60*60*24*7*2];
        [_datasource addObject:notif];
    }

    {
        Notification *notif = [Notification new];
        notif.image = [UIImage imageNamed:@"Cat"];
        notif.message = @"Cat got your toungue!";
        notif.timestamp = [[NSDate date]dateByAddingTimeInterval:-60*60*24*7*3];
        [_datasource addObject:notif];
    }

    {
        Notification *notif = [Notification new];
        notif.image = [UIImage imageNamed:@"Fish"];
        notif.message = @"Fish demolished Maroni :(";
        notif.timestamp = [[NSDate date]dateByAddingTimeInterval:-60*60*24*7*8];
        [_datasource addObject:notif];
    }

    {
        Notification *notif = [Notification new];
        notif.image = [UIImage imageNamed:@"Penguin"];
        notif.message = @"Penguin is happy of all this :)";
        notif.timestamp = [NSDate date];
        [_datasource addObject:notif];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _datasource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NotificationCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NotificationCell"];
    Notification *notif = _datasource[indexPath.row];

    cell.avatar.image = notif.image;
    cell.notificationText.text = notif.message;
    cell.timestampButton.timestamp = notif.timestamp;

    return cell;
}

@end

@implementation Notification

@end
