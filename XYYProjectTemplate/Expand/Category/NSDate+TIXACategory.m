//formattedDateDescription 老版问题
//NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
//[dateFormatter setDateFormat:@"yyyy-MM-dd"];
//NSString *theDay = [dateFormatter stringFromDate:self];//日期的年月日
//NSString *currentDay = [dateFormatter stringFromDate:[NSDate date]];//当前年月日
//NSInteger timeInterval = -[self timeIntervalSinceNow];
//if (timeInterval < 60) {
//    return @"1分钟内";
//} else if (timeInterval < 3600) {//1小时内
//    return [NSString stringWithFormat:@"%ld分钟前", (long)timeInterval / 60];
//} else if (timeInterval < 21600) {//6小时内
//    return [NSString stringWithFormat:@"%ld小时前", (long)timeInterval / 3600];
//} else if ([theDay isEqualToString:currentDay]) {//当天
//    [dateFormatter setDateFormat:@"HH:mm"];
//    return [NSString stringWithFormat:@"今天 %@", [dateFormatter stringFromDate:self]];
//} else if ([[dateFormatter dateFromString:currentDay] timeIntervalSinceDate:[dateFormatter dateFromString:theDay]] == 86400) {//昨天
//    [dateFormatter setDateFormat:@"HH:mm"];
//    return [NSString stringWithFormat:@"昨天 %@", [dateFormatter stringFromDate:self]];
//} else {//以前
//    [dateFormatter setDateFormat:@"MM-dd HH:mm"];
//    return [dateFormatter stringFromDate:self];
//}



#import "NSDate+TIXACategory.h"
//#import "NSDateFormatter+TIXACategory.h"

@implementation NSDate (TIXACategory)

/*格式化日期描述*/
- (NSString *)formattedDateDescription
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *theDay = [dateFormatter stringFromDate:self];//日期的年月日
    NSString *currentDay = [dateFormatter stringFromDate:[NSDate date]];//当前年月日
    NSInteger timeInterval = -[self timeIntervalSinceNow];
    if (timeInterval < 60) {
//        return @"1分钟前";
        return @"刚刚";
    } else if (timeInterval < 3600) {//1小时内
        return [NSString stringWithFormat:@"%ld分钟前", (long)timeInterval / 60];
    } else if ([theDay isEqualToString:currentDay]) {//当天
        return [NSString stringWithFormat:@"%ld小时前", (long)timeInterval / 3600];
        
        //		[dateFormatter setDateFormat:@"HH:mm"];
        //        return [NSString stringWithFormat:@"今天 %@", [dateFormatter stringFromDate:self]];
    } else if ([[dateFormatter dateFromString:currentDay] timeIntervalSinceDate:[dateFormatter dateFromString:theDay]] == 86400) {//昨天
        [dateFormatter setDateFormat:@"HH:mm"];
        return [NSString stringWithFormat:@"昨天 %@", [dateFormatter stringFromDate:self]];
    } else {//以前
        [dateFormatter setDateFormat:@"MM/dd"];//[dateFormatter setDateFormat:@"MM/dd HH:mm"];
        return [dateFormatter stringFromDate:self];
    }
}
///*简化格式化日期描述*/
- (NSString *)formattedDateDescriptionSimply
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *theDay = [dateFormatter stringFromDate:self];//日期的年月日
    NSString *currentDay = [dateFormatter stringFromDate:[NSDate date]];//当前年月日
    NSInteger timeInterval = -[self timeIntervalSinceNow];
    if (timeInterval < 60) {
//        return @"1分钟前";
        return @"刚刚";
    } else if (timeInterval < 3600) {//1小时内
        return [NSString stringWithFormat:@"%ld分钟前", (long)timeInterval / 60];
    } else if ([theDay isEqualToString:currentDay]) {//当天
        return [NSString stringWithFormat:@"%ld小时前", (long)timeInterval / 3600];
        
        //		[dateFormatter setDateFormat:@"HH:mm"];
        //        return [NSString stringWithFormat:@"今天 %@", [dateFormatter stringFromDate:self]];
    } else if ([[dateFormatter dateFromString:currentDay] timeIntervalSinceDate:[dateFormatter dateFromString:theDay]] == 86400) {//昨天
        [dateFormatter setDateFormat:@"HH:mm"];
        return [NSString stringWithFormat:@"昨天 %@", [dateFormatter stringFromDate:self]];
    } else {//以前
        [dateFormatter setDateFormat:@"MM/dd"];//[dateFormatter setDateFormat:@"MM/dd HH:mm"];
        return [dateFormatter stringFromDate:self];
    }
