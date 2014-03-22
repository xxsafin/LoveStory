//
//  BasePageViewController.h
//  LoveStory
//
//  Created by Xu Xian on 14-3-22.
//  Copyright (c) 2014年 Xu Xian. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AlertManager.h"
#import "UIKeyboardView.h"
#import "UIKeyboardViewController.h"
#import "UIPlaceHolderTextView.h"
#import "PageViewControllerFactory.h"

@interface BasePageViewController : UIViewController<UIGestureRecognizerDelegate, AlertManagerDelegate, UITextViewDelegate, UIKeyboardViewControllerDelegate, UIKeyboardViewDelegate>

@property (nonatomic ,weak) UIPlaceHolderTextView *baseTextView;

@property (nonatomic, assign) PageViewControllerType pageViewType;

@end
