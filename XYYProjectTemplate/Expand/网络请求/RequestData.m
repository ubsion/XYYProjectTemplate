//
//  RequestData.m
//  NewsApp
//
//  Created by xuyong on 15/12/28.
//  Copyright © 2015年 xuyong. All rights reserved.
//

#import "RequestData.h"

@implementation RequestData

#pragma mark --- 用户信息
//static PushModelModel   *pushSettingModel;
static UserInfoModel    *userInfoModel;
//static ActionInfoModel  *actionInfoModel;
//static RoomModel        *roomModel;
//static NSArray          *homeCategoryModule;
//static NSArray          *contentTagArray;
//static NSArray          *lawyerTagArray;
///地址
//static PlaceModel       *placeModel;

static NSArray          *msgConfigArray;


//+ (void )setPushModelModel:(PushModelModel *)pushSetting
//{
//    pushSettingModel = pushSetting;
//}
//
//+ (PushModelModel *)getPushModelModel
//{
//    return pushSettingModel;
//}

+ (void )setUserInfo:(UserInfoModel *)userInfo
{
    if(userInfo.nickName.length == 0)
        userInfo.nickName = [NSString stringWithFormat:@"ID:%ld",(long)userInfo.uId];
    
    
    userInfoModel = userInfo;
    
    if (userInfo != nil) {
        //保存登录用户信息
//        [Utility saveUserData];
    }else {
//        [Utility deleteUserData];
    }
    
    //TODO:自己修改
//    userInfo.verifiedStatus = 0;
    
}

+ (UserInfoModel *)getUserInfo
{
    return userInfoModel;
}

//+ (void )setActionInfo:(ActionInfoModel *)actionInfo
//{
//    actionInfoModel = actionInfo;
//}
//
//+ (ActionInfoModel *)getActionInfo
//{
//    return actionInfoModel;
//}

//+ (void )setRoomModel:(RoomModel *)roomInfo
//{
//    roomModel = roomInfo;
//}
//
//+ (RoomModel *)getRoomModel
//{
//    return roomModel;
//}

///保存首页tag
//+(void)setHomeCategoryModule:(NSArray *)moduleArray
//{
//    homeCategoryModule = moduleArray;
//}
//
//+(NSArray *)getHomeCategoryModule
//{
//    return homeCategoryModule;
//}

/////内容页tag
//+(void)setContentTagArray:(NSArray *)tagArray
//{
//    contentTagArray = tagArray;
//}
//
//+(NSArray *)getContentTagArray
//{
//    return contentTagArray;
//}
//
/////律师tag
//+(void)setLawyerTagArray:(NSArray *)tagArray
//{
//    lawyerTagArray = tagArray;
//}
//
//+(NSArray *)getLawyerTagArray
//{
//    return lawyerTagArray;
//}
//
/////私信配置
//+(void)setMsgConfigArray:(NSArray *)tagArray
//{
//    msgConfigArray = tagArray;
//}
//
//+(NSArray *)getMsgConfigArray
//{
//    return msgConfigArray;
//}


/////定位地址
//+ (void )setPlaceModel:(PlaceModel *)place
//{
//    placeModel = place;
//}
//
//+ (PlaceModel *)getPlaceModel
//{
//    return placeModel;
//}



@end
