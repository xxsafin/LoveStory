//
//  PageViewFactory.m
//  LoveStory
//
//  Created by Xu Xian on 14-3-22.
//  Copyright (c) 2014年 Xu Xian. All rights reserved.
//

#import "PageViewControllerFactory.h"
#import "BicycleViewController.h"
#import "CloudViewController.h"
#import "RobotViewController.h"
#import "RailViewController.h"
#import "SunflowerViewController.h"
#import "GuoBaoViewController.h"
#import "CoffeeViewController.h"

@implementation PageViewControllerFactory

+(id)controllerWithPageViewType:(PageViewControllerType)type
{
    id controller;
    switch (type) {
        case kPageViewTypeBicycle:
            controller = [[BicycleViewController alloc] init];
            break;
        case kPageViewTypeCloud:
            controller = [[CloudViewController alloc] init];
            break;
        case kPageViewTypeRobot:
            controller = [[RobotViewController alloc] init];
            break;
        case kPageViewTypeRail:
            controller = [[RailViewController alloc] init];
            break;
        case kPageViewTypeSunflower:
            controller = [[SunflowerViewController alloc] init];
            break;
        case kPageViewTypeGuoBao:
            controller = [[GuoBaoViewController alloc] init];
            break;
        case kPageViewTypeCoffee:
            controller = [[CoffeeViewController alloc] init];
            break;
    }
    
    return controller;
}



@end
