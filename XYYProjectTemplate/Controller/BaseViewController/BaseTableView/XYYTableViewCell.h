//
//  XYYTableViewCell.h
//  XYYProjectTemplate
//
//  Created by xuyong on 2017/12/3.
//  Copyright © 2017年 xuyong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XYYTableViewCell : UITableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView atIndex:(NSIndexPath *)index;

/**
 构建UI,子类重写
 */
-(void)buildUI;

/**
 设置DetailContent，子类重写
 */
-(void)setDetailContent;

@end
