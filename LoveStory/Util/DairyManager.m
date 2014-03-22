//
//  DairyManager.m
//  LoveStory
//
//  Created by Xu Xian on 14-3-22.
//  Copyright (c) 2014年 Xu Xian. All rights reserved.
//

#import "DairyManager.h"

#import "Dairy.h"

@implementation DairyManager

//access singleton in two ways: sharedDairyManager and init
static DairyManager *sharedDairyManager = nil;
/* singleton */
+(DairyManager *)sharedDairyManager{
    @synchronized(self){
        if(!sharedDairyManager){
            sharedDairyManager = [[DairyManager alloc]init];
        }
    }
    return sharedDairyManager;
}
/* singleton */
-(id)init{
    if(!sharedDairyManager){
        self = [super init];
        if(self){
            sharedDairyManager = self;
        }
    }
    return sharedDairyManager;
}



@end
