//
//  UserInfoModel.h
//  NewsApp
//
//  Created by xuyong on 15/12/28.
//  Copyright © 2015年 xuyong. All rights reserved.
//


#import "BaseModel.h"

@interface UserInfoModel : BaseModel

///uId
@property(nonatomic,assign) NSInteger          uId;
///年龄
@property(nonatomic,assign) NSInteger          age;
///视听数
@property(nonatomic,assign) NSInteger          avNum;
///头像
@property(nonatomic,strong) NSString           *avatar;
///粉丝数
@property(nonatomic,assign) NSInteger          fansNum;
///关注数
@property(nonatomic,assign) NSInteger          followingNum;
///性别,1 男, 2 女,
@property(nonatomic,assign) NSInteger          gender;
///嘉宾数
@property(nonatomic,assign) NSInteger          guestsNum;
///个性签名最多30个字
@property(nonatomic,strong) NSString           *signature;
///昵称 最长50字符
@property(nonatomic,strong) NSString           *nickName;
///手机号
@property(nonatomic,strong) NSString           *phoneNumber;
///用户标签(专业)的id 多个以,分割
@property(nonatomic,strong) NSString           *tagIds;
///用户标签(专业) 多个以,分割
@property(nonatomic,strong) NSString           *tags;
///账户类型 普通账户:1<<0;超级管理员:1<<1可以组合同时是多种身份 84.其他管理员
@property(nonatomic,assign) NSInteger          type;
///实名认证状态 0:未认证 1:审核中 2:已认证 3:未通过
@property(nonatomic,assign) NSInteger          verifiedStatus;
///腾讯云sig
@property(nonatomic,strong) NSString           *videoUId;

///是否被当前用户关注 0:未关注，1：已关注
@property(nonatomic,assign) NSInteger          isFollowed;
///是否收藏:0:未收藏，1：已收藏 ,
@property(nonatomic,assign) NSInteger          isFavorite;
///
@property(nonatomic,strong) NSString           *thirdBindPhoneNum;

@property (nonatomic,assign) NSInteger         billStartTime;
///活跃用户0 不是 1是
@property (nonatomic,assign) NSInteger         isActive;
///平台推荐0 不是 1是
@property (nonatomic,assign) NSInteger         isRecommended;

///tags------
@property (nonatomic,copy) NSString            *lawyerTagIds;
@property (nonatomic,copy) NSString            *lawyerTags;


///收费标准
@property(nonatomic,assign) CGFloat          charge;
@property (nonatomic,assign) NSInteger       chargeForUpload;
///直连时长
@property(nonatomic,assign) NSInteger          consultDuration;
///律师所在地
@property(nonatomic,strong) NSString           *location;
///公司
@property(nonatomic,strong) NSString           *company;
///在线状态，0:离线,1:咨询中,2:在线
@property(nonatomic,assign) NSInteger          onlineState;
///律师星级
@property(nonatomic,assign) CGFloat            star;
///腾讯云sig name
@property (nonatomic,copy) NSString            *sigName;
///腾讯云sig
@property (nonatomic,copy) NSString            *tencentYunSig;
///是否是律师
@property(nonatomic,assign) NSInteger          isLawyer;
///真实姓名
@property(nonatomic,copy)  NSString            *realName;
///直连次数
@property(nonatomic,assign) NSInteger          interactionNum;
///直播次数
@property(nonatomic,assign) NSInteger          liveNum;
///: 在线设置状态 ,在线状态设置,0为离线，1为在线，2为自定义
@property(nonatomic,assign) NSInteger          onlineSetState;
///执业年限
@property (nonatomic,assign) NSInteger         seniority;
///直连次数
@property(nonatomic,assign) NSInteger          directConnectedNum;
///直连成功次数
@property(nonatomic,assign) NSInteger          connectSuccessNum;

///余额
@property(nonatomic,assign) CGFloat            balance;


@end



