//
//  DairyManager.h
//  LoveStory
//
//  Created by Xu Xian on 14-3-22.
//  Copyright (c) 2014年 Xu Xian. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Dairy;
@interface DairyManager : NSObject

@property (nonatomic, strong) Dairy *currentDairy;

+(DairyManager *)sharedDairyManager;

@end
