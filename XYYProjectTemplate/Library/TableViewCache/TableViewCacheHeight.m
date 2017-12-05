//
//  TableViewCacheHeight.m
//  NewsApp
//
//  Created by xuyong on 16/1/11.
//  Copyright © 2016年 李昀. All rights reserved.
//

#import "TableViewCacheHeight.h"
#import "TMCache.h"

static NSString *const filename = @"tableviewHeight/good";

@implementation TableViewCacheHeight
/**
 NSString *cellName = [NSString stringWithFormat:@"cacahe_%ld",(long)indexPath.row];
 //    NSString *flage =
 NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
 if ([userDefaults floatForKey:cellName] == 0) {

 }
 */
#pragma mark - 内存缓存
+(void)cacheDataAtIndex:(NSInteger)index value:(CGFloat)height{
    //保存成功
    [[TMCache sharedCache] setObject:[NSNumber numberWithFloat:height] forKey:[NSString stringWithFormat:@"%@_%ld",filename,(long)index]];
}

+(CGFloat)cacheLoadCacheDataAtIndex:(NSInteger)index{
    NSNumber *heiObj = [[TMCache sharedCache] objectForKey:[NSString stringWithFormat:@"%@_%ld",filename,(long)index]];
    return heiObj.floatValue;
}

+(BOOL)removeAllCache{
    [[self alloc] performSelectorOnMainThread:@selector(removeAllCache) withObject:nil waitUntilDone:YES];
    NSLog(@"TMCache 缓存清楚");
    return YES;
}

-(void)removeAllCache{
    [[TMCache sharedCache]removeAllObjects];
}

+(BOOL)removeCacheAtIndex:(NSInteger)index{
    NSLog(@"%ld被删掉了",(long)index);
    [[TMCache sharedCache] removeObjectForKey:[NSString stringWithFormat:@"%@_%ld",filename,(long)index]];
    return YES;
}

+(BOOL)cacheIsExistAtIndex:(NSInteger)index{
    NSNumber *isExist = [[TMCache sharedCache] objectForKey:[NSString stringWithFormat:@"%@_%ld",filename,(long)index]];
    if (isExist == nil) {
        //不存在
        return NO;
    }
    return YES;
}

#pragma mark - 存储array dic
+(void)saveCacheObj:(id)array name:(NSString *)name{
    [[TMCache sharedCache] setObject:array forKey:name];
}

+(id)cacheObjName:(NSString *)name{
    NSArray *heiObj = [[TMCache sharedCache] objectForKey:name];
    return heiObj;
}

+(BOOL)cacheIsExistName:(NSString *)name{
    NSNumber *isExist = [[TMCache sharedCache] objectForKey:name];
    if (isExist == nil) {
        //不存在
        return NO;
    }
    return YES;
}

@end
