//
//  CloudViewController.m
//  LoveStory
//
//  Created by Xu Xian on 14-3-4.
//  Copyright (c) 2014年 Xu Xian. All rights reserved.
//

#import "CloudViewController.h"

#import "Params.h"

@interface CloudViewController ()

@end

@implementation CloudViewController

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
    
    [self cloudStartMoving:self.cloud1];
    [self cloudStartMoving:self.cloud2];
    [self cloudStartMoving:self.cloud3];
    
    [self planeStartMoving:self.plane];
    
}

- (void)cloudStartMoving:(UIImageView *)cloud
{
    UIImageView *cloudRepeat = [[UIImageView alloc] initWithFrame:CGRectOffset(cloud.frame, -320, 0)];
    cloudRepeat.image = cloud.image;
    
    [self.view addSubview:cloudRepeat];
    
    //animate the right cloud
    [UIView animateWithDuration:DURATION_CLOUD_ONE_PAGE animations:^{
        cloud.frame = CGRectOffset(cloud.frame, 320, 0);
    } completion:^(BOOL finished) {
        cloud.frame = CGRectOffset(cloud.frame, -640, 0);
        [self cloudScroll:cloud];
    }];
    
    //animate the left cloud
    [self cloudScroll:cloudRepeat];
}

- (void)planeStartMoving:(UIImageView *)plane
{
    [UIView animateWithDuration:DURATION_PLANE_ONE_PAGE delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        plane.frame = CGRectOffset(plane.frame, -320, 0);
    } completion:^(BOOL finished) {
        plane.frame = CGRectOffset(plane.frame, 520, 0);
        [self planeScroll:plane];
    }];
}

- (void)cloudScroll:(UIImageView *)cloud
{
    [UIView animateWithDuration:DURATION_CLOUD_ONE_PAGE * 2 animations:^{
        cloud.frame = CGRectOffset(cloud.frame, 640, 0);
    } completion:^(BOOL finished) {
        cloud.frame = CGRectOffset(cloud.frame, -640, 0);
        [self cloudScroll:cloud];
    }];
}

- (void)planeScroll:(UIImageView *)plane
{
    [UIView animateWithDuration:DURATION_PLANE_ONE_PAGE * 1.7 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        plane.frame = CGRectOffset(plane.frame, -520, 0);
    } completion:^(BOOL finished) {
        plane.frame = CGRectOffset(plane.frame, 520, 0);
        [self planeScroll:plane];
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