//    if (timeInterval < 60) {
//        return @"1分钟内";
//    } else if (timeInterval < 3600) {//1小时内
//        return [NSString stringWithFormat:@"%ld分钟前", (long)timeInterval / 60];
//    } else if (timeInterval < 21600) {//6小时内
//        return [NSString stringWithFormat:@"%ld小时前", (long)timeInterval / 3600];
//    } else if ([theDay isEqualToString:currentDay]) {//当天
//        [dateFormatter setDateFormat:@"HH:mm"];
//        return [NSString stringWithFormat:@"%@", [dateFormatter stringFromDate:self]];
//    }
////    else if ([[dateFormatter dateFromString:currentDay] timeIntervalSinceDate:[dateFormatter dateFromString:theDay]] == 86400) {//昨天
////        [dateFormatter setDateFormat:@"HH:mm"];
////        return [NSString stringWithFormat:@"昨天 %@", [dateFormatter stringFromDate:self]];
////    }
//    else {//以前
//        [dateFormatter setDateFormat:@"yyyy/MM/dd"];
//        return [dateFormatter stringFromDate:self];
//    }
}
- (NSString *)calDateYesterdayOrBefore
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *theDay = [dateFormatter stringFromDate:self];//日期的年月日
    NSString *currentDay = [dateFormatter stringFromDate:[NSDate date]];//当前年月日
    //NSInteger timeInterval = -[self timeIntervalSinceNow];
    if ([theDay isEqualToString:currentDay])
    {//当天
        [dateFormatter setDateFormat:@"HH:mm"];
        //return @"今天";
        return [NSString stringWithFormat:@"今天 %@", [dateFormatter stringFromDate:self]];
    }
    else if ([[dateFormatter dateFromString:currentDay] timeIntervalSinceDate:[dateFormatter dateFromString:theDay]] == 86400)
    {//昨天
        [dateFormatter setDateFormat:@"HH:mm"];
        return [NSString stringWithFormat:@"昨天 %@", [dateFormatter stringFromDate:self]];
    }
    else
    {//以前
        [dateFormatter setDateFormat:@"MM/dd HH:mm"];
        return [dateFormatter stringFromDate:self];
    }
}

+ (NSDate *)serverDate:(NSString *)serverString {
    NSTimeZone *timeZone = [NSTimeZone timeZoneForSecondsFromGMT:28800];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setTimeZone:timeZone];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate * date = [dateFormatter dateFromString:serverString];
    return date;
}

- (NSString *)toServerString {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    NSTimeZone *timeZone = [NSTimeZone timeZoneForSecondsFromGMT:28800];
    [dateFormatter setTimeZone:timeZone];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString * dateStr = [dateFormatter stringFromDate:self];
    return dateStr;
}

/*格式化日期描述*/
- (NSString *)formattedWaterDateDescription
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *theDay = [dateFormatter stringFromDate:self];//日期的年月日
    NSString *currentDay = [dateFormatter stringFromDate:[NSDate date]];//当前年月日
    NSInteger timeInterval = -[self timeIntervalSinceNow];
    if (timeInterval < 60) {
        return @"1分钟内";
    } else if (timeInterval < 3600) {//1小时内
        return [NSString stringWithFormat:@"%ld分钟前", (long)timeInterval / 60];
    } else if (timeInterval < 21600) {//6小时内
        return [NSString stringWithFormat:@"%ld小时前", (long)timeInterval / 3600];
    } else if ([theDay isEqualToString:currentDay]) {//当天
        [dateFormatter setDateFormat:@"HH:mm"];
        return [NSString stringWithFormat:@"今天 %@", [dateFormatter stringFromDate:self]];
    } else if ([[dateFormatter dateFromString:currentDay] timeIntervalSinceDate:[dateFormatter dateFromString:theDay]] == 86400) {//昨天
        [dateFormatter setDateFormat:@"HH:mm"];
        return [NSString stringWithFormat:@"昨天 %@", [dateFormatter stringFromDate:self]];
    } else {//以前
        [dateFormatter setDateFormat:@"MM-dd"];
        return [dateFormatter stringFromDate:self];
    }
}
//简短时间  HH:mm:ss
- (NSString *)formattedShortDateDescription
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"HH:mm:ss"];
    return [formatter stringFromDate:self];
}
- (NSString *)formattedDateMonthDayDescription
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"MM/dd"];
    return [formatter stringFromDate:self];
}

