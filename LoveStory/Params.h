//
//  Params.h
//  LoveStory
//
//  Created by Xu Xian on 14-3-4.
//  Copyright (c) 2014年 Xu Xian. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ViewDecorator.h"
#import "UIKeyboardViewController.h"
#import "DatabaseManager.h"
#import "Dairy.h"
#import "DairyDAO.h"
#import "DairyManager.h"

#define DURATION_CLOUD_ONE_PAGE 20
#define DURATION_PLANE_ONE_PAGE 15

//除去嘉宾之外的cell用这个height#pragma mark - NAVIGATION BAR AND STATUS BAR
#define SYS_NAVBAR_HEIGHT 64
#define SYS_SEARCHBAR_HEIGHT 44
#define STATUS_BAR_HEIGHT 20

#define NAVBAR_NEGATIVE_SPACER_WIDTH 0
#define NAVBAR_NEGATIVE_SPACER_WIDTH_CUSTOM -15

#pragma mark - TABLE VIEW
//除去嘉宾之外的cell用这个height
#define TABLE_CELL_HEIGHT 55
//嘉宾cell用这个height
#define TABLE_CELL_HEIGHT_DOUBLE_LINE 60

#define TABLE_CELL_HEIGHT_EXHIBITOR 130

#define TABLE_CELL_GAP 1
#define TABLE_CELL_GAP_WIDE 0
#define TABLE_SECTION_HEADER_HEIGHT 18
#define TABLE_SECTION_FOOTTER_HEIGHT 10

#define CELL_TITLE_WIDTH_LONG 260 // for title without item before it
#define CELL_TITLE_WIDTH_SHORT 211//for title with item(收藏按钮) before it


#define CELL_TITLE_WIDTH_EXHIBITOR_LONG 298 //内容标签
#define CELL_TITLE_WIDTH_EXHIBITOR_SHORT 252 //标题标签

#pragma mark - FONT SIZE
#define FONTSIZE_HELPTYPE_TABLE_CELL_TITLE 18.0
#define FONTSIZE_TABLE_CELL_SINGLETILE 14.0

#define FONTSIZE_SECTION_TITLE 12.0

#pragma mark - FONT SIZE NAVIGATION BAR
#define FONTSIZE_NAVIGATION_TITLE 16.0

#pragma mark - FONT SIZE EXHIBITOR
//#define FONTSIZE_EXHIBITOR_TABLE_CELL_TITLE 17.0
//#define FONTSIZE_EXHIBITOR_TABLE_CELL_TITLE_RECOMMEND 18.0
#define FONTSIZE_EXHIBITOR_TABLE_CELL_TITLE 15.0
#define FONTSIZE_EXHIBITOR_TABLE_CELL_TITLE_RECOMMEND 16.0
#define FONTSIZE_EXHIBITOR_TABLE_CELL_SUBTITLE 11.0
#define FONTSIZE_EXHIBITOR_TABLE_CELL_SUBTITLE_SMALL 10.0
#define FONTSIZE_EXHIBITOR_TABLE_CELL_CONTENT 12.0
#define FONTSIZE_EXHIBITOR_TABLE_CELL_BUTTON 12.0

#define COLOR_ROBOT_1 (234*256*256 + 244*256 + 122)
#define COLOR_ROBOT_2 (249*256*256 + 177*256 + 190)
#define COLOR_ROBOT_3 (249*256*256 + 157*256 + 174)
#define COLOR_ROBOT_4 (244*256*256 + 167*256 + 122)
#define COLOR_ROBOT_5 (155*256*256 + 242*256 + 216)
#define COLOR_ROBOT_6 (113*256*256 + 226*256 + 151)
#define COLOR_ROBOT_7 (145*256*256 + 174*256 + 247)
#define COLOR_ROBOT_8 (155*256*256 + 158*256 + 170)

#define TABLE_NAME_DAIRY @"Dairy"


typedef enum{
    tag_cell_title = 123,
    tag_cell_subtitle,
    tag_cell_content,
    tag_cell_visited,
    tag_cell_favorite,
    tag_cell_note,
    tag_cell_showmap,
    tag_cell_icon,
    tag_cell_bg,
    tag_cell_avatar,
    tag_cell_number_title,
    tag_cell_suffix_title,
    tag_recommend_image_view,
    tag_cell_seperator_line,
} tag;


//get color from hex
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface Params : NSObject

@end
