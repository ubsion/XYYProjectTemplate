//
//  UILabel+XYYLabelKit.h
//  XYYUIKit
//
//  Created by xuyong on 16/12/2.
//  Copyright © 2016年 xuyong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (XYYLabelKit)

/**
 label 颜色 字号

 @param color 颜色
 @param size 字号
 */
+(UILabel *)labelTextColor:(UIColor *)color
             fontSize:(CGFloat)size;


/**
 label 颜色 行数 字号

 @param color 颜色
 @param numberLines 行数
 @param size 字号
 */
+(UILabel *)labelTextColor:(UIColor *)color
          numberLines:(NSInteger)numberLines
             fontSize:(CGFloat)size;


/**
 label 颜色 对齐方式 行数 大小 字号

 @param color 颜色
 @param textAlignment 对齐
 @param numberLines 行数
 @param size 大小
 @return 字号
 */
+(UILabel *)labelTextColor:(UIColor *)color
             textAlignment:(NSInteger)textAlignment
               numberLines:(NSInteger)numberLines
                  fontSize:(CGFloat)size;

@end
