//
//  DetailViewController.m
//  XYYProjectTemplate
//
//  Created by xuyong on 2017/12/3.
//  Copyright © 2017年 xuyong. All rights reserved.
//

#import "DetailViewController.h"
#import "JsonPraiseModel.h"


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
    //网络层访问
    __weak typeof(self) weakSelf = self;
    [RequestServer requestGetMethod:9
                           sortType:1
                             lawTag:@""
                           pageTime:@""
                            pageNum:1
                           pageSize:perPageSize
                            success:^(NSDictionary *dic, NSString *tipInfo) {

//                                NSLog(@"当前数据是- %@",dic);

                                //丢进后台处理的东西
                                NSMutableArray *middleArray = [[NSMutableArray alloc] init];
                                for (int i = 0; i < 100; i++) {
                                    [middleArray addObject:[NSString stringWithFormat:@"arr - %d",i]];
                                }
                                weakSelf.dataArray = [middleArray mutableCopy];


                                //UI刷新放入主线程中
                                [weakSelf reloadXYYTableViewHideFooter:NO];

    } error:^(NSString *errorInfo) {
        //UI刷新放入主线程中
        [weakSelf reloadXYYTableViewHideFooter:NO];

    }];
    
    
    //模拟缓存数据
    [self cacaheDemo];
    
    
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

#pragma mark - 动态cell
//-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
//    return 1;//默认有3个
//}
//
//-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//    return self.dataArray.count;
//}
//
//#pragma mark - tableView Delegate 默认显示
//-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    return 64;
//}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleBlue;
        tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"tableView-detail -- %ld",indexPath.row];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}


#pragma mark - ******* 缓存Demo *********
-(void)cacaheDemo
{
    //自己创建json数据
    NSDictionary *dic = @{@"anyThing":@"汇总所有的"
                          ,@"created":@(1512395183)
                          ,@"list":@[@{@"nickName":@"张三"
                                       ,@"age":@(20)
                                       ,@"uId":@(108)
                                       }
                                     ,@{@"nickName":@"张三"
                                        ,@"age":@(20)
                                        ,@"uId":@(108)
                                        }
                                     ,@{@"nickName":@"张三"
                                        ,@"age":@(20)
                                        ,@"uId":@(108)
                                        
                                        }]
                          ,@"user":@{@"nickName":@"张三"
                                     ,@"age":@(20)
                                     ,@"uId":@(108)
                                     }
                          };
    NSString *jsonStr = [NSDictionary jsonStringWithdictionary:dic];
    JsonPraiseModel *model = [JsonPraiseModel yy_modelWithJSON:jsonStr];
    DLog(@"%@",model.createdStr);
    
    //模拟数据
    
    NSMutableArray *middleArray = [[NSMutableArray alloc] init];
    for (int i = 0; i < 100; i++) {
        [middleArray addObject:model];
    }
    
    
    NSLog(@"-----------异步--------------");
    NSString *key2 = @"key2";
    
    [TMCacheManager removeCacheForKey:key2];
    
    [TMCacheManager removeAllCache];

    BOOL isExitst2 = [TMCacheManager isCacheExistKey:key2];
    if (!isExitst2) {
//        [TMCacheManager saveAsynArrayCache:middleArray key:key2];
//        [TMCacheManager saveArrayCache:middleArray key:key2];
    }
    [TMCacheManager arrayAsynCacheForKey:key2 cacheArrayBlock:^(NSArray *array) {
        NSLog(@"TmCache异步 -object nums-%lu",(unsigned long)array.count);
    }];
    
    NSLog(@"-----------同步--------------");
    BOOL isExist = [TMCacheManager isCacheExistKey:@"key"];
    if (!isExist) {
//        [TMCacheManager saveArrayCache:middleArray key:@"key"];
    }
    
    NSArray *result = [TMCacheManager arrayCacheForKey:@"key"];
    NSLog(@"TmCache同步 -object nums - %lu",(unsigned long)result.count);
    
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
