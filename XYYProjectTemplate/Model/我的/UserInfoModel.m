//
//  UserInfoModel.m
//  NewsApp
//
//  Created by xuyong on 15/12/28.
//  Copyright © 2015年 xuyong. All rights reserved.
//

#import "UserInfoModel.h"
#import "RequestData.h"
#import <objc/runtime.h>


@implementation UserInfoModel
+ (NSDictionary*)mts_mapping {
    return  @{
              @"age": mts_key(age),
              @"avNum": mts_key(avNum),
              @"avatar": mts_key(avatar),
              @"fansNum": mts_key(fansNum),
              @"followingNum": mts_key(followingNum),
              @"signature":mts_key(signature),
              @"gender": mts_key(gender),
              @"guestsNum": mts_key(guestsNum),
              @"nickName": mts_key(nickName),
              @"phoneNumber": mts_key(phoneNumber),
              @"tagIds": mts_key(tagIds),
              @"tags": mts_key(tags),
              @"type": mts_key(type),
              @"uId": mts_key(uId),
              @"verifiedStatus": mts_key(verifiedStatus),
              @"videoUId": mts_key(videoUId),
              @"isFollowed": mts_key(isFollowed),
              @"isFavorite": mts_key(isFavorite), 
              @"thirdBindPhoneNum":mts_key(thirdBindPhoneNum),
              @"lawyerTagIds":mts_key(lawyerTagIds),
              @"lawyerTags":mts_key(lawyerTags),
              @"charge":mts_key(charge),
              @"consultDuration":mts_key(consultDuration),
              @"location":mts_key(location),
              @"company":mts_key(company),
              @"onlineState":mts_key(onlineState),
              @"star":mts_key(star),
              @"sigName":mts_key(sigName),
              @"tencentYunSig":mts_key(tencentYunSig),
              @"isLawyer":mts_key(isLawyer),
              @"realName":mts_key(realName),
              @"interactionNum":mts_key(interactionNum),
              @"liveNum":mts_key(liveNum),
              @"onlineSetState":mts_key(onlineSetState),
              @"seniority":mts_key(seniority),
              @"connectSuccessNum":mts_key(connectSuccessNum),
              @"directConnectedNum":mts_key(directConnectedNum),
              @"balance":mts_key(balance),
              @"frozen":mts_key(frozen),
              @"myAnswerNum":mts_key(myAnswerNum),
              @"coupon":mts_key(coupon),
              @"billVideoNum":mts_key(billVideoNum),
              @"frozen":mts_key(frozen),
              @"userLawyers":mts_key(userLawyers),
              @"lawyerUsers":mts_key(lawyerUsers),
              @"resume":mts_key(resume),
              @"billStartTime":mts_key(billStartTime),
              @"isActive":mts_key(isActive),//myIssueNum,
              @"isRecommended":mts_key(isRecommended),//myIssueNum,
              @"myIssueNum":mts_key(myIssueNum)//myIssueNum
              };
}


+ (BOOL)mts_shouldSetUndefinedKeys {
    return NO;
}




@end




