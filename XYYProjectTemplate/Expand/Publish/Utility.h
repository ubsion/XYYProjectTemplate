//
//  Utility.h
//  ManagementApp
//
//  Created by xuyong on 15/10/12.
//  Copyright © 2015年 suda_505. All rights reserved.
//

#import <Foundation/Foundation.h>

///公共类方法

#import <CommonCrypto/CommonCrypto.h>
#include <arpa/inet.h>
#include <netdb.h>
#include <net/if.h>
#include <ifaddrs.h>
#import <dlfcn.h>
#import <SystemConfiguration/SystemConfiguration.h>

#import "RequestData.h"
#import "UserInfoModel.h"
@interface Utility : NSObject

#pragma mark - 判断字符串是否为空
+(BOOL)checkString:(NSString *)string;

#pragma mark - 获取本地图片
+(UIImage *)getImgWithImageName:(NSString *)imgName;

#pragma mark - 隐藏UITableView多余的分割线
+ (void)setExtraCellLineHidden: (UITableView *)tableView;

#pragma mark -  对图片data大小比例压缩
+(UIImage *)dealImageData:(UIImage *)image;

#pragma mark -  正则判断
+(BOOL)predicateText:(NSString *)text regex:(NSString *)regex;

#pragma mark - 显示大图
+(void)showImage:(UIImageView *)avatarImageView;

#pragma mark -  缩短数量描述，例如 51234 -> 5万
+ (NSString *)shortedNumberDesc:(NSUInteger)number;


+ (void)pushVC:(UIViewController *)vc targetVC:(UIViewController *)targetVC;
+ (void)popVC:(UIViewController *)vc;

#pragma mark - 微信支付
+(void)wxPayWithDic:(NSDictionary *)aDic;
+ (NSString *) localWiFiIPAddress;


+ (NSString*)encryptMD5String:(NSDictionary *)str;

#pragma mark - 返回document文件夹的路径
+(NSString *)returnPath;

+(void)saveUserData;
+(BOOL)hasUser;
+(void)readUserData;
+(void)deleteUserData;


+ (UIImage*)screenView:(UIView *)view;



#pragma mark - 判断摄像头权限
///检查摄像头权限问题
+(void)checkAVAuthorizationStatus:(UIViewController *)rootVC;
///验证登录信息
+(BOOL)checkIsLoginSucess;

#pragma mark - 检查当前是否开启APP通知
+(void)checkNotificationStatus:(UIViewController *)rootVC;

#pragma mark - 缓存用户信息
///缓存用户信息
+(void)cacheUserInfo:(UserInfoModel *)userModel;

///获取用户缓存信息
+(UserInfoModel *)getCacheUserInfo;

///删除用户缓存信息
+(void)removeCacheUserInfo;

/**
 获取用户默认头像信息
 
 @param gender 1男2女0未知
 @param isLawyer
 @return
 */
+(NSString *)getHeaderNameWithGender:(NSInteger)gender isLawyer:(BOOL)isLawyer;

@end
