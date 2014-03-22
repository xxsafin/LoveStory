//
//  LocaleUtil.m
//  LoveStory
//
//  Created by Xu Xian on 14-3-22.
//  Copyright (c) 2014年 Xu Xian. All rights reserved.
//

#import "LocaleUtil.h"

static NSDateFormatter *_dateFormatter;

@implementation LocaleUtil

+(NSString *)requestStringForLocale:(CustomLocale)locale
{
    switch (locale) {
        case kCustomLocaleSimplyfiedChinese:
            return @"CN";
            break;
        case kCustomLocaleEnglish:
            return @"EN";
            break;
            
        default:
            return @"CN";
            break;
    }
}

+(NSString *)dateFormatterLocaleString:(CustomLocale)locale
{
    switch (locale) {
        case kCustomLocaleSimplyfiedChinese:
            return @"zh_CN";
            break;
        case kCustomLocaleEnglish:
            return @"en_US";
            break;
            
        default:
            return @"zh_CN";
            break;
    }
}

+ (NSDateFormatter *)formatterWithLocale:(CustomLocale)locale
{
    if(!_dateFormatter)
    {
        [NSDateFormatter setDefaultFormatterBehavior:NSDateFormatterBehaviorDefault];
        _dateFormatter = [[NSDateFormatter alloc] init];
        [_dateFormatter setDateStyle:NSDateFormatterMediumStyle];
        [_dateFormatter setTimeStyle:NSDateFormatterMediumStyle];
    }
    
    NSLocale *nsLocale = [NSLocale localeWithLocaleIdentifier:[LocaleUtil dateFormatterLocaleString:locale]];
    [_dateFormatter setLocale:nsLocale];
    return _dateFormatter;
}

@end
