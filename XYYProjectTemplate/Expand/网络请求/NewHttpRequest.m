//
//  WatchHttpRequest.m
//  WatchAPP
//
//  Created by 王志 on 15/9/24.
//  Copyright (c) 2015年 xuyong. All rights reserved.
//

#import "NewHttpRequest.h"
//#import "SSKeychain.h"
#import "RequestData.h"
#import "RequestServer.h"

#define DEFAULT_TIMEOUT 20.0   // 普通json请求超时时间30秒

@implementation NewHttpRequest

+ (AFHTTPSessionManager*)FileUploadOperationManager
{
    return nil;
}

+ (AFHTTPSessionManager*)HTTPRequestOperationManager
{
    AFHTTPSessionManager *session = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:SERVER_URL]];
    [session.requestSerializer setTimeoutInterval:DEFAULT_TIMEOUT];
    return session;
}

+ (void)cancelOperation
{
    AFHTTPSessionManager *session = [[self class] HTTPRequestOperationManager];
    
    DLog(@"%ld",session.operationQueue.operations.count);
    
    [session.operationQueue cancelAllOperations];
}

/**
 *  @author 王志, 15-05-26 13:05:26
 *
 *  @brief  网络基本请求
 *
 *  @param domainPath    完整的请求url
 *  @param requestMethod 请求方式
 *  @param parameters    参数
 *  @param finish        完成block
 *  @param failure       失败block
 */
+ (void)requestPath:(NSString *)domainPath
      requestMethod:(SZRequestMethod)requestMethod
         parameters:(NSDictionary *)parameters
             finish:(AFFinishBlock)finish
            failure:(AFFailureBlock)failure
{
    DLog(@"服务器接口---------------------------------\n%@\n",domainPath);
    DLog(@"传给服务器的参数-----------------------------\n%@\n",parameters);
    
    AFHTTPSessionManager *session = [self HTTPRequestOperationManager];
    session.requestSerializer = [AFJSONRequestSerializer serializer];
    
    if([domainPath containsString:@"viewers"])
        session.requestSerializer = [AFHTTPRequestSerializer serializer];
    
    session.requestSerializer.HTTPMethodsEncodingParametersInURI = [NSSet setWithObjects:@"GET",@"HEAD", nil];
    [session.requestSerializer setTimeoutInterval:DEFAULT_TIMEOUT];
    
    NSDictionary *headerFieldValueDictionary = @{@"api-version":[[[NSBundle mainBundle]infoDictionary]valueForKey:@"CFBundleShortVersionString"]};
    if (headerFieldValueDictionary != nil) {
        for (NSString *httpHeaderField in headerFieldValueDictionary.allKeys) {
            NSString *value = headerFieldValueDictionary[httpHeaderField];
            [session.requestSerializer setValue:value forHTTPHeaderField:httpHeaderField];
        }
    }
    

    NSString *account = [[NSUserDefaults standardUserDefaults] objectForKey:@"ACCOUNT"];
    NSString *password = [[NSUserDefaults standardUserDefaults] objectForKey:@"PASSWORD"];//[SSKeychain passwordForService:APPID account:account error:nil];

    
    if([RequestData getUserInfo] != nil)
    {
        if(password && password!=0)
            [session.requestSerializer setAuthorizationHeaderFieldWithUsername:account password:password];
        else
        {
            NSString *type = [[NSUserDefaults standardUserDefaults] objectForKey:@"LOGIN_TYPE"];
            [session.requestSerializer setAuthorizationHeaderFieldWithUsername:type password:account];
        }
    }

    
    if (requestMethod == SZRequestMethodGet) {
        [session GET:domainPath parameters:parameters progress:nil success:finish failure:failure];
    }else if (requestMethod == SZRequestMethodPost){
        [session POST:domainPath parameters:parameters progress:nil success:finish failure:failure];
    }else if (requestMethod == SZRequestMethodPUT){
        [session PUT:domainPath parameters:parameters success:finish failure:failure];
    }else if (requestMethod == SZRequestMethodPATCH){
        [session PATCH:domainPath parameters:parameters success:finish failure:failure];
    }else if (requestMethod == SZRequestMethodDELETE){
        [session DELETE:domainPath parameters:parameters success:finish failure:failure];
    }else if (requestMethod == SZRequestMethodHEAD){
        [session HEAD:domainPath parameters:parameters success:^(NSURLSessionDataTask *task) {
            if (finish) {
                finish(task, nil);
            }
        } failure:failure];
    }
}



@end

