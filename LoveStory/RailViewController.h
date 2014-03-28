//
//  RailViewController.h
//  LoveStory
//
//  Created by Xu Xian on 14-3-4.
//  Copyright (c) 2014年 Xu Xian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BasePageViewController.h"

@interface RailViewController : BasePageViewController
@property (weak, nonatomic) IBOutlet UIPlaceHolderTextView *textView;
@property (weak, nonatomic) IBOutlet UIImageView *train;

@property (weak, nonatomic) IBOutlet UIImageView *spot1;
@property (weak, nonatomic) IBOutlet UIImageView *spot2;
@property (weak, nonatomic) IBOutlet UIImageView *spot3;
@property (weak, nonatomic) IBOutlet UIImageView *spot4;
@property (weak, nonatomic) IBOutlet UIImageView *spot5;


@property (weak, nonatomic) IBOutlet UIImageView *guoguoQin;
@end
