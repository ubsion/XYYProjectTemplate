//
//  RequestData.h
//  NewsApp
//
//  Created by xuyong on 15/12/28.
//  Copyright © 2015年 xuyong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserInfoModel.h"
//#import "PlaceModel.h"

@interface RequestData : NSObject

#pragma mark --- 用户信息
//+ (void )setPushModelModel:(PushModelModel *)pushSetting;
//+ (PushModelModel *)getPushModelModel;

+ (void )setUserInfo:(UserInfoModel *)userInfo;
+ (UserInfoModel *)getUserInfo;

//+ (void )setActionInfo:(ActionInfoModel *)userInfo;
//+ (ActionInfoModel *)getActionInfo;

//+ (void )setRoomModel:(RoomModel *)roomInfo;
//+ (RoomModel *)getRoomModel;

/////设置首页模块
//+ (void )setHomeCategoryModule:(NSArray *)moduleArray;
//+(NSArray *)getHomeCategoryModule;
//
/////内容页模块
//+(void)setContentTagArray:(NSArray *)tagArray;
//+(NSArray *)getContentTagArray;
//
/////律师tag
//+(void)setLawyerTagArray:(NSArray *)tagArray;
//+(NSArray *)getLawyerTagArray;
//
/////私信配置
//+(void)setMsgConfigArray:(NSArray *)tagArray;
//+(NSArray *)getMsgConfigArray;

///定位地址
//+ (void)setPlaceModel:(PlaceModel *)place;
//+ (PlaceModel *)getPlaceModel;

@end
