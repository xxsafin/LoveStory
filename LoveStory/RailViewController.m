//
//  RailViewController.m
//  LoveStory
//
//  Created by Xu Xian on 14-3-4.
//  Copyright (c) 2014年 Xu Xian. All rights reserved.
//

#define TRAIN_STEP 2

#import "RailViewController.h"

@interface RailViewController ()<UIGestureRecognizerDelegate>
{
    int position;
    int direction;
    
    int step;
    CGPoint destPoint;
    CGPoint offSet;
}

@end

@implementation RailViewController

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
    self.pageViewType = kPageViewTypeRail;
    
    UITapGestureRecognizer *tap =[[UITapGestureRecognizer alloc] init];
    [tap addTarget:[AlertManager sharedAlertManager] action:@selector(pressSave)];
    [tap setNumberOfTapsRequired:1];
    [_train setUserInteractionEnabled:YES];
    [_train addGestureRecognizer:tap];
    
    [super viewDidLoad];
    
    _guoguoQin.center = CGPointMake(_spot1.center.x, _spot1.center.y - 25);
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

-(void)viewDidAppear:(BOOL)animated
{
    position = 1;
    direction = 1;
    step = TRAIN_STEP;
    
    [self guoguoStartAnimate];
}

- (void)guoguoStartAnimate
{
    [self guoguoAnimateOneStep];
}

- (void)guoguoAnimateOneStep
{
    if(step == TRAIN_STEP)
    {
        CGPoint originP;
        switch (position) {
            case 1:
                if(direction == -1)
                {
                    direction = -direction;
                }
                destPoint = _spot2.center;
                originP = _spot1.center;
                position += direction;
                break;
            case 2:
                if(direction == -1)
                {
                    destPoint = _spot1.center;
                }
                else
                {
                    destPoint = _spot3.center;
                }
                position += direction;
                originP = _spot2.center;
                break;
            case 3:
                if(direction == -1)
                {
                    destPoint = _spot2.center;
                }
                else
                {
                    destPoint = _spot4.center;
                }
                position += direction;
                originP = _spot3.center;
                break;
            case 4:
                if(direction == -1)
                {
                    destPoint = _spot3.center;
                }
                else
                {
                    destPoint = _spot5.center;
                }
                position += direction;
                originP = _spot4.center;
                break;
            case 5:
                if(direction == 1)
                {
                    direction = -direction;
                }
                destPoint = _spot4.center;
                position += direction;
                originP = _spot5.center;
                break;
        }
        
        offSet = CGPointMake((destPoint.x - originP.x) * 0.5, (destPoint.y - originP.y) * 0.5);
        
        NSLog([NSString stringWithFormat:@"x%f", offSet.x]);
        NSLog([NSString stringWithFormat:@"y%f", offSet.y]);
    }
    else
    {
        
    }
    
    [UIView animateWithDuration:1.0
                          delay:(step + 1) % 2
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         
//                         _guoguoQin.transform = CGAffineTransformTranslate(_guoguoQin.transform,  offSet.x, offSet.y);
//                         _guoguoQin.transform = CGAffineTransformScale(_guoguoQin.transform, step == 1 ? 0.5 : 2 , step == 1 ? 0.5 : 2);
                         _guoguoQin.center = CGPointMake(_guoguoQin.center.x + offSet.x, _guoguoQin.center.y + offSet.y);
                         
                         step ++;
                         if(step > TRAIN_STEP)
                         {
                             step = 1;
                         }
                     }
                     completion:^(BOOL finished) {
                         [self guoguoAnimateOneStep];
                     }];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
