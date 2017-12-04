//
//  NSString+Tools.h
//  SuiShouXianGou
//
//  Created by netting on 14-1-2.
//  Copyright (c) 2014年 netting. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Tools)

- (CGSize)textSizeWithUIFont:(UIFont*)font;
- (CGSize)textSizeWithUIFont:(UIFont*)font maxSize:(CGSize)maxSize;

- (NSString *)urlencode;
- (NSString *)urldecode;
- (NSString*)addURLParams:(NSDictionary *)params;
- (NSDictionary *)URLParams;
- (NSMutableDictionary *)stringParams;
-(NSURL*)urlJumpHandle;
+ (NSString *)stringWithStringWhenEmpty:(NSString*)string;
+ (NSString *)stringWithStringWhenEmpty:(NSString*)string defaultString:(NSString*)defualtString;

///添加律师后缀
-(NSString *)lawyerSuffix;

///钱变换到分
-(NSString *)moneyChangeToFen;
///钱转换到元
-(NSString *)moneyChangeToYUAN;

/**
 json转 Dic
 
 @param jsonString
 @return
 */
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;

/**
 @method 获取指定宽度width的字符串在UITextView上的高度
 @param 
 @param Width 限制字符串显示区域的宽度
 @result float 返回的高度
 */
+ (float) heightForString:(NSString *)text andWidth:(float)width;


/**
 最多保留两位有效小数

 @param f 
 @return 
 */
+ (NSString *)formatFloat:(float)f;

@end
