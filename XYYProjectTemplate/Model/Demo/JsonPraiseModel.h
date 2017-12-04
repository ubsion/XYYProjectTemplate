//
//  JsonPraiseModel.h
//  XYYProjectTemplate
//
//  Created by xuyong on 2017/12/4.
//  Copyright © 2017年 xuyong. All rights reserved.
//

#import "BaseModel.h"

@class User;
@interface JsonPraiseModel : BaseModel

@property (nonatomic,copy) NSString *anyThing;

@property (nonatomic,assign) double created;

@property (nonatomic,strong) NSArray *list;

@property (nonatomic,strong) User    *user;

//自定义转换字段
@property (nonatomic,copy) NSString *createdStr;

@end

@interface User:BaseModel

@property (nonatomic,copy) NSString *nickName;

@property (nonatomic,assign) NSInteger uId;

@property (nonatomic,assign) int age;


@end




