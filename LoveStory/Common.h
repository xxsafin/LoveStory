//
//  Common.h
//  GaisangIOS
//
//  Created by Xu Xian on 14-3-11.
//  Copyright (c) 2014年 Xu Xian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Common : NSObject

//get color from hex
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@end
