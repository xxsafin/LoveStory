//
//  FirstPageViewController.m
//  LoveStory
//
//  Created by Xu Xian on 14-2-27.
//  Copyright (c) 2014年 Xu Xian. All rights reserved.
//

#define STEP 5

#import "BicycleViewController.h"

@interface BicycleViewController ()

@end

@implementation BicycleViewController
static int count = 0;

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
	// Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated
{
    
    self.bicycleBody.transform = CGAffineTransformMakeTranslation( -320, 0);
    self.ballon.transform = CGAffineTransformMakeTranslation( -320, 0);
    
    self.bicycleBackWheel.center = CGPointMake(self.bicycleBackWheel.center.x - 320, self.bicycleBackWheel.center.y);
    self.bicycleFrontWheel.center = CGPointMake(self.bicycleFrontWheel.center.x - 320, self.bicycleFrontWheel.center.y);
    
}

- (void)viewDidAppear:(BOOL)animated
{
    self.bicycleBackWheel.layer.anchorPoint = CGPointMake(0.5, 0.5);
    self.bicycleFrontWheel.layer.anchorPoint = CGPointMake(0.5, 0.5);
    [self animateOneStep];
}

- (void)animateOneStep
{
    [UIView animateWithDuration:1.0 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        self.bicycleBackWheel.transform = CGAffineTransformRotate(self.bicycleBackWheel.transform, M_PI * 0.75 );
        self.bicycleFrontWheel.transform = CGAffineTransformRotate(self.bicycleFrontWheel.transform, M_PI * 0.75);
        
        self.bicycleBackWheel.center = CGPointMake(self.bicycleBackWheel.center.x + 320/STEP, self.bicycleBackWheel.center.y);
        self.bicycleFrontWheel.center = CGPointMake(self.bicycleFrontWheel.center.x + 320/STEP, self.bicycleFrontWheel.center.y);
        
        self.bicycleBody.transform = CGAffineTransformTranslate(self.bicycleBody.transform, 320 / STEP, 0);
        self.ballon.transform = CGAffineTransformTranslate(self.ballon.transform, 320 / STEP, 0);
    } completion:^(BOOL finished) {
        
        count ++;
        if(count < STEP)
        {
            [self animateOneStep];
        }
    }];
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
