//
//  UIView+YYViewLayout.h
//  XYYProjectTemplate
//
//  Created by xuyong on 2017/12/10.
//  Copyright © 2017年 xuyong. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YYLayoutModel;
@interface UIView (YYViewLayout)

/**
 YYLabel 布局
 
 @param text 文本
 @param maxLayouWidth 最大宽度
 @param textAlignment 对齐方式
 @param lineBreakMode 换行模式
 @param fontSize 字体大小
 @param textColor 字体颜色
 @return 布局
 */
+(YYLayoutModel *)layoutYYTextLabelLayout:(NSString *)text
                 preferredMaxLayoutWidth:(CGFloat)maxLayouWidth
                           textAlignment:(NSTextAlignment)textAlignment
                           lineBreakMode:(NSLineBreakMode)lineBreakMode
                                fontSize:(CGFloat)fontSize
                               textColor:(UIColor *)textColor;

@end
