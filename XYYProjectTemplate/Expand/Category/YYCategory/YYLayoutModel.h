//
//  YYLayoutModel.h
//  XYYProjectTemplate
//
//  Created by xuyong on 2017/12/10.
//  Copyright © 2017年 xuyong. All rights reserved.
//

#import "BaseModel.h"

@interface YYLayoutModel : BaseModel

/**
 文本布局
 */
@property (nonatomic,strong) YYTextLayout *textLayout;

/**
 文本布局高度
 */
@property (nonatomic,assign) CGFloat textLayoutHeight;

@end
