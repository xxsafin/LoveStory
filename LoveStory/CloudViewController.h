//
//  CloudViewController.h
//  LoveStory
//
//  Created by Xu Xian on 14-3-4.
//  Copyright (c) 2014年 Xu Xian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BasePageViewController.h"

@class UIPlaceHolderTextView;
@interface CloudViewController : BasePageViewController

@property (weak, nonatomic) IBOutlet UIImageView *cloud1;
@property (weak, nonatomic) IBOutlet UIImageView *cloud2;
@property (weak, nonatomic) IBOutlet UIImageView *cloud3;
@property (weak, nonatomic) IBOutlet UIImageView *cloud4;

@property (weak, nonatomic) IBOutlet UIImageView *plane;
@property (weak, nonatomic) IBOutlet UIPlaceHolderTextView *textView;

@end
