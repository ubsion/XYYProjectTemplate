//
//  AppDelegate.h
//  XYYProjectTemplate
//
//  Created by xuyong on 2017/12/3.
//  Copyright © 2017年 xuyong. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Reachability;
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

/****业务逻辑字段Begin******/
+ (AppDelegate*)shareInstance;

/**
 当前网络状态 0无网络 1移动 2wifi
 */
@property (assign, nonatomic) NSInteger isReachableStatus;

/**
 当前可用控制器
 */
@property (nonatomic,strong)  UIViewController *currentTopViewController;

/**
 把当前view添加到window上面
 
 @param view
 */
-(void)addToWindow:(UIView *)view;


/****业务逻辑字段End******/


@end

