//
//  PageViewFactory.h
//  LoveStory
//
//  Created by Xu Xian on 14-3-22.
//  Copyright (c) 2014年 Xu Xian. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AlertManager.h"

typedef enum
{
    kPageViewTypeBicycle = 1,
    kPageViewTypeCloud,
    kPageViewTypeRobot,
    kPageViewTypeRail,
    kPageViewTypeSunflower,
    kPageViewTypeGuoBao,
    kPageViewTypeCoffee,
}
PageViewControllerType;

@interface PageViewControllerFactory : NSObject


+(id)controllerWithPageViewType:(PageViewControllerType)type;

@end
