//
//  NetworkReachability.h
//  XYYProjectTemplate
//
//  Created by xuyong on 2017/12/3.
//  Copyright © 2017年 xuyong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetworkReachability : NSObject

+ (instancetype)sharedNetworkReachability;

- (void)reachabilityChanged;

@end
