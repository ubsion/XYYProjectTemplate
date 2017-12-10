//
//  YYLabel+Tool.h
//  XYYProjectTemplate
//
//  Created by xuyong on 2017/12/10.
//  Copyright © 2017年 xuyong. All rights reserved.
//

#import <YYText/YYText.h>

@interface YYLabel (Tool)

/**
 计算YYLabel高度算法
 
 @param ferredMaxLayoutWidth 最大横向宽度
 @param text 输入的文本
 @return YYLabel 高度
 */
-(CGFloat)layoutWithContainerSizeHeight:(CGFloat)ferredMaxLayoutWidth text:(NSString *)text;

@end
