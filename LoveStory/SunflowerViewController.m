//
//  SunflowerViewController.m
//  LoveStory
//
//  Created by Xu Xian on 14-3-4.
//  Copyright (c) 2014年 Xu Xian. All rights reserved.
//

#import "SunflowerViewController.h"

@interface SunflowerViewController ()<UIGestureRecognizerDelegate>

@end

@implementation SunflowerViewController

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
    if([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]){
        self.navigationController.interactivePopGestureRecognizer.delegate = self;
    }
    
    self.baseTextView = _textView;
    self.pageViewType = kPageViewTypeSunflower;
    
    UITapGestureRecognizer *tap =[[UITapGestureRecognizer alloc] init];
    [tap addTarget:[AlertManager sharedAlertManager] action:@selector(pressSave)];
    [tap setNumberOfTapsRequired:1];
    [_dog setUserInteractionEnabled:YES];
    [_dog addGestureRecognizer:tap];
    
    [super viewDidLoad];
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
