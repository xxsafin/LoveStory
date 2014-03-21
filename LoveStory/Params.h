//
//  Params.h
//  LoveStory
//
//  Created by Xu Xian on 14-3-4.
//  Copyright (c) 2014年 Xu Xian. All rights reserved.
//

#import <Foundation/Foundation.h>

#define DURATION_CLOUD_ONE_PAGE 20
#define DURATION_PLANE_ONE_PAGE 15

#define COLOR_ROBOT_1 (234*256*256 + 244*256 + 122)
#define COLOR_ROBOT_2 (249*256*256 + 177*256 + 190)
#define COLOR_ROBOT_3 (249*256*256 + 157*256 + 174)
#define COLOR_ROBOT_4 (244*256*256 + 167*256 + 122)
#define COLOR_ROBOT_5 (155*256*256 + 242*256 + 216)
#define COLOR_ROBOT_6 (113*256*256 + 226*256 + 151)
#define COLOR_ROBOT_7 (145*256*256 + 174*256 + 247)
#define COLOR_ROBOT_8 (155*256*256 + 158*256 + 170)


//get color from hex
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface Params : NSObject

@end
