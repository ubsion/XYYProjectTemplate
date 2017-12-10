//
//  YYLabel+Tool.m
//  XYYProjectTemplate
//
//  Created by xuyong on 2017/12/10.
//  Copyright © 2017年 xuyong. All rights reserved.
//

#import "YYLabel+Tool.h"

@implementation YYLabel (Tool)

/**
 计算YYLabel高度算法

 @param ferredMaxLayoutWidth 最大横向宽度
 @param text 输入的文本
 @return YYLabel 高度
 */
-(CGFloat)layoutWithContainerSizeHeight:(CGFloat)ferredMaxLayoutWidth text:(NSString *)text
{
    YYTextLayout *layout = [YYTextLayout layoutWithContainerSize:CGSizeMake(ferredMaxLayoutWidth, MAXFLOAT) text:[self getAttr:text]];
    CGFloat height = layout.textBoundingSize.height;

    return height;
}

- (NSMutableAttributedString*)getAttr:(NSString*)attributedString{
    NSMutableAttributedString * resultAttr = [[NSMutableAttributedString alloc] initWithString:attributedString];
    //对齐方式 这里是 两边对齐
    resultAttr.yy_alignment = self.textAlignment;
    //设置行间距
    resultAttr.yy_lineSpacing = 0;
    //设置字体大小
    resultAttr.yy_font = [UIFont systemFontOfSize:self.font.pointSize];
    //设置lineBreakMode
    resultAttr.yy_lineBreakMode = self.lineBreakMode;
    //可以设置某段字体的大小
    //[resultAttr yy_setFont:[UIFont boldSystemFontOfSize:CONTENT_FONT_SIZE] range:NSMakeRange(0, 3)];
    //设置字间距
    //resultAttr.yy_kern = [NSNumber numberWithFloat:1.0];
    return resultAttr;
}
@end
