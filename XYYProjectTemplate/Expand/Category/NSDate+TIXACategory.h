//
//  NSDate+TIXACategory.m
//  Lianxi
//
//  Created by Liusx on 12-7-16.
//  Copyright (c) 2012年 TIXA. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (TIXACategory)

//- (NSString *)timeIntervalDescription;//距离当前的时间间隔描述
//- (NSString *)minuteDescription;/*精确到分钟的日期描述*/
//- (NSString *)minuteDescriptionNew;/*精确到分钟的日期描述*/
//- (NSString *)minuteDescriptionNewBrief;/*简短 日期描述*/
- (NSString *)formattedDateDescription;//格式化日期描述
///*简化格式化日期描述*/
- (NSString *)formattedDateDescriptionSimply;
- (NSString *)calDateYesterdayOrBefore;
+(NSDate *)serverDate:(NSString *)serverString;//会话收到消息，时间转换为服务器的时间
-(NSString *)toServerString; //发送消息，时间转换为服务器的时间

- (NSString *)formattedWaterDateDescription;

- (NSString *)formattedShortDateDescription;//简短时间  HH:mm:ss
- (NSString *)formattedDateMonthDayDescription; //  MM/dd
//- (NSString *)formattedForNowDescription;//now日期描述
//- (NSString *)formattedServerStringToStandardDate;

///比较当前日期是否是两天前
- (BOOL)componentsDate2:(NSDate *)date2;

+ (BOOL)date:(NSDate*)date componentsDate2:(NSDate *)date2;

@end
