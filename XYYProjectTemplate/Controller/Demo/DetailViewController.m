//
//  DetailViewController.m
//  XYYProjectTemplate
//
//  Created by xuyong on 2017/12/3.
//  Copyright © 2017年 xuyong. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

-(void)onHeaderWithRefreshing
{
    __weak typeof(self) weakSelf = self;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        //丢进后台处理的东西
        NSMutableArray *middleArray = [[NSMutableArray alloc] init];
        for (int i = 0; i < 100; i++) {
            [middleArray addObject:[NSString stringWithFormat:@"arr - %d",i]];
        }
        weakSelf.dataArray = [middleArray mutableCopy];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            //UI刷新放入主线程中
            [weakSelf reloadXYYTableViewHideFooter:NO];
        });
    });
}

-(void)onFooterWithRefreshing
{
    __weak typeof(self) weakSelf = self;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        //丢进后台处理的东西
        NSMutableArray *middleArray = [[NSMutableArray alloc] init];
        for (int i = 0; i < 100; i++) {
            [middleArray addObject:[NSString stringWithFormat:@"arr - %d",i]];
        }
        [weakSelf.dataArray addObjectsFromArray:middleArray];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            //UI刷新放入主线程中
            [weakSelf reloadXYYTableView];
        });
    });
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
