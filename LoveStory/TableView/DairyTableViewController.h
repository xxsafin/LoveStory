//
//  DairyTableViewController.h
//  LoveStory
//
//  Created by Xu Xian on 14-3-22.
//  Copyright (c) 2014年 Xu Xian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DairyTableViewController : UIViewController


@property (nonatomic , retain) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSArray *dairies;

@end
