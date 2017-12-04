//
//  JsonPraiseModel.m
//  XYYProjectTemplate
//
//  Created by xuyong on 2017/12/4.
//  Copyright © 2017年 xuyong. All rights reserved.
//

#import "JsonPraiseModel.h"

@implementation JsonPraiseModel

// 直接添加以下代码即可自动完成
- (void)encodeWithCoder:(NSCoder *)aCoder { [self yy_modelEncodeWithCoder:aCoder]; }
- (id)initWithCoder:(NSCoder *)aDecoder { self = [super init]; return [self yy_modelInitWithCoder:aDecoder]; }
- (id)copyWithZone:(NSZone *)zone { return [self yy_modelCopy]; }
- (NSUInteger)hash { return [self yy_modelHash]; }
- (BOOL)isEqual:(id)object { return [self yy_modelIsEqual:object]; }
- (NSString *)description { return [self yy_modelDescription]; }

//-(NSString *)createdStr
//{
//    NSDate *date = [NSDate dateWithTimeIntervalSince1970:self.created];
//    return [date formattedDateDescription];
//}

// 返回容器类中的所需要存放的数据类型 (以 Class 或 Class Name 的形式)。
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{
             @"list" : User.class
             };
}

// 当 JSON 转为 Model 完成后，该方法会被调用。
// 你可以在这里对数据进行校验，如果校验不通过，可以返回 NO，则该 Model 会被忽略。
// 你也可以在这里做一些自动转换不能完成的工作。
- (BOOL)modelCustomTransformFromDictionary:(NSDictionary *)dic {
    NSNumber *timestamp = dic[@"created"];
    if (![timestamp isKindOfClass:[NSNumber class]]) return NO;
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:self.created];
    _createdStr = [date formattedDateDescription];
    return YES;
}


@end


@implementation User


@end

