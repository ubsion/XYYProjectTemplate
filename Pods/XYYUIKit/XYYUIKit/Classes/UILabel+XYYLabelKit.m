//
//  UILabel+XYYLabelKit.m
//  XYYUIKit
//
//  Created by xuyong on 16/12/2.
//  Copyright © 2016年 xuyong. All rights reserved.
//

#import "UILabel+XYYLabelKit.h"

@implementation UILabel (XYYLabelKit)

+(UILabel *)labelTextColor:(UIColor *)color fontSize:(CGFloat)size
{
    UILabel *label = [[UILabel alloc] init];
    label.textColor = color;
    label.textAlignment = NSTextAlignmentLeft;
    label.font = [UIFont systemFontOfSize:size];
    return label;
}

+(UILabel *)labelTextColor:(UIColor *)color numberLines:(NSInteger)numberLines fontSize:(CGFloat)size
{
    UILabel *label = [[UILabel alloc] init];
    label.textColor = color;
    label.textAlignment = NSTextAlignmentLeft;
    label.font = [UIFont systemFontOfSize:size];
    label.numberOfLines = numberLines;
    return label;
}

+(UILabel *)labelTextColor:(UIColor *)color textAlignment:(NSInteger)textAlignment numberLines:(NSInteger)numberLines fontSize:(CGFloat)size
{
    UILabel *label = [[UILabel alloc] init];
    label.textColor = color;
    label.textAlignment = textAlignment;
    label.font = [UIFont systemFontOfSize:size];
    label.numberOfLines = numberLines;
    return label;
}

@end
