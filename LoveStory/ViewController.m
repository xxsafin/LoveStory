//
//  ViewController.m
//  LoveStory
//
//  Created by Xu Xian on 14-2-27.
//  Copyright (c) 2014年 Xu Xian. All rights reserved.
//

#import "ViewController.h"
#import "BicycleViewController.h"
#import "CloudViewController.h"
#import "RobotViewController.h"
#import "RailViewController.h"
#import "SunflowerViewController.h"
#import "GuoBaoViewController.h"
#import "CoffeeViewController.h"


@interface ViewController ()
{
    UIAlertView *_createPageAlert;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated
{
    self.bg2.alpha = 1;
    self.bg1.alpha = 0;
    
    self.bg2.transform = CGAffineTransformMakeTranslation(0, 480);
}

- (void)viewDidAppear:(BOOL)animated
{
    [UIView animateWithDuration:3.0 delay:0 usingSpringWithDamping:1 initialSpringVelocity:1 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.bg2.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
    }];
    
//    [UIView animateWithDuration:1.0 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
//        self.bg2.transform = CGAffineTransformIdentity;
//    } completion:^(BOOL finished) {
//    }];
    
    double delayInSeconds = 1.5;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        
        [UIView animateWithDuration:1.0 animations:^{
            self.bg1.alpha = 1;
        }];
    });
}

- (IBAction)newPagePressed:(id)sender {
    [self alertCreatePage];
    
//    BicycleViewController *controller = [[BicycleViewController alloc] init];
//    [self.navigationController pushViewController:controller animated:YES];
}

- (IBAction)openDairyPressed:(id)sender {
}

- (void)alertCreatePage
{
    if(!_createPageAlert)
    {
        _createPageAlert = [[UIAlertView alloc] initWithTitle:@"爱心日记"
                                                      message:nil
                                                     delegate:self
                                            cancelButtonTitle:@"取消"
                                            otherButtonTitles:@"和果果骑自行车" ,@"和果果看飞机", @"和果果的机器人跳舞", @"和果果坐火车", @"果果的向日葵什么时候到呀", @"果果和宝宝cosplay", @"今天累了,和果果睡大觉", nil];
        
    }
    [_createPageAlert show];
}

#pragma mark - UIAlertView Delegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(_createPageAlert == alertView)
    {
        UIViewController *controller;
        switch (buttonIndex) {
            case 1:
                controller = [[BicycleViewController alloc] init];
                break;
            case 2:
                controller = [[CloudViewController alloc] init];
                break;
            case 3:
                controller = [[RobotViewController alloc] init];
                break;
            case 4:
                controller = [[RailViewController alloc] init];
                break;
            case 5:
                controller = [[SunflowerViewController alloc] init];
                break;
            case 6:
                controller = [[GuoBaoViewController alloc] init];
                break;
            case 7:
                controller = [[CoffeeViewController alloc] init];
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
