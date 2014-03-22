//
//  AlertManager.h
//  LoveStory
//
//  Created by Xu Xian on 14-3-22.
//  Copyright (c) 2014年 Xu Xian. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Dairy;
@protocol AlertManagerDelegate <NSObject>

@required
-(void)alertMangerReturn:(Dairy *)dairy;

@end

@interface AlertManager : NSObject

@property (strong, nonatomic) id<AlertManagerDelegate> delegate;

+(AlertManager *)sharedAlertManager;
- (void)pressSave;

@end
