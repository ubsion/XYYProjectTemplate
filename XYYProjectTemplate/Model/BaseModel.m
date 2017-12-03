//
//  BaseModel.m
//  Plamlawyer
//
//  Created by xuyong on 2017/4/5.
//  Copyright © 2017年 xuyong. All rights reserved.
//

#import "BaseModel.h"

@implementation BaseModel

#pragma mark - NSCoding
-(instancetype)initWithCoder:(NSCoder *)decoder
{
    self = [super init];
    if (self) {
        
        Class c = self.class;
        // 截取类和父类的成员变量
        while (c && c != [NSObject class]) {
            unsigned int count = 0;
            Ivar *ivars = class_copyIvarList(c, &count);
            for (int i = 0; i < count; i++) {
                
                NSString *key = [NSString stringWithUTF8String:ivar_getName(ivars[i])];
                
                id value = [decoder decodeObjectForKey:key];
                
                if (value != nil) {
                    [self setValue:value forKey:key];
                }
                
                
            }
            // 获得c的父类
            c = [c superclass];
            free(ivars);
        }
    }
    return self;
}

-(void)encodeWithCoder:(NSCoder *)encoder
{
    Class c = self.class;
    // 截取类和父类的成员变量
    while (c && c != [NSObject class]) {
        unsigned int count = 0;
        
        Ivar *ivars = class_copyIvarList(c, &count);
        
        for (int i = 0; i < count; i++) {
            Ivar ivar = ivars[i];
            NSString *key = [NSString stringWithUTF8String:ivar_getName(ivar)];
            
            id value = [self valueForKey:key];
            
            if (value != nil) {
                [encoder encodeObject:value forKey:key];
            }
            
        }
        c = [c superclass];
        
        // 释放内存
        free(ivars);
    }
}


//+ (NSDictionary*)mts_mapping {
//    return  @{};
//}
//
//+ (BOOL)mts_shouldSetUndefinedKeys {
//    return NO;
//}
//
//+ (NSDictionary*)mts_arrayClassMapping
//{
//    return @{};
//}


@end
