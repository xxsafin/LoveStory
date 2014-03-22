//
//  FirstPageViewController.h
//  LoveStory
//
//  Created by Xu Xian on 14-2-27.
//  Copyright (c) 2014年 Xu Xian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BasePageViewController.h"

@class UIPlaceHolderTextView;
@interface BicycleViewController : BasePageViewController

@property (weak, nonatomic) IBOutlet UIImageView *bicycleBody;
@property (weak, nonatomic) IBOutlet UIImageView *bicycleBackWheel;
@property (weak, nonatomic) IBOutlet UIImageView *bicycleFrontWheel;
@property (weak, nonatomic) IBOutlet UIImageView *ballon;

@property (weak, nonatomic) IBOutlet UIButton *saveButton;
@property (weak, nonatomic) IBOutlet UIPlaceHolderTextView *textView;
@end
