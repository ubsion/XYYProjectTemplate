//
//  RequestServer.m
//  WatchAPP
//
//  Created by xuyong on 15/9/23.
//  Copyright (c) 2015年 xuyong. All rights reserved.
//

#import "RequestServer.h"
#import "JsonPraiseModel.h"


#define   DEFAULT_NO_CONNECT   @"服务器开小差了，请刷新重试"
#define   DEFAULE_NET_FAIL     @"网络异常，请检查网络后重试"

#pragma mark - 支付


@implementation RequestServer

+ (BOOL)checkInterfaceDataCode:(NSDictionary *)dic
{
    NSInteger code = [dic[@"code"] integerValue];
    if (code==1000) {
        return YES;
    }else {
        [Utility showTip:dic[@"description"]];
        return NO;
    }
}

+ (void)errorTip:(NSInteger)code
{
    if(code == -1001)
    {
        [Utility showTip:DEFAULE_NET_FAIL];
    }
    else if(code == 500)
    {
        [Utility showTip:DEFAULT_NO_CONNECT];
    }
}

#pragma mark - ******* 请求数据 *********
//Demo 获取数据
+(void)requestGetMethod:(NSInteger )uId
                  sortType:(int)sortType
                    lawTag:(NSString *)lawTag
                  pageTime:(NSString *)pagetime
                   pageNum:(int       )pagenum
                  pageSize:(int       )pagesize
                   success:(successDicBlock)success
                     error:(errorBlock)error
{
    NSDictionary *param = @{@"uId":@(uId),
                            @"pageTime":pagetime,
                            @"pageNum":@(pagenum),
                            @"pageSize":@(pagesize),
                            @"sortType":@(sortType),
                            @"lawTag":lawTag
                            };
    
    [[self class] requestPath:@"issue/list" requestMethod:SZRequestMethodGet parameters:param finish:^(NSURLSessionDataTask *task, id responseObject)
     {
         NSLog(@"code num = %d, desription : %@",[responseObject[@"header"][@"code"] intValue],responseObject[@"header"][@"description"]);
         //header:data data:data
         if ([RequestServer checkInterfaceDataCode:responseObject[@"header"]])
         {
             //解析数据
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
             
             
             success(responseObject,@"成功");
         }else
         {
             [Utility showTip:@""];
             error(@"");
         }
     } failure:^(NSURLSessionDataTask *task, NSError *err) {
         NSLog(@"%@",err);
         [self errorTip:err.code];
         error(@"");
     }];
}




@end
