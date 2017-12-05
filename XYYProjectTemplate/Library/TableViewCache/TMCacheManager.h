//
//  TMCacheManager.h
//  AskBrotherApp
//
//  Created by xuyong on 16/7/18.
//  Copyright © 2016年 李昀. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^CacheArrayBlock)(NSArray *array);
typedef void(^CacheDictionaryBlock)(NSDictionary *dic);

@interface TMCacheManager : NSObject

#pragma mark - 存储array dic
//+(void)saveCacheObj:(id)array name:(NSString *)name;
//
//+(id)cacheObjName:(NSString *)name;
//
//
//+(BOOL)cacheIsExistName:(NSString *)name;
//
//+(BOOL)removeAllCache;
//
//+(BOOL)removeCacheIdentifiter:(NSString *)identifiter;
//

/**
 同步缓存数组

 @param param 数组
 @param key   键值
 */
+(void)saveArrayCache:(NSArray *)array key:(NSString *)key;

/**
 同步读取数组

 @param key
 */
+(NSArray *)arrayCacheForKey:(NSString *)key;

/**
 异步缓存数组

 @param param 数组
 @param key   键值
 */
+(void)saveAsynArrayCache:(NSArray *)array key:(NSString *)key;

/**
 异步读取数组

 @param key key
 @param cacheArrayBlock cache
 */
+(void)arrayAsynCacheForKey:(NSString *)key cacheArrayBlock:(CacheArrayBlock)cacheArrayBlock;

/**
 同步缓存Dictionary
 
 @param param 数组
 @param key   键值
 */
+(void)saveDictionaryCache:(NSDictionary *)dic key:(NSString *)key;


/**
 同步读取Dictionary
 
 @param key key
 */
+(NSDictionary *)dictionaryForKey:(NSString *)key;

/**
 异步缓存Dictionary
 
 @param dic   dictionary
 @param key   键值
 */
+(void)saveAsynDictionaryCache:(NSDictionary *)dic key:(NSString *)key;
/**
 异步读取Dictionary
 
 @param key key
 @param cacheDicBlock block
 */
+(void)arrayAsynDictionaryForKey:(NSString *)key cacheDicBlock:(CacheDictionaryBlock)cacheDicBlock;

/**
 是否key已经缓存
 
 @param key key
 @return return value description
 */
+(BOOL)isCacheExistKey:(NSString *)key;

/**
 清除所有缓存
 */
+(void)removeAllCache;

/**
 清除指定key缓存
 
 @param key key
 */
+(void)removeCacheForKey:(NSString *)key;


@end
