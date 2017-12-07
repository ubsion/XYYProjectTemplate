//
//  PlaceModel.h
//  AskBrotherApp
//
//  Created by xuyong on 2017/4/28.
//  Copyright © 2017年 李昀. All rights reserved.
//

#import "BaseModel.h"

@interface PlaceModel : BaseModel
///国家
@property (nonatomic,copy) NSString *contry;
///省会(州)
@property (nonatomic,copy) NSString *province;
///市
@property (nonatomic,copy) NSString *city;
///区
@property (nonatomic,copy) NSString *subCity;
///子街道门牌号
@property (nonatomic,copy) NSString *subThoroughfare;
///地址
@property (nonatomic,copy) NSString *address;

///具体位置
@property (nonatomic,copy) NSString *name;
///邮政
@property (nonatomic,copy) NSString *postalCode;

@end
