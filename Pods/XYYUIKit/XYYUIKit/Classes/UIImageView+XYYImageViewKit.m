//
//  UIImageView+XYYImageViewKit.m
//  XYYUIKit
//
//  Created by xuyong on 16/12/2.
//  Copyright © 2016年 xuyong. All rights reserved.
//

#import "UIImageView+XYYImageViewKit.h"

@implementation UIImageView (XYYImageViewKit)

+(UIImageView *)imageViewWithImageName:(NSString *)imagename
{
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.userInteractionEnabled = true;
    imageView.image = [UIImage imageNamed:imagename];
    return imageView;
}

+(UIImageView *)imageViewWithImageName:(NSString *)imagename cornerRadius:(CGFloat)cornerRadius borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor
{
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.userInteractionEnabled = true;
    imageView.layer.masksToBounds = YES;
    imageView.image = [UIImage imageNamed:imagename];
    imageView.layer.cornerRadius = cornerRadius;
    if (borderWidth > 0) {
        imageView.layer.borderWidth = borderWidth;
    }
    if (borderColor != nil) {
        imageView.layer.borderColor = borderColor.CGColor;
    }
    return imageView;
}

@end
