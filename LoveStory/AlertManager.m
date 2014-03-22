//
//  AlertManager.m
//  LoveStory
//
//  Created by Xu Xian on 14-3-22.
//  Copyright (c) 2014年 Xu Xian. All rights reserved.
//

#import "AlertManager.h"

#import "Dairy.h"
#import "DairyDAO.h"
#import "DairyManager.h"
#import "PageViewControllerFactory.h"
#import "DatabaseManager.h"

@interface AlertManager()<UIAlertViewDelegate>
{
    UIAlertView *_saveAlert;
}

@end

@implementation AlertManager


//access singleton in two ways: sharedDataManager and init
static AlertManager *sharedAlertManager = nil;
/* singleton */
+(AlertManager *)sharedAlertManager{
    @synchronized(self){
        if(!sharedAlertManager){
            sharedAlertManager = [[AlertManager alloc]init];
        }
    }
    return sharedAlertManager;
}
/* singleton */
-(id)init{
    if(!sharedAlertManager){
        self = [super init];
        if(self){
            sharedAlertManager = self;
        }
    }
    return sharedAlertManager;
}

#pragma mark - Save Button
- (void)pressSave{
    if(!_saveAlert)
    {
        _saveAlert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"ALERT_TITLE", nil)
                                                message:NSLocalizedString(@"ALERT_SAVE_TEXT", nil)
                                               delegate:self
                                      cancelButtonTitle:NSLocalizedString(@"ALERT_CANCEL", nil)
                                      otherButtonTitles:NSLocalizedString(@"ALERT_CONFIRM", nil), nil];
    }
    
    [_saveAlert show];
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(_saveAlert == alertView)
    {
        Dairy *dairy;
        switch (buttonIndex) {
            case 0:
                //do nothing
                break;
            case 1:
                //保存 跳转到主页
                dairy = [[DairyManager sharedDairyManager] currentDairy];
                if(dairy)
                {
                }
                //若此页面为新建的，则新建一个Dairy
                else
                {
                    dairy = [[DairyDAO sharedDairyDAO] createEntity];
                }
                
                dairy.updateTime = [[NSDate date] timeIntervalSince1970] * 1000;
                
                [DairyManager sharedDairyManager].currentDairy = nil;
                
                [self.delegate alertMangerReturn:dairy];
                break;
                
            default:
                break;
        }
    }
}

@end
