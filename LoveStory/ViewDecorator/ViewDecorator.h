//
//  ViewDecorator.h
//  LoveStory
//
//  Created by Xu Xian on 14-3-22.
//  Copyright (c) 2014年 Xu Xian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ViewDecorator : NSObject

+(void)decorateTextView:(UITextView *)textView;
+(void)textViewHideKeyboard:(UITextView *)textView target:(id)target selector:(SEL)selector;

@end
