//
//  ViewDecorator.m
//  LoveStory
//
//  Created by Xu Xian on 14-3-22.
//  Copyright (c) 2014年 Xu Xian. All rights reserved.
//

#import "ViewDecorator.h"

@implementation ViewDecorator

+(void)decorateTextView:(UITextView *)textView
{
    //To make the border look very close to a UITextField
    [textView.layer setBorderColor:[[[UIColor grayColor] colorWithAlphaComponent:0.5] CGColor]];
    [textView.layer setBorderWidth:2.0];
    
    //The rounded corner part, where you specify your view's corner radius:
    textView.layer.cornerRadius = 5;
    textView.clipsToBounds = YES;
    
    //    UIBezierPath *shadowPath = [UIBezierPath bezierPathWithRect:_textView.bounds];
    textView.layer.masksToBounds = NO;
    textView.layer.shadowColor = [UIColor blackColor].CGColor;
    textView.layer.shadowOffset = CGSizeMake(0.0f, 5.0f);
    textView.layer.shadowOpacity = 0.5f;
}

+(void)textViewHideKeyboard:(UITextView *)textView target:(id)target selector:(SEL)selector
{
    UIToolbar * topView = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 30)];
    [topView setBarStyle:UIBarStyleBlackTranslucent];
    
//    UIBarButtonItem * helloButton = [[UIBarButtonItem alloc]initWithTitle:@"Hello" style:UIBarButtonItemStyleBordered target:self action:nil];
    
    UIBarButtonItem * btnSpace = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    
    UIBarButtonItem * doneButton = [[UIBarButtonItem alloc]initWithTitle:@"隐藏" style:UIBarButtonItemStyleDone target:target action:selector];
    
    
    NSArray * buttonsArray = [NSArray arrayWithObjects:btnSpace,doneButton,nil];
    
    [topView setItems:buttonsArray];
    [textView setInputAccessoryView:topView];
}

@end
