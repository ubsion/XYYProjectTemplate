//
//  ViewController.h
//  AskBrotherApp
//
//  Created by xuyong on 16/6/15.
//  Copyright © 2016年 xuyong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SS_NavBarView.h"

@interface ViewController : UIViewController
@property (nonatomic, strong) UIImageView *defaultView;

@property (nonatomic, assign) BOOL isKeyboard;
//导航栏
@property (nonatomic, strong) SS_NavBarView *navBarView;

/**
 重写自定义导航条
 */
-(void)setNavBarViewBar;

/**
 重写导航条对应方法

 @param navView
 */
-(void)leftBtnClickByNavBarView:(SS_NavBarView *)navView;

-(void)rightBtnClickByNavBarView:(SS_NavBarView *)navView;

/**
 *
 *  @param top 所需要展示缺省页面的模块的顶点
 */
-(void)showDefultView:(CGFloat)top;
-(void)hiddenDefultView;

-(void)checkData:(NSArray *)array top:(CGFloat)top view:(UIView *)view;
-(void)checkData:(NSArray *)array top:(CGFloat)top view:(UIView *)view text:(NSString *)text;
-(void)checkData:(NSArray *)array top:(CGFloat)top view:(UIView *)view text:(NSString *)text button:(NSString *)buttonTitle;
-(void)hiddenView;

-(void)checkData1:(NSArray *)array top:(CGFloat)top view:(UIView *)view text:(NSString *)text;
-(void)checkData1:(NSArray *)array top:(CGFloat)top view:(UIView *)view text:(NSString *)text button:(NSString *)buttonTitle;
-(void)checkData:(NSArray *)array top:(CGFloat)top view:(UIView *)view text:(NSString *)text button:(NSString *)buttonTitle imageName:(NSString *)imageName;
-(void)checkWebData:(BOOL)isFailed top:(CGFloat)top view:(UIView *)view text:(NSString *)text button:(NSString *)buttonTitle imageName:(NSString *)imageName;

- (BOOL)shouldAutorotate;

- (void)addActionTarget:(UIAlertController *)alertController title:(NSString *)title action:(void(^)(UIAlertAction *action))actionTarget;
-(void)addCancelActionTarget:(UIAlertController*)alertController title:(NSString *)title;

-(void)addCancelActionTarget:(UIAlertController*)alertController title:(NSString *)title action:(void(^)(UIAlertAction *action))actionTarget;

-(void)addSubviews;

@end

