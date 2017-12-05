//
//  TableViewCacheHeight.h
//  NewsApp
//
//  Created by xuyong on 16/1/11.
//  Copyright © 2016年 李昀. All rights reserved.
//

/**
 *  @author xuyong, 16-01-11 17:01:11
 *
 *  @brief  缓存行高
 */
#import <Foundation/Foundation.h>

@interface TableViewCacheHeight : NSObject
+(void)cacheDataAtIndex:(NSInteger)index value:(CGFloat)height;
+(CGFloat)cacheLoadCacheDataAtIndex:(NSInteger)index;
+(BOOL)cacheIsExistAtIndex:(NSInteger)index;
+(BOOL)removeAllCache;
+(BOOL)removeCacheAtIndex:(NSInteger)index;

#pragma mark - 存储array dic
+(void)saveCacheObj:(id)array name:(NSString *)name;
+(id)cacheObjName:(NSString *)name;
+(BOOL)cacheIsExistName:(NSString *)name;
@end
