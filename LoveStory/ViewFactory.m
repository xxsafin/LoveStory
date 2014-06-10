//
//  ViewFactory.m
//  HuiYuanIOS
//
//  Created by Xu Xian on 14-4-9.
//  Copyright (c) 2014年 Xu Xian. All rights reserved.
//

#import "ViewFactory.h"
#import "UIImage+Text.h"

#define FORM_LABEL_COLOR 0x000000
#define FORM_CONTENT_COLOR 0x005DAC

@implementation ViewFactory

//access singleton in two ways: sharedDataManager and init
static ViewFactory *sharedViewFactory = nil;
/* singleton */
+(ViewFactory *)sharedViewFactory{
    @synchronized(self){
        if(!sharedViewFactory){
            sharedViewFactory = [[ViewFactory alloc]init];
        }
    }
    return sharedViewFactory;
}
/* singleton */
-(id)init{
    if(!sharedViewFactory){
        self = [super init];
        if(self){
            sharedViewFactory = self;
        }
    }
    return sharedViewFactory;
}


- (UIImage *)titleViewWithImage:(UIImage *)image text:(NSString *)text
{
    UILabel *label = [[UILabel alloc] init];
    label.text = text;
    label.font = [UIFont systemFontOfSize:17.0];
    return [image addLabel:label];
}


- (UIView *)titleViewWithImage:(UIImage *)image text:(NSString *)text leftOffset:(CGFloat)offset
{

    UIImage *titleImage = [self titleViewWithImage:image text:text];
    
    UIImageView *titleView = [[UIImageView alloc] initWithFrame:CGRectMake(0,
                                                                           0,
                                                                           titleImage.size.width,
                                                                           titleImage.size.height)];
    titleView.image = titleImage;
    
    return [self navigationContainerViewShiftedToLeft:offset titleView:titleView];
}

- (UIView *)navigationContainerViewShiftedToLeft:(CGFloat)leftOffset titleView:(UIView *)titleView
{
    UIView *container = [[UIView alloc] initWithFrame:CGRectMake(titleView.frame.origin.x,
                                                                 titleView.frame.origin.y,
                                                                 titleView.frame.size.width + 2 * leftOffset,
                                                                 titleView.frame.size.height)];
    
    titleView.frame = CGRectMake(0,
                                 0,
                                 titleView.frame.size.width ,
                                 titleView.frame.size.height);
    [container addSubview:titleView];
    
    return container;
}

- (UIImageView *)imageViewWithImage:(UIImage *)image title:(NSString *)title
{
    UILabel *label = [[UILabel alloc] init];
    label.text = title;
    label.font = [UIFont systemFontOfSize:17.0];
    UIImage *labeledImage = [image addLabelInCenter:label];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0,
                                                                           0,
                                                                           labeledImage.size.width,
                                                                           labeledImage.size.height)];
    
    imageView.image = labeledImage;
    
    return imageView;
}

//- (UILabel *)getDefaultLabel:(NSString *)text withFrame:(CGRect)frame{
//    UILabel *label = [[UILabel alloc]initWithFrame:frame];
//    [label setText:text];
//    [label setFont:[UIFont systemFontOfSize:17.0];
//    [label setTextColor:UIColorFromRGB(FORM_LABEL_COLOR)];
//    
//    return label;
//}
//
//- (UITextField *)getDefaultTextField:(NSString *)text withFrame:(CGRect)frame{
//    UITextField *textField = [[UITextField alloc]initWithFrame:frame];
//    [textField setText:text];
//    [textField setFont:[UIFont systemFontOfSize:17.0];
//    [textField setTextColor:UIColorFromRGB(FORM_CONTENT_COLOR)];
//    [textField setBackgroundColor:[UIColor whiteColor]];
//    [textField setEnabled:YES];
//
//    return textField;
//}

@end
