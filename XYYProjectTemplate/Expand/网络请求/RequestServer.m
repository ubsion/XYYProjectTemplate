//
//  RequestServer.m
//  WatchAPP
//
//  Created by xuyong on 15/9/23.
//  Copyright (c) 2015年 xuyong. All rights reserved.
//

#import "RequestServer.h"


#define   DEFAULT_NO_CONNECT   @"服务器开小差了，请刷新重试"
#define   DEFAULE_NET_FAIL     @"网络异常，请检查网络后重试"

#pragma mark - 支付


@implementation RequestServer

+ (BOOL)checkInterfaceDataCode:(NSDictionary *)dic
{
    NSLog(@"response-->%@",dic);
    NSInteger code = [dic[@"code"] integerValue];
    if (code==1000) {
        return YES;
    }else {
        //        [RequestServer showAlert:dic[@"description"]];
        return NO;
    }
}






@end
