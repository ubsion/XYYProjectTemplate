//
//  MainViewController.m
//  XYYProjectTemplate
//
//  Created by xuyong on 2017/12/3.
//  Copyright © 2017年 xuyong. All rights reserved.
//

#import "MainViewController.h"
#import "DetailViewController.h"
#import "CustomLayoutDemo.h"

@interface MainViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableview;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"title --- header";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self tableViewLayoutViews];
}

-(void)setNavBarViewBar
{
    [self.navBarView setLeftWithTitle:@"home_app_logo" type:0];
    [self.navBarView setMiddleWithWithTitle:@"首页" type:1];
    //    [self.navBarView setRightWithTitle:@"home_lanch_video" type:0];
}

-(void)leftBtnClickByNavBarView:(SS_NavBarView *)navView
{
    
}

-(void)tableViewLayoutViews{
    self.tableview = [[UITableView alloc] initWithFrame:CGRectMake(0,kTopHeight,SCREEN_WIDTH,SCREEN_HEIGHT - kTopHeight ) style:UITableViewStylePlain];
    self.tableview.dataSource = self;
    self.tableview.delegate = self;
    self.tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tableview];
}

#pragma mark - 动态cell
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;//默认有3个
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

#pragma mark - tableView Delegate 默认显示
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return kTopHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleBlue;
        tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"tableview ---- %ld",indexPath.row];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        CustomLayoutDemo *layoutDemo = [CustomLayoutDemo new];
        [self.navigationController pushViewController:layoutDemo animated:YES];
    }else{
        DetailViewController *detail = [[DetailViewController alloc] init];
        detail.title = [NSString stringWithFormat:@"title is num_%ld",(long)indexPath.row];
        [self.navigationController pushViewController:detail animated:YES];
    }
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
