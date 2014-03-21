//
//  RobotViewController.m
//  LoveStory
//
//  Created by Xu Xian on 14-3-4.
//  Copyright (c) 2014年 Xu Xian. All rights reserved.
//

#import "RobotViewController.h"
#import "Params.h"
#import "UIImage+Overlay.h"

@interface RobotViewController ()
{
    NSInteger _currentColorIndex;
    NSArray *_colors;
    NSTimer *_colorTimer;
}

@end

@implementation RobotViewController

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

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self robotStartChangingColor];
}

- (void)robotStartChangingColor
{
    if(!_colors)
    {
        _currentColorIndex = 0;
        _colors = [[NSArray alloc] initWithObjects:
                   [NSNumber numberWithInt:COLOR_ROBOT_1],
                   [NSNumber numberWithInt:COLOR_ROBOT_2],
                   [NSNumber numberWithInt:COLOR_ROBOT_3],
                   [NSNumber numberWithInt:COLOR_ROBOT_4],
                   [NSNumber numberWithInt:COLOR_ROBOT_5],
                   [NSNumber numberWithInt:COLOR_ROBOT_6],
                   [NSNumber numberWithInt:COLOR_ROBOT_7],
                   [NSNumber numberWithInt:COLOR_ROBOT_8],
                   nil];
    }
    
    if (!_colorTimer)
    {
        _colorTimer = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(robotChangeColor) userInfo:nil repeats:YES];
    }
}

- (void)robotStopChangingColor
{
    
}

- (void)robotChangeColor
{
    _currentColorIndex = (_currentColorIndex + 1) % _colors.count;
    
    self.robot.image = [[UIImage imageNamed:@"robot"] imageWithOverlayColor:UIColorFromRGB([[_colors objectAtIndex:_currentColorIndex] integerValue])];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
