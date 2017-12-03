//
//  XYYTableViewController.h
//  XYYProjectTemplate
//
//  Created by xuyong on 2017/12/3.
//  Copyright © 2017年 xuyong. All rights reserved.
//

#import "ViewController.h"

@interface XYYTableViewController : ViewController

/**
 tableview
 */
@property (nonatomic,strong) UITableView    *tableview;

/**
 数据源
 */
@property (nonatomic,strong) NSMutableArray *dataArray;

-(void)reloadXYYTableView;

-(void)reloadXYYTableViewHideFooter:(BOOL)hide;

/**
 初始化tableview
 */
-(void)tableViewLayoutViews;
/**
 结束动画
 */
-(void)endRefreshingHeaderAndFooter;

/**
 隐藏header加载
 */
-(void)hideHeaderRefresh:(BOOL)hide;

/**
 隐藏footer加载
 */
-(void)hideFooterRefresh:(BOOL)hide;

#pragma mark - 子类重写
/**
 上拉动画结束网络访问,子类重写相应的业务
 */
-(void)onHeaderWithRefreshing;

/**
 下拉动画结束网络访问,子类重写相应的业务
 */
-(void)onFooterWithRefreshing;

@end
