
//
//  UITextView+XYYTextView.h
//  AskBrotherApp
//
//  Created by xuyong on 16/12/15.
//  Copyright © 2016年 李昀. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextView (XYYTextViewKit)<UITextViewDelegate>

@property (nonatomic,assign) NSInteger limiteNumber;
@property (nonatomic,strong) NSString *placeholderText;

@property (nonatomic,strong) NSString *readayPlaceholderText;

/**
 TextView

 @param placeholderText 阴影
 @param fontSize 字体大小
 @param textColor 字体颜色
 @param placeholderColor 阴影颜色
 @return UITextView
 */
-(UITextView *)textViewPlaceholderText:(NSString *)placeholderText
                              fontSize:(CGFloat)fontSize
                             textColor:(UIColor *)textColor
                      placeholderColor:(UIColor *)placeholderColor;


/**
 @method 获取指定宽度width的字符串在UITextView上的高度
 @param textView 待计算的UITextView
 @param width 限制字符串显示区域的宽度
 @result float 返回的高度
 */
+ (float) heightForString:(UITextView *)textView andWidth:(float)width;


@end
