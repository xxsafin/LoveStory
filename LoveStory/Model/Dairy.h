//
//  Dairy.h
//  LoveStory
//
//  Created by Xu Xian on 14-3-22.
//  Copyright (c) 2014年 Xu Xian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Dairy : NSManagedObject

@property (nonatomic) int64_t createTime;
@property (nonatomic) int64_t updateTime;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSString * content;
@property (nonatomic) int16_t kimoji;
@property (nonatomic) int16_t backgroundType;

@end
