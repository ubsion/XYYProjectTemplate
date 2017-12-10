//
//  UIView+YYViewLayout.m
//  XYYProjectTemplate
//
//  Created by xuyong on 2017/12/10.
//  Copyright © 2017年 xuyong. All rights reserved.
//

#import "UIView+YYViewLayout.h"

@implementation UIView (YYViewLayout)

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
                               textColor:(UIColor *)textColor
{
    NSMutableAttributedString * textAttr = [[NSMutableAttributedString alloc] initWithString:text];
    //对齐方式 这里是 两边对齐
    textAttr.yy_alignment = textAlignment;
    //设置字体大小
    textAttr.yy_font = [UIFont systemFontOfSize:fontSize];
    //设置lineBreakMode
    textAttr.yy_lineBreakMode = lineBreakMode;
    //设置字体颜色
    textAttr.yy_color = textColor;
    
    YYTextContainer *container = [YYTextContainer new];
    container.size = CGSizeMake(maxLayouWidth, HUGE);
    YYTextLayout *textLayout = [YYTextLayout layoutWithContainer:container text:textAttr];
    
    YYLayoutModel *model = [YYLayoutModel new];
    model.textLayout = textLayout;
    model.textLayoutHeight = textLayout.textBoundingSize.height;
    
    return model;
}

@end
