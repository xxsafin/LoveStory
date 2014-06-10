//
//  AppDelegate.m
//  LoveStory
//
//  Created by Xu Xian on 14-2-27.
//  Copyright (c) 2014年 Xu Xian. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

#import "LoginViewController.h"

static AppDelegate *sharedAppDelegate;

@implementation AppDelegate
{
    LoginViewController *_popupLoginController;
}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    sharedAppDelegate = self;
    
    [[UIApplication sharedApplication] setStatusBarHidden:YES];
    
    self.window =[[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:[[ViewController alloc] init]];
    navController.navigationBarHidden = YES;
    self.window.rootViewController = navController;
    
    [self.window makeKeyAndVisible];
    
    [self openRegisterWindow];
    
    return YES;
}

-(void)openRegisterWindow
{
    
    if(_popupLoginController)
    {
        return;
    }
    
    _popupLoginController = [[LoginViewController alloc] init];
    
    [self.window.rootViewController.view addSubview:_popupLoginController.view];
    _popupLoginController.view.frame = CGRectMake(0,
                                             0,
                                             _popupLoginController.view.frame.size.width,
                                             _popupLoginController.view.frame.size.height);
    
    _popupLoginController.view.transform = CGAffineTransformIdentity;
}

-(void)removeRegisterWindow
{
    if(_popupLoginController)
    {
        [_popupLoginController.view removeFromSuperview];
        _popupLoginController = nil;
    }
}


+(AppDelegate *)sharedAppDelegate
{
    return sharedAppDelegate;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
