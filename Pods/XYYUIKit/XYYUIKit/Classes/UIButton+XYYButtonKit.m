//
//  UIButton+XYYButtonKit.m
//  XYYUIKit
//
//  Created by xuyong on 16/12/2.
//  Copyright © 2016年 xuyong. All rights reserved.
//

#import "UIButton+XYYButtonKit.h"

@implementation UIButton (XYYButtonKit)

+(UIButton *)buttonWithText:(NSString *)text textColor:(UIColor *)textColor textFontSize:(CGFloat)size action:(SEL)action target:(id)target
{
    UIButton *button = [[UIButton alloc] init];
    [button setTitle:text forState:UIControlStateNormal];
    [button setTitleColor:textColor forState:UIControlStateNormal];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    button.titleLabel.font = [UIFont systemFontOfSize:size];
    return button;
}

+(UIButton *)buttonWithImageName:(NSString *)imageName action:(SEL)action target:(id)target
{
    UIButton *button = [[UIButton alloc] init];
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return button;
}

@end
