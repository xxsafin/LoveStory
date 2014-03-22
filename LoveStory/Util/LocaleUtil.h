//
//  LocaleUtil.h
//  LoveStory
//
//  Created by Xu Xian on 14-3-22.
//  Copyright (c) 2014年 Xu Xian. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum  {
    kCustomLocaleSimplyfiedChinese = 1,
    kCustomLocaleEnglish
} CustomLocale;




@interface LocaleUtil : NSObject

+ (NSDateFormatter *)formatterWithLocale:(CustomLocale)locale;

@end
