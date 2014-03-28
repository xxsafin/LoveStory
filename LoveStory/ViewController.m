//
//  ViewController.m
//  LoveStory
//
//  Created by Xu Xian on 14-2-27.
//  Copyright (c) 2014年 Xu Xian. All rights reserved.
//

#import "ViewController.h"

#import "PageViewControllerFactory.h"
#import "DairyTableViewController.h"

#import "Params.h"

@interface ViewController ()
{
    UIAlertView *_createPageAlert;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //背景
    self.bg2.alpha = 1;
    self.bg1.alpha = 0;
    self.bg2.transform = CGAffineTransformMakeTranslation(0, 480);
    
    //查看和新建按钮
    self.createPage.alpha = 0;
    self.openDairy.alpha = 0;
    self.createPage.transform = CGAffineTransformMakeScale(0, 0);
    self.openDairy.transform = CGAffineTransformMakeScale(0, 0);
    
    [UIView animateWithDuration:1.0 delay:0.1 usingSpringWithDamping:0.7 initialSpringVelocity:1 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.bg2.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:0.5
                              delay:0
             usingSpringWithDamping:0.4
              initialSpringVelocity:10
                            options:UIViewAnimationOptionCurveEaseOut
                         animations:^{
                             self.createPage.transform = CGAffineTransformIdentity;
                             self.openDairy.transform = CGAffineTransformIdentity;
                             self.createPage.alpha = 1;
                             self.openDairy.alpha = 1;
                         }
                         completion:^(BOOL finished) {
                         }];
    }];
    
    double delayInSeconds = 1.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        
        [UIView animateWithDuration:1.0 animations:^{
            self.bg1.alpha = 1;
        }];
    });
}

- (void)viewWillAppear:(BOOL)animated
{
}

- (void)viewDidAppear:(BOOL)animated
{

}

- (IBAction)newPagePressed:(id)sender {
    [self alertCreatePage];
}

- (IBAction)openDairyPressed:(id)sender {
    DairyTableViewController *controller = [[DairyTableViewController alloc] init];
    
    controller.dairies = [[DairyDAO sharedDairyDAO] fetchAll];
    
    [self.navigationController pushViewController:controller animated:YES];
}

- (void)alertCreatePage
{
    if(!_createPageAlert)
    {
        _createPageAlert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"ALERT_TITLE", nil)
                                                      message:nil
                                                     delegate:self
                                            cancelButtonTitle:@"取消"
                                            otherButtonTitles:@"和果果骑自行车~" ,@"和果果看飞机~", @"和果果的机器人跳舞~", @"和果果坐高铁~", @"果果的向日葵什么时候到呀~", @"果果和宝宝cosplay~", @"今天累了,和果果睡大觉~", nil];
        
    }
    [_createPageAlert show];
}

#pragma mark - UIAlertView Delegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(_createPageAlert == alertView)
    {
        id controller;
        DairyManager *dm = [DairyManager sharedDairyManager];
        dm.currentDairy = nil;
        
        switch (buttonIndex) {
            case 1:
                controller = [PageViewControllerFactory controllerWithPageViewType:kPageViewTypeBicycle];
                break;
            case 2:
                controller = [PageViewControllerFactory controllerWithPageViewType:kPageViewTypeCloud];
                break;
            case 3:
                controller = [PageViewControllerFactory controllerWithPageViewType:kPageViewTypeRobot];
                break;
            case 4:
                controller = [PageViewControllerFactory controllerWithPageViewType:kPageViewTypeRail];
                break;
            case 5:
                controller = [PageViewControllerFactory controllerWithPageViewType:kPageViewTypeSunflower];
                break;
            case 6:
                controller = [PageViewControllerFactory controllerWithPageViewType:kPageViewTypeGuoBao];
                break;
            case 7:
                controller = [PageViewControllerFactory controllerWithPageViewType:kPageViewTypeCoffee];
                break;
        }
        
        [self.navigationController pushViewController:controller animated:YES];
    }
}


- (BOOL)prefersStatusBarHidden {
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
