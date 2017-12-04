//
//  NSDictionary+Tools.m
//  SuiShouXianGou
//
//  Created by netting on 14-1-8.
//  Copyright (c) 2014年 netting. All rights reserved.
//

#import "NSDictionary+Tools.h"

@implementation NSDictionary (Tools)

- (NSString*)URLParamsString
{
    NSMutableString *string = [NSMutableString stringWithString:@""];
    for (NSString* key in [self allKeys]) {
        if ([self objectForKey:key]) {
            NSString *temp = [NSString stringWithFormat:@"%@",[self objectForKey:key]];
            if (temp.length > 0)
            {
                [string appendFormat:@"%@=%@&",key,[[temp urldecode] urlencode]];
            }
        }
    }
    return string.length > 0 ? [string substringToIndex:[string length] - 1] : string;
}

- (NSDictionary *)ss_dictionaryByAddingEntriesFromDictionary:(NSDictionary *)dictionary {
    NSMutableDictionary *result = [self mutableCopy];
    [result addEntriesFromDictionary:dictionary];
    return result;
}

- (NSDictionary *)ss_dictionaryByRemovingEntriesWithKeys:(NSSet *)keys {
    NSMutableDictionary *result = [self mutableCopy];
    [result removeObjectsForKeys:keys.allObjects];
    return result;
}

/**
 Dic 转 Json
 
 @param dic
 @return
 */
+ (NSString *)jsonStringWithdictionary:(NSDictionary *)dic
{
    NSError *parseError = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&parseError];
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}




@end
