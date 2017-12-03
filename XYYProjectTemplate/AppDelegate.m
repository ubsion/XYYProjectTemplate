//
//  AppDelegate.m
//  XYYProjectTemplate
//
//  Created by xuyong on 2017/12/3.
//  Copyright © 2017年 xuyong. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"

#import "NetworkReachability.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    MainViewController *mainVC = [[MainViewController alloc]init];
    
    UINavigationController *navControl = [[UINavigationController alloc]initWithRootViewController:mainVC];
    self.window.rootViewController = navControl;
    
    //启动配置
    [self applicationConfig];
    [self thirdPartyConfig];
    
    [self.window makeKeyAndVisible];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

/**
 *  AppDelegate的单例
 *
 */
+ (AppDelegate *)shareInstance
{
    return (AppDelegate *)([UIApplication sharedApplication].delegate);
}
/**
 系统配置
 */
-(void)applicationConfig
{
    //网络波动检测
    [[NetworkReachability sharedNetworkReachability] reachabilityChanged];
    
    
}

/**
 第三方平台配置
 */
-(void)thirdPartyConfig
{
    
}

/**
 可用控制器

 @return
 */
-(UIViewController *)currentTopViewController
{
    return [self topViewControllerWithRootViewController:[UIApplication sharedApplication].keyWindow.rootViewController];
}

- (UIViewController*)topViewControllerWithRootViewController:(UIViewController*)rootViewController {
    if ([rootViewController isKindOfClass:[UITabBarController class]]) {
        
        UITabBarController* tabBarController = (UITabBarController*)rootViewController;
        return [self topViewControllerWithRootViewController:tabBarController.selectedViewController];
    } else if ([rootViewController isKindOfClass:[UINavigationController class]]) {
        
        UINavigationController* navigationController = (UINavigationController*)rootViewController;
        return [self topViewControllerWithRootViewController:navigationController.visibleViewController];
    } else if (rootViewController.presentedViewController) {
        
        UIViewController* presentedViewController = rootViewController.presentedViewController;
        return [self topViewControllerWithRootViewController:presentedViewController];
    } else {
        
        return rootViewController;
    }
}

/**
 把当前view添加到window上面

 @param view
 */
-(void)addToWindow:(UIView *)view
{
    NSInteger count = [[UIApplication sharedApplication] windows].count;
    
    if ([[UIDevice currentDevice] systemVersion].floatValue >= 11) {
        [[UIApplication sharedApplication].windows.firstObject addSubview:view];
    }else
    {
        //IOS11下面
        [[UIApplication sharedApplication].windows[count-1] addSubview:view];
    }
}

@end
