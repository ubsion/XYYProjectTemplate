//
//  NSDictionary+Tools.h
//  SuiShouXianGou
//
//  Created by netting on 14-1-8.
//  Copyright (c) 2014年 netting. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Tools)
- (NSString*)URLParamsString;
- (NSDictionary *)ss_dictionaryByAddingEntriesFromDictionary:(NSDictionary *)dictionary;
- (NSDictionary *)ss_dictionaryByRemovingEntriesWithKeys:(NSSet *)keys;

/**
 Dic 转 Json
 
 @param dic
 @return
 */
+ (NSString *)jsonStringWithdictionary:(NSDictionary *)dic;

@end
