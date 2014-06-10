//
//  ViewFactory.h
//  HuiYuanIOS
//
//  Created by Xu Xian on 14-4-9.
//  Copyright (c) 2014年 Xu Xian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ViewFactory : NSObject

/* singleton */
+(ViewFactory *)sharedViewFactory;

- (UIImage *)titleViewWithImage:(UIImage *)image text:(NSString *)text;

- (UIView *)titleViewWithImage:(UIImage *)image text:(NSString *)text leftOffset:(CGFloat)offset;

- (UIView *)navigationContainerViewShiftedToLeft:(CGFloat)leftOffset titleView:(UIView *)titleView;

- (UILabel *)getDefaultLabel:(NSString *)text withFrame:(CGRect)frame;

- (UITextField *)getDefaultTextField:(NSString *)text withFrame:(CGRect)frame;
@end 
