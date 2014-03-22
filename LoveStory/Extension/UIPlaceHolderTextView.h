//
//  UIPlaceHolderTextView.h
//  EXPOIOS
//
//  Created by Xu Xian on 14-1-7.
//  Copyright (c) 2014年 Xu Xian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIPlaceHolderTextView : UITextView

@property (nonatomic, retain) NSString *placeholder;
@property (nonatomic, retain) UIColor *placeholderColor;

-(void)textChanged:(NSNotification*)notification;

@end
