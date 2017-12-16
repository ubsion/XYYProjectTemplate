//
//  UIButton+XYYButtonKit.h
//  XYYUIKit
//
//  Created by xuyong on 16/12/2.
//  Copyright © 2016年 xuyong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (XYYButtonKit)

/**
 按钮 带有文字描述

 @param text 文字
 @param textColor 颜色
 @param size 字号
 @return 返回值
 */
+(UIButton *)buttonWithText:(NSString *)text
                  textColor:(UIColor *)textColor
               textFontSize:(CGFloat)size action:(SEL)action target:(id)target;

/**
 按钮 带有图片的

 @param imageName 图片
 @return 返回值
 */
+(UIButton *)buttonWithImageName:(NSString *)imageName action:(SEL)action target:(id)target;




@end