///比较当前日期是否是两天前
+ (BOOL)date:(NSDate*)date componentsDate2:(NSDate *)date2 {
    
    NSString *dateFormatDefine = @"yyyy-MM-dd HH:mm:ss";
    
    NSDateFormatter *fmt = [[NSDateFormatter alloc]init];
    //  如果是真机调试，转换这种欧美时间，需要设置locale
    fmt.locale = [[NSLocale alloc]initWithLocaleIdentifier:@"UTC"];
    fmt.dateFormat =dateFormatDefine;
    //   当前时间
    //    NSDate *now = [NSDate date];
    //日历对象（方便比较两个日期之间的差距）
    NSCalendar *calendar = [NSCalendar currentCalendar];
    // NSCalendarUnit 枚举代表想获得哪些差值
    NSCalendarUnit unit = NSCalendarUnitYear |NSCalendarUnitWeekOfMonth |NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute |NSCalendarUnitSecond;
    //计算两个日期之间的差值
    NSDateComponents *cmps = [calendar components:unit fromDate:date toDate:date2 options:0];
    //第一个时间的年月日时分秒
    NSDateComponents *createDateCmps = [calendar components:unit fromDate:date];
    //第二个时间的年月日时分秒
    NSDateComponents *nowCmps = [calendar components:unit fromDate:date2];
    // 日期的比较
    if (createDateCmps.year == nowCmps.year) { // 今年
        if (cmps.day >= 2) {//前天
            //            fmt.dateFormat =@"昨天 HH:mm";
            //            return [fmt stringFromDate:date2];
            return YES;
        }
        
        
        //        else if (cmps.day ==0){//今天
        //            if (cmps.hour >1) { //大于1小时前
        //                return [NSString stringWithFormat:@"%ld小时前", cmps.hour];
        //            } else if (cmps.minute >=1) {
        //                return [NSString stringWithFormat:@"%ld分钟前", cmps.minute];
        //            } else {
        //                return [NSString stringWithFormat:@"%ld秒钟前", cmps.second] ;
        //            }
        //        } else { //今年的其他日子不带年份的日期
        //            fmt.dateFormat =@"MM-dd HH:mm";// dateFormatDefine //@"MM-dd HH:mm"
        //            return [fmt stringFromDate:date];
        //        }
    }
    //    else { //非今年带年份的具体日期
    //        fmt.dateFormat =dateFormatDefine;
    //        return [fmt stringFromDate:date];
    //    }
    
    return NO;
}

///比较当前日期时间
+ (NSString *)date:(NSDate*)date date2:(NSDate *)date2 {
    
    NSString *dateFormatDefine = @"yyyy-MM-dd HH:mm:ss";
    
    NSDateFormatter *fmt = [[NSDateFormatter alloc]init];
    //  如果是真机调试，转换这种欧美时间，需要设置locale
    fmt.locale = [[NSLocale alloc]initWithLocaleIdentifier:@"UTC"];
    fmt.dateFormat =dateFormatDefine;
    //   当前时间
    //    NSDate *now = [NSDate date];
    //日历对象（方便比较两个日期之间的差距）
    NSCalendar *calendar = [NSCalendar currentCalendar];
    // NSCalendarUnit 枚举代表想获得哪些差值
    NSCalendarUnit unit = NSCalendarUnitYear |NSCalendarUnitWeekOfMonth |NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute |NSCalendarUnitSecond;
    //计算两个日期之间的差值
    NSDateComponents *cmps = [calendar components:unit fromDate:date toDate:date2 options:0];
    //第一个时间的年月日时分秒
    NSDateComponents *createDateCmps = [calendar components:unit fromDate:date];
    //第二个时间的年月日时分秒
    NSDateComponents *nowCmps = [calendar components:unit fromDate:date2];
    // 日期的比较
    if (createDateCmps.year == nowCmps.year) { // 今年
        if (cmps.day >= 2) {//前天
            fmt.dateFormat =@"昨天 HH:mm";
            return [fmt stringFromDate:date2];

        }else if (cmps.day ==0){//今天
            if (cmps.hour >1) { //大于1小时前
                return [NSString stringWithFormat:@"%ld小时前", cmps.hour];
            } else if (cmps.minute >=1) {
                return [NSString stringWithFormat:@"%ld分钟前", cmps.minute];
            } else {
                return [NSString stringWithFormat:@"%ld秒钟前", cmps.second] ;
            }
        } else { //今年的其他日子不带年份的日期
            fmt.dateFormat =@"MM-dd HH:mm";// dateFormatDefine //@"MM-dd HH:mm"
            return [fmt stringFromDate:date];
        }
    }else
    { //非今年带年份的具体日期
        fmt.dateFormat =dateFormatDefine;
        return [fmt stringFromDate:date];
    }
    
    
}

@end
