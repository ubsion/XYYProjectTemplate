//
//  TMCacheManager.m
//  AskBrotherApp
//
//  Created by xuyong on 16/7/18.
//  Copyright © 2016年 李昀. All rights reserved.
//

#import "TMCacheManager.h"
#import "TMCache.h"

@implementation TMCacheManager

/**
 同步缓存数组
 
 @param array 数组
 @param key   键值
 */
+(void)saveArrayCache:(NSArray *)array key:(NSString *)key
{
    [[TMCache sharedCache] setObject:array forKey:key];
}

/**
 同步读取数组
 
 @param key key
 */
+(NSArray *)arrayCacheForKey:(NSString *)key
{
    NSArray *returnArray = [[TMCache sharedCache] objectForKey:key];
    return returnArray;
}

/**
 异步缓存数组
 
 @param array 数组
 @param key   键值
 */
+(void)saveAsynArrayCache:(NSArray *)array key:(NSString *)key
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        //丢进后台处理的东西
        [[TMCache sharedCache] setObject:array forKey:key];
    });
}

/**
 异步读取数组
 
 @param key key
 @param cacheArrayBlock block
 */
+(void)arrayAsynCacheForKey:(NSString *)key cacheArrayBlock:(CacheArrayBlock)cacheArrayBlock
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        //丢进后台处理的东西
        NSArray *returnArray = [[TMCache sharedCache] objectForKey:key];

        dispatch_async(dispatch_get_main_queue(), ^{
            //UI刷新放入主线程中
            if (cacheArrayBlock) {
                cacheArrayBlock(returnArray);
            }
        });
    });
}

/**
 同步缓存Dictionary
 
 @param dic   dic
 @param key   键值
 */
+(void)saveDictionaryCache:(NSDictionary *)dic key:(NSString *)key
{
    [[TMCache sharedCache] setObject:dic forKey:key];
}

/**
 同步读取Dictionary
 
 @param key key
 */
+(NSDictionary *)dictionaryForKey:(NSString *)key
{
    NSDictionary *returnArray = [[TMCache sharedCache] objectForKey:key];
    return returnArray;
}

/**
 异步缓存Dictionary
 
 @param dic   dic
 @param key   键值
 */
+(void)saveAsynDictionaryCache:(NSDictionary *)dic key:(NSString *)key
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        //丢进后台处理的东西
        [[TMCache sharedCache] setObject:dic forKey:key];
    });
}

/**
 异步读取Dictionary
 
 @param key key
 @param cacheDicBlock block
 */
+(void)arrayAsynDictionaryForKey:(NSString *)key cacheDicBlock:(CacheDictionaryBlock)cacheDicBlock
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        //丢进后台处理的东西
        NSDictionary *returnDic = [[TMCache sharedCache] objectForKey:key];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            //UI刷新放入主线程中
            if (cacheDicBlock) {
                cacheDicBlock(returnDic);
            }
        });
    });
}

/**
 是否key已经缓存
 
 @param key key
 @return return value description
 */
+(BOOL)isCacheExistKey:(NSString *)key
{
    NSObject *obj = [[TMCache sharedCache] objectForKey:key];
    if (obj == nil) {
        //不存在
        return NO;
    }
    return YES;
}

/**
 清除所有缓存
 */
+(void)removeAllCache{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        //丢进后台处理的东西
        [[TMCache sharedCache] removeAllObjects];
    });
}

/**
 清除指定key缓存
 
 @param key key
 */
+(void)removeCacheForKey:(NSString *)key
{
    [[TMCache sharedCache] removeObjectForKey:key];
}

@end
