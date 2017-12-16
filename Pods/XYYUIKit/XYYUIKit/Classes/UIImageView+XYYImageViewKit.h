//
//  UIImageView+XYYImageViewKit.h
//  XYYUIKit
//
//  Created by xuyong on 16/12/2.
//  Copyright © 2016年 xuyong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (XYYImageViewKit)

/**
 ImageView 加载图片

 @param imagename 图片
 @return 返回值
 */
+(UIImageView *)imageViewWithImageName:(NSString *)imagename;


/**
 ImageView 图片 圆角 边角宽度、颜色

 @param imagename 图片
 @param cornerRadius 圆角
 @param borderWidth 宽度
 @param borderColor 宽度颜色
 @return 返回值
 */
+(UIImageView *)imageViewWithImageName:(NSString *)imagename
                          cornerRadius:(CGFloat)cornerRadius
                           borderWidth:(CGFloat)borderWidth
                       borderColor:(UIColor *)borderColor;

@end
