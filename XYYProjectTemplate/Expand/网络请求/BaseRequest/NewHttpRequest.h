//
//  WatchHttpRequest.h
//  WatchAPP
//
//  Created by 王志 on 15/9/24.
//  Copyright (c) 2015年 xuyong. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    SZRequestMethodGet     = 0,    // GET
    SZRequestMethodPost    = 1,    // POST
    SZRequestMethodPUT     = 2,    // PUT
    SZRequestMethodPATCH   = 3,    // PATCH
    SZRequestMethodDELETE  = 4,    // DELETE
    SZRequestMethodHEAD    = 5,    // HEAD
    SZRequestMethodOther   = 6
} SZRequestMethod;

typedef void (^AFFinishBlock)(NSURLSessionDataTask *task, id responseObject);

typedef void (^AFFailureBlock)(NSURLSessionDataTask *task, NSError *error);

@interface NewHttpRequest : NSObject

+ (void)cancelOperation;

+ (void)requestPath:(NSString *)domainPath
      requestMethod:(SZRequestMethod)requestMethod
         parameters:(NSDictionary *)parameters
             finish:(AFFinishBlock)finish
            failure:(AFFailureBlock)failure;

@end
