//
//  NSString+Tools.m
//  SuiShouXianGou
//
//  Created by netting on 14-1-2.
//  Copyright (c) 2014年 netting. All rights reserved.
//

#import "NSString+Tools.h"
#import "NSDictionary+Tools.h"

@implementation NSString (Tools)

- (CGSize)textSizeWithUIFont:(UIFont*)font
{
    CGSize size = CGSizeZero;
    if (self.length > 0)
    {
        if ([self respondsToSelector:@selector(sizeWithAttributes:)])
        {
            size = [self sizeWithAttributes:@{NSFontAttributeName: font}];
        }
        else
        {
            size = [self sizeWithFont:font];
        }
    }
    return CGSizeMake(ceilf(size.width), ceilf(size.height));
}

+ (NSString *)stringWithStringWhenEmpty:(NSString*)string;
{
    return [NSString stringWithStringWhenEmpty:string defaultString:nil];
}

+ (NSString *)stringWithStringWhenEmpty:(NSString*)string defaultString:(NSString*)defualtString
{
    if (string.length > 0)
    {
        return [NSString stringWithString:string];
    }
    else if (defualtString.length > 0)
    {
        return [NSString stringWithString:defualtString];
    }
    else
    {
        return @"";
    }
}

- (CGSize)textSizeWithUIFont:(UIFont*)font maxSize:(CGSize)maxSize
{
    CGSize size = CGSizeZero;
    if (self.length > 0)
    {
        if ([self respondsToSelector:@selector(sizeWithAttributes:)])
        {
            size = [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: font} context:nil].size;
        }
        else
        {
            size = [self sizeWithFont:font constrainedToSize:maxSize];
        }
    }
    return CGSizeMake(ceilf(size.width), ceilf(size.height));
}

#pragma mark URL

