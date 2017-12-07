//
//  UIDevice+verson.m
//  AskBrotherApp
//
//  Created by xuyong on 16/7/4.
//  Copyright © 2016年 xuyong. All rights reserved.
//

#import "UIDevice+verson.h"

@implementation UIDevice (verson)
+ (float)getIOSVersion
{
    return [[[UIDevice currentDevice] systemVersion] floatValue];
}

+(CGSize)getScreenScale
{
    CGRect rect_screen = [[UIScreen mainScreen]bounds];
    CGSize size_screen = rect_screen.size;
    CGFloat scale_screen = [UIScreen mainScreen].scale;
    CGFloat screenWidth = size_screen.width*scale_screen;
    CGFloat screenHeight = size_screen.height*scale_screen;
    return CGSizeMake(screenWidth, screenHeight);
}

@end
