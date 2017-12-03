//
//  XYYTableViewController.m
//  XYYProjectTemplate
//
//  Created by xuyong on 2017/12/3.
//  Copyright © 2017年 xuyong. All rights reserved.
//

#import "XYYTableViewController.h"

@interface XYYTableViewController ()<UITableViewDataSource,UITableViewDelegate>



@end

@implementation XYYTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self tableViewLayoutViews];
}

-(void)reloadXYYTableView
{
    [self endRefreshingHeaderAndFooter];
    [self.tableview reloadData];
}

-(void)reloadXYYTableViewHideFooter:(BOOL)hide
{
    [self endRefreshingHeaderAndFooter];
    [self.tableview reloadData];
    if (self.tableview.mj_footer.isHidden != hide) {
        [self hideFooterRefresh:hide];
    }
}

#pragma mark - 上拉下拉加载更多数据
- (void)addHeader
{
    __weak typeof(self) weakSelf = self;
    self.tableview.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [weakSelf onHeaderWithRefreshing];
    }];
}

-(void)addFooter{
    __weak __typeof(self)weakSelf = self;
    // 设置回调（一旦进入刷新状态就会调用这个refreshingBlock）
    self.tableview.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [weakSelf onFooterWithRefreshing];
    }];
    [self hideFooterRefresh:YES];
}

-(void)endRefreshingHeaderAndFooter
{
    [self.tableview.mj_header endRefreshing];
    [self.tableview.mj_footer endRefreshing];
}

-(void)onHeaderWithRefreshing
{
    NSLog(@"onHeaderWithRefreshing - 执行");
    [self hideFooterRefresh:NO];
}

-(void)onFooterWithRefreshing
{
    NSLog(@"onFooterWithRefreshing - 执行");
}

-(void)hideHeaderRefresh:(BOOL)hide
{
    [self.tableview.mj_header setHidden:hide];
}

-(void)hideFooterRefresh:(BOOL)hide
{
    [self.tableview.mj_footer setHidden:hide];
}

#pragma mark - tableview-

-(void)tableViewLayoutViews{
    self.tableview = [[UITableView alloc] initWithFrame:CGRectMake(0,kTopHeight,SCREEN_WIDTH,SCREEN_HEIGHT - kTopHeight ) style:UITableViewStylePlain];
    self.tableview.dataSource = self;
    self.tableview.delegate = self;
    self.tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tableview];
    
    [self addHeader];
    [self addFooter];
    
    [self.tableview.mj_header beginRefreshing];
}

#pragma mark - 动态cell
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;//默认有3个
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

#pragma mark - tableView Delegate 默认显示
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 64;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleBlue;
        tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"tableView -- %ld",indexPath.row];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

-(NSMutableArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = [[NSMutableArray alloc] init];
    }
    return _dataArray;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
