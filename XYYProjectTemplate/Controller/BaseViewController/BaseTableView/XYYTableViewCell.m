//
//  XYYTableViewCell.m
//  XYYProjectTemplate
//
//  Created by xuyong on 2017/12/3.
//  Copyright © 2017年 xuyong. All rights reserved.
//

#import "XYYTableViewCell.h"

@implementation XYYTableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView atIndex:(NSIndexPath *)index {
    //缓存中取
    NSString *CellIdentifier = @"XYYTableViewCell";//[NSString stringWithFormat:@"MediaDetailCell%ld",(long)index.row];
    XYYTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[XYYTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.contentView.backgroundColor = [UIColor whiteColor];
    cell.backgroundColor = [UIColor whiteColor];
    return cell;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self buildUI];
    }
    return self;
}

-(void)buildUI{
}

-(void)setDetailContent{
}


@end
