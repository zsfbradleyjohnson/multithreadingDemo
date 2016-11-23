//
//  AppDelegate.m
//  multithreadingDemo
//
//  Created by bradleyjohnson on 2016/11/22.
//  Copyright © 2016年 bradleyjohnson. All rights reserved.
//

#import "AppDelegate.h"
#import "NSThreadViewController.h"
#import "NSOperationViewController.h"
#import "GCDViewController.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    UINavigationController * nav1 = [[UINavigationController alloc] initWithRootViewController:[NSThreadViewController new]];
    UITabBarItem * item1 = [UITabBarItem new];
    item1.title = @"NSThread";
    nav1.tabBarItem = item1;
    
    UINavigationController * nav2 = [[UINavigationController alloc] initWithRootViewController:[NSOperationViewController new]];
    UITabBarItem * item2 = [UITabBarItem new];
    item2.title = @"NSOperation";
    nav2.tabBarItem = item2;
    
    UINavigationController * nav3 = [[UINavigationController alloc] initWithRootViewController:[GCDViewController new]];
    UITabBarItem * item3 = [UITabBarItem new];
    item3.title = @"GCD";
    nav3.tabBarItem = item3;
    
    UITabBarController * tbV = [[UITabBarController alloc] init];
    tbV.viewControllers = @[nav1,nav2,nav3];
    
    self.window.rootViewController = tbV;
    
    return YES;
}



@end