- (NSString *)urldecode {
    return [self stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}

- (NSString *)urlencode {
	NSString *encUrl = [self stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//    NSDate* tmpStartData = [NSDate date];
    NSArray *escapeChars = [NSArray arrayWithObjects:@";" , @"/" , @"?" , @":" ,
                            @"@" , @"&" , @"=" , @"+" , @"$" , @",",@"!", @"'", @"(", @")", @"*", @"#", @"~", @"[", @"]", nil];
    NSArray*replaceChars = [NSArray arrayWithObjects:@"%3B" , @"%2F", @"%3F" , @"%3A" ,
                            @"%40" , @"%26" , @"%3D" , @"%2B" , @"%24" , @"%2C",@"%21", @"%27", @"%28", @"%29", @"%2A", @"%23", @"%7E", @"%5B", @"%5D", nil];
    
    NSUInteger len = [escapeChars count];
    NSMutableString *temp = [NSMutableString stringWithString:encUrl];
    for (int i = 0; i < len; i++) {
        [temp replaceOccurrencesOfString:[escapeChars objectAtIndex:i]
                              withString:[replaceChars objectAtIndex:i]
                                 options:NSLiteralSearch
                                   range:NSMakeRange(0, [temp length])];
    }
	return [NSString stringWithString:temp];
}

- (NSString*)addURLParams:(NSDictionary *)params
{
    if (params)
    {
        NSMutableString *_add = nil;
        if (NSNotFound != [self rangeOfString:@"?"].location) {
            _add = [NSMutableString stringWithString:@"&"];
        }else {
            _add = [NSMutableString stringWithString:@"?"];
        }
        [_add appendString:[params URLParamsString]];
        
        return [NSString stringWithFormat:@"%@%@",
                self,_add];
    }
    else
    {
        return [NSString stringWithFormat:@"%@",
                self];
    }
}

- (NSDictionary *)URLParams
{
	NSMutableDictionary* pairs = [NSMutableDictionary dictionary];
    NSString *paramString = nil;
	if (NSNotFound != [self rangeOfString:@"?"].location) {
        paramString = [self substringFromIndex:
                       ([self rangeOfString:@"?"].location + 1)];
	}
    else
    {
        paramString = self;
    }
    NSCharacterSet* delimiterSet = [NSCharacterSet characterSetWithCharactersInString:@"&"];
    NSScanner* scanner = [[NSScanner alloc] initWithString:paramString];
    while (![scanner isAtEnd]) {
        NSString* pairString = nil;
        [scanner scanUpToCharactersFromSet:delimiterSet intoString:&pairString];
        [scanner scanCharactersFromSet:delimiterSet intoString:NULL];
        NSArray* kvPair = [pairString componentsSeparatedByString:@"="];
        if (kvPair.count == 2) {
            NSString* key = [[kvPair objectAtIndex:0] urldecode];
            NSString* value = [[kvPair objectAtIndex:1] urldecode];
            [pairs setValue:value forKey:key];
        }
    }
	
	return [NSDictionary dictionaryWithDictionary:pairs];
}


- (NSMutableDictionary *)stringParams
{
	NSMutableDictionary* pairs = [NSMutableDictionary dictionary];
    NSCharacterSet* delimiterSet = [NSCharacterSet characterSetWithCharactersInString:@"&"];
    NSScanner* scanner = [[NSScanner alloc] initWithString:self];
    while (![scanner isAtEnd]) {
        NSString* pairString = nil;
        [scanner scanUpToCharactersFromSet:delimiterSet intoString:&pairString];
//        NSLog(@"===:%@",pairString);
        [scanner scanCharactersFromSet:delimiterSet intoString:NULL];
        NSArray* kvPair = [pairString componentsSeparatedByString:@"="];
        
//        NSLog(@"%@",kvPair);
        if (kvPair.count == 2) {
            NSString* key = [[kvPair objectAtIndex:0] urldecode];
            NSString* value = [[kvPair objectAtIndex:1] urldecode];
            [pairs setValue:value forKey:key];
        }else if (kvPair.count>2){//如果有存在多个=号
            NSString* key = [[kvPair objectAtIndex:0] urldecode];
            NSString *value=[[kvPair objectAtIndex:1] urldecode];
            
            for (int i=2;i<kvPair.count;i++) {
                if (![@"" isEqualToString:[kvPair objectAtIndex:i]]&&[kvPair objectAtIndex:i]!=nil) {
                    value=[value stringByAppendingString:[NSString stringWithFormat:@"=%@",[[kvPair objectAtIndex:i] urldecode]]];
                }else{
                    value=[value stringByAppendingString:@"="];
                }
            }
            [pairs setValue:value forKey:key];
        }
    }

    NSLog(@"%@",pairs);
	return pairs;
}

//服务器返回的url如果含有中文字符需要处理
-(NSURL*)urlJumpHandle{
    NSString *str = [self stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL *url=[NSURL URLWithString:[str stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    return url;
}


-(NSString *)lawyerSuffix
{
    if (self.length > 2) {
        //查看是否有律师后缀字样
        NSString *str = [self substringFromIndex:(self.length - 2)];
        if ([str isEqualToString:@"律师"]) {
            return self;
        }else
        {
            return [NSString stringWithFormat:@"%@律师",self];
        }
    }else
    {
        return [NSString stringWithFormat:@"%@律师",self];
    }
}


-(NSString *)moneyChangeToFen
{
    int newMoney = self.intValue;
    newMoney = newMoney * 100;
    
    return [NSString stringWithFormat:@"%d",newMoney];
}

-(NSString *)moneyChangeToYUAN
{
    CGFloat newMoney = self.floatValue;
    newMoney = newMoney / 100;
    
    return [NSString stringWithFormat:@"%f",newMoney];
}

/**
 json转 Dic
 
 @param jsonString
 @return
 */
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString
{
    if (jsonString == nil) {
        return nil;
    }
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err)
    {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}

/**
 @method 获取指定宽度width的字符串在UITextView上的高度
 @param textView 待计算的UITextView
 @param Width 限制字符串显示区域的宽度
 @result float 返回的高度
 */
//+ (float) heightForString:(UITextView *)textView andWidth:(float)width{
//    CGSize sizeToFit = [textView sizeThatFits:CGSizeMake(width, MAXFLOAT)];
//    return sizeToFit.height;
//}

+ (float) heightForString:(NSString *)text andWidth:(float)width{
    CGSize titleSize = [text boundingRectWithSize:CGSizeMake(SCREEN_WIDTH - 100, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13]} context:nil].size;
    return titleSize.height;
}

+ (NSString *)formatFloat:(float)f
{
    if (fmodf(f, 1)==0) {//整数
        return [NSString stringWithFormat:@"%.0f",f];
    } else if (fmodf(f*10, 1)==0) {
        //保留有效一位小数
        return [NSString stringWithFormat:@"%.1f",f];
    } else {
        //保留两位有效小数
        return [NSString stringWithFormat:@"%.2f",f];
    }
}



@end
