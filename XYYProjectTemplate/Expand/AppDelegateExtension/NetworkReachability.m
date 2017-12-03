//
//  NetworkReachability.m
//  XYYProjectTemplate
//
//  Created by xuyong on 2017/12/3.
//  Copyright © 2017年 xuyong. All rights reserved.
//

#import "NetworkReachability.h"

@interface NetworkReachability()

@property (strong, nonatomic) Reachability *hostReach;//网络监听所用

@end

@implementation NetworkReachability

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

+ (instancetype)sharedNetworkReachability {
    static NetworkReachability *_sharedNetworkReachability = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedNetworkReachability = [[self alloc] init];
    });
    return _sharedNetworkReachability;
}

#pragma mark NetWorkMonitor
- (void)reachabilityChanged
{
    [AppDelegate shareInstance].isReachableStatus = 2;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reachabilityChanged:) name:kReachabilityChangedNotification object:nil];
    _hostReach = [Reachability reachabilityForInternetConnection];
    [_hostReach startNotifier];  //开始监听，会启动一个run loop
    [self addObserver:self forKeyPath:@"isReachable" options:NSKeyValueObservingOptionNew context:nil];
    NetworkStatus internetStatus = [_hostReach currentReachabilityStatus];
    switch (internetStatus) {
        case ReachableViaWiFi:
            [AppDelegate shareInstance].isReachableStatus = 2;
            break;
        case ReachableViaWWAN:
            [AppDelegate shareInstance].isReachableStatus = 1;
            break;
        case NotReachable:
            [AppDelegate shareInstance].isReachableStatus = 0;
        default:
            break;
    }
}

- (void)reachabilityChanged:(NSNotification *)note {
    Reachability *currReach = [note object];
    NSParameterAssert([currReach isKindOfClass:[Reachability class]]);
    //对连接改变做出响应处理动作
    NetworkStatus status = [currReach currentReachabilityStatus];
    if(status == NotReachable) {
        [AppDelegate shareInstance].isReachableStatus = 0;
    }else if(status == ReachableViaWiFi){
        [AppDelegate shareInstance].isReachableStatus = 2;
    }else if(status == ReachableViaWWAN) {
        [AppDelegate shareInstance].isReachableStatus = 1;
    }
    [[NSNotificationCenter defaultCenter] postNotificationName:kNetworkChangedNotification object:nil];
}

@end
