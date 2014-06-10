//
//  UIImage+Text.h
//  HuiYuanIOS
//
//  Created by Xu Xian on 14-4-9.
//  Copyright (c) 2014年 Xu Xian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Text)

-(UIImage *)addText:(UIImage *)img text:(NSString *)text1;
-(UIImage *)addLabel:(UILabel *)label;
-(UIImage*) addLabelInCenter:(UILabel *)label;
    
@end
