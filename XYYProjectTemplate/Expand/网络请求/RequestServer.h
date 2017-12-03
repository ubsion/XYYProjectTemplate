//
//  RequestServer.h
//  WatchAPP
//
//  Created by xuyong on 15/9/23.
//  Copyright (c) 2015年 xuyong. All rights reserved.
//


#import "NewHttpRequest.h"
#import "RequestData.h"


typedef void (^successBlock)(NSString *tipinfo);
typedef void (^errorBlock)(NSString *errorInfo);

typedef void (^successDicBlock)(NSDictionary *dic, NSString *tipInfo);
typedef void (^successArrBlock)(NSMutableArray *array, NSString *tipInfo);
typedef void (^successObjBlock)(NSObject *obj, NSString *tipInfo);

typedef void (^progressBlock)(CGFloat progress);

@interface RequestServer : NewHttpRequest<UIAlertViewDelegate>




@end
