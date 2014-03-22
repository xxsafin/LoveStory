//
//  DairyTableViewController.m
//  LoveStory
//
//  Created by Xu Xian on 14-3-22.
//  Copyright (c) 2014年 Xu Xian. All rights reserved.
//

#import "DairyTableViewController.h"
#import "Dairy.h"

#import "Params.h"
#import "EmptyCellFactory.h"
#import "TitleSubtitleTableViewCell.h"
#import "LocaleUtil.h"

#import "PageViewControllerFactory.h"
#import "BicycleViewController.h"

@interface DairyTableViewController ()<UITableViewDataSource, UITableViewDelegate, UIGestureRecognizerDelegate>{
}
@end

@implementation DairyTableViewController
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self.tableView setAllowsSelection:YES];
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [self.tableView setBackgroundColor:[UIColor clearColor]];
    if ([self.tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [self.tableView setSeparatorInset:UIEdgeInsetsZero];
    }
    
    if([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]){
        self.navigationController.interactivePopGestureRecognizer.delegate = self;
    }
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self.tableView reloadData];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

#pragma mark - Remove Status Bar
-(BOOL)prefersStatusBarHidden{
    return YES;
}

#pragma mark - Init Nav Bar

#pragma mark - OnTouch Event
#pragma mark - Tableview Delegate and Datasource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(!_dairies || _dairies.count ==0){
        //we should show “暂无嘉宾”
        return 1;
    }
    else{
        return _dairies.count;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return TABLE_CELL_HEIGHT_DOUBLE_LINE;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier =@"Dairy";
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:CellIdentifier ];
    if(cell == nil){
        cell = [[TitleSubtitleTableViewCell alloc] initHasAvatarWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    //deal with conditions when no data exists
    if(!_dairies||_dairies.count ==0){
        return [EmptyCellFactory cellWithtitle:@"宝宝一篇日记都木有写"];
    }
    else{
        //set cell
        cell.textLabel.text =@"";
        
        Dairy *dairy = [_dairies objectAtIndex:indexPath.row];
        
        //get data model
        UILabel *title =(UILabel *)[cell.contentView viewWithTag:tag_cell_title];
        UILabel *subTitle =(UILabel *)[cell.contentView viewWithTag:tag_cell_subtitle];
        
        NSDateFormatter *dateFormmater= [LocaleUtil formatterWithLocale:kCustomLocaleSimplyfiedChinese];
        
        [title setText:[NSString stringWithFormat:@"%@", [dateFormmater stringFromDate:[NSDate dateWithTimeIntervalSince1970:dairy.createTime / 1000]]]];
        [subTitle setText:[NSString stringWithFormat:@"%@" , dairy.content]];
        
        UIImageView *avatar = (UIImageView *)[cell.contentView viewWithTag:tag_cell_avatar];
        avatar.image = [UIImage imageNamed:@"dairy_icon_default"];
        
        [title setHidden:NO];
        [subTitle setHidden:NO];
        [cell.accessoryView setHidden:NO];
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    if(!_dairies || _dairies.count ==0){
        return;
    }
    
    //get data model
    Dairy *dairy = [_dairies objectAtIndex:indexPath.row];
    
    id controller = [PageViewControllerFactory controllerWithPageViewType:dairy.backgroundType];
    
    [DairyManager sharedDairyManager].currentDairy = dairy;
    [self.navigationController pushViewController:controller animated:YES];
}


#pragma mark - Memory Management
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
