//
//  Utility.m
//  ManagementApp
//
//  Created by xuyong on 15/10/12.
//  Copyright © 2015年 suda_505. All rights reserved.
//

#import "Utility.h"
#import "TMCache.h"
#import "NSDate+TIXACategory.h"

static UIImageView *orginImageView;

NSString *const notificationName = @"notificationTimeStamp";

@implementation Utility

#pragma mark - 判断字符串是否为空

+(BOOL)checkString:(NSString *)string {
    if (string.length==0) {
        return NO;
    }
    if (string == nil || string == NULL) {
        return NO;
    }
    if ([string isKindOfClass:[NSNull class]]) {
        return NO;
    }
    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0) {
        return NO;
    }
    return YES;
}

#pragma mark - 获取本地图片

+(UIImage *)getImgWithImageName:(NSString *)imgName{
    return [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:imgName ofType:@".png"]];
}

#pragma mark - 隐藏UITableView多余的分割线

+ (void)setExtraCellLineHidden: (UITableView *)tableView {
    UIView *view =[ [UIView alloc]init];
    view.backgroundColor = [UIColor clearColor];
    [tableView setTableFooterView:view];
}

#pragma mark -  对图片data大小比例压缩

+(UIImage *)dealImageData:(UIImage *)image {
    
    CGFloat compression = 1.0f;
    CGFloat maxCompression = 0.1f;
    int maxFileSize = 200*1024;
    
    NSData *imageData = UIImageJPEGRepresentation(image, compression);
    
    while ([imageData length] > maxFileSize && compression > maxCompression)
    {
        compression -= 0.1;
        imageData = UIImageJPEGRepresentation(image, compression);
    }
    
    return [UIImage imageWithData:imageData];
}

#pragma mark -  正则判断

+(BOOL)predicateText:(NSString *)text regex:(NSString *)regex {
    NSPredicate *test = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    if (![test evaluateWithObject:text]){
        return NO;
    }else {
        return YES;
    }
}

#pragma mark - 显示大图

+(void)showImage:(UIImageView *)avatarImageView{
    UIImage *image=avatarImageView.image;
    orginImageView = avatarImageView;
    orginImageView.alpha = 0;
    UIWindow *window=[UIApplication sharedApplication].keyWindow;
    UIView *backgroundView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    CGRect oldframe=[avatarImageView convertRect:avatarImageView.bounds toView:window];
    backgroundView.backgroundColor=[[UIColor blackColor] colorWithAlphaComponent:0.7];
    backgroundView.alpha=1;
    UIImageView *imageView=[[UIImageView alloc]initWithFrame:oldframe];
    imageView.image=image;
    imageView.tag=1;
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    imageView.clipsToBounds = YES;
    [backgroundView addSubview:imageView];
    [window addSubview:backgroundView];
    
    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hideImage:)];
    [backgroundView addGestureRecognizer: tap];
    
    [UIView animateWithDuration:0.3 animations:^{
        imageView.frame=CGRectMake(0,([UIScreen mainScreen].bounds.size.height-image.size.height*[UIScreen mainScreen].bounds.size.width/image.size.width)/2, [UIScreen mainScreen].bounds.size.width, image.size.height*[UIScreen mainScreen].bounds.size.width/image.size.width);
        backgroundView.alpha=1;
    } completion:^(BOOL finished) {
        
    }];
}

+(void)hideImage:(UITapGestureRecognizer*)tap{
    UIView *backgroundView=tap.view;
    UIImageView *imageView=(UIImageView*)[tap.view viewWithTag:1];
    [UIView animateWithDuration:0.3 animations:^{
        imageView.frame=[orginImageView convertRect:orginImageView.bounds toView:[UIApplication sharedApplication].keyWindow];
    } completion:^(BOOL finished) {
        [backgroundView removeFromSuperview];
        orginImageView.alpha = 1;
        backgroundView.alpha=0;
    }];
}

#pragma mark -  缩短数量描述，例如 51234 -> 5万

+ (NSString *)shortedNumberDesc:(NSUInteger)number {
    if (number <= 9999) return [NSString stringWithFormat:@"%d", (int)number];
    if (number <= 9999999) return [NSString stringWithFormat:@"%d万", (int)(number / 10000)];
    
    return [NSString stringWithFormat:@"%d千万", (int)(number / 10000000)];
}


+ (void)pushVC:(UIViewController *)vc targetVC:(UIViewController *)targetVC{
    CATransition *transition = [CATransition animation];
    transition.duration = 0.25;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
    transition.type = kCATransitionPush;
    transition.subtype = kCATransitionFromTop;
    transition.delegate = vc;
    [vc.navigationController.view.layer addAnimation:transition forKey:nil];
    [vc.navigationController pushViewController:targetVC animated:NO];
}
+ (void)popVC:(UIViewController *)vc {
    CATransition *transition = [CATransition animation];
    transition.duration = 0.25;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
    transition.type = kCATransitionPush;
    transition.subtype = kCATransitionFromBottom;
    transition.delegate = vc;
    [vc.navigationController.view.layer addAnimation:transition forKey:nil];
    [vc.navigationController popViewControllerAnimated:NO];
}



+ (NSString *) localWiFiIPAddress
{
    BOOL success;
    struct ifaddrs * addrs;
    const struct ifaddrs * cursor;
    
    success = getifaddrs(&addrs) == 0;
    if (success) {
        cursor = addrs;
        while (cursor != NULL) {
            if (cursor->ifa_addr->sa_family == AF_INET && (cursor->ifa_flags & IFF_LOOPBACK) == 0)
            {
                NSString *name = [NSString stringWithUTF8String:cursor->ifa_name];
                if ([name isEqualToString:@"en0"])  // Wi-Fi adapter
                    return [NSString stringWithUTF8String:inet_ntoa(((struct sockaddr_in *)cursor->ifa_addr)->sin_addr)];
            }
            cursor = cursor->ifa_next;
        }
        freeifaddrs(addrs);
    }
    return nil;
}







#define ORDER_AND_PAY_KEY @"wenshixiong789632145fwdzs"

+ (NSString*)encryptMD5String:(NSDictionary *)str {//
    
    NSString *sortString=[self sortInAscendingOrder:str];//参数按照从大到小的顺序排列
    NSString *keyString = [NSString stringWithFormat:@"&key=%@",ORDER_AND_PAY_KEY];
    
    NSString *tempString=[sortString stringByAppendingString:keyString];
    
    NSLog(@"%@",tempString);
    
    const char *cStr = [tempString UTF8String];
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5( cStr, (CC_LONG)strlen(cStr), digest);
    
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x", digest[i]];
    return [output uppercaseString];
    
    
}

+(NSString *)sortInAscendingOrder:(NSDictionary *)params
{
    
    NSMutableString *temp =[[NSMutableString alloc] init];
    NSArray *keys = [params allKeys];//获取所有的key
    NSArray *sortedArray =
    [keys sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];//对所有的key进行排序
    
    for (int i=0; i<sortedArray.count; i++)//遍历所有的key
    {
        NSString *obj = [sortedArray objectAtIndex:i];
        NSObject *string = [params objectForKey:obj];//获取key所对应的value
        NSString *value=[NSString stringWithFormat:@"%@",string];
        [temp appendString:obj];
        [temp appendString:@"="];
        [temp appendString:value];
        if (i<sortedArray.count-1) {
            [temp appendString:@"&"];
        }
    }
    NSLog(@"temp:%@",temp);
    return temp;
}


#pragma mark - 返回document文件夹的路径
+(NSString *)returnPath {
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    return path;
}

+(void)saveUserData {
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0),^{
//        NSFileManager *fileManage = [NSFileManager defaultManager];
//        NSString *path = [Utility returnPath];
//        
//        NSString *filename = [path stringByAppendingPathComponent:@"user.plist"];
//        
//        if ([fileManage fileExistsAtPath:filename]) {
//            [fileManage removeItemAtPath:filename error:nil];
//        }
//        
//        [NSKeyedArchiver archiveRootObject:[RequestData getUserInfo] toFile:filename];
//    });
    
}
+(BOOL)hasUser {
//    NSFileManager *fileManage = [NSFileManager defaultManager];
//    NSString *path = [Utility returnPath];
//    NSString *filename = [path stringByAppendingPathComponent:@"user.plist"];
//    
//    if (![fileManage fileExistsAtPath:filename]) {
//        return false;
//    }else { 
        return true;
//    }
}
+(void)readUserData {
//    NSFileManager *fileManage = [NSFileManager defaultManager];
//    NSString *path = [Utility returnPath];
//    NSString *filename = [path stringByAppendingPathComponent:@"user.plist"];
//    
//    if ([fileManage fileExistsAtPath:filename]) {
//        @try {
//            UserInfoModel *model = [NSKeyedUnarchiver unarchiveObjectWithFile:filename];
//            [RequestData setUserInfo:model];
//        }
//        @catch (NSException *exception) {
//        }
//        @finally {
//        }
//    }
}
+(void)deleteUserData {
//    NSFileManager *fileManage = [NSFileManager defaultManager];
//    NSString *path = [Utility returnPath];
//    NSString *filename = [path stringByAppendingPathComponent:@"user.plist"];
//    
//    if ([fileManage fileExistsAtPath:filename]) {
//        [fileManage removeItemAtPath:filename error:nil];
//    }
}


+ (UIImage*)screenView:(UIView *)view{
    //    [self.navigationController.view.layer renderInContext:context]
    
    CGRect rect = view.frame;
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    //    [view.layer renderInContext:context];
    [view.layer renderInContext:context];
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}


#pragma mark - 判断摄像头权限
+(void)checkAVAuthorizationStatus:(UIViewController *)rootVC
{
    NSString * mediaType = AVMediaTypeVideo;
    AVAuthorizationStatus  authorizationStatus = [AVCaptureDevice authorizationStatusForMediaType:mediaType];
    if (authorizationStatus == AVAuthorizationStatusRestricted|| authorizationStatus == AVAuthorizationStatusDenied)
    {
        UIAlertController * alertC = [UIAlertController alertControllerWithTitle:@"请到设置->隐私->相机中开启摄像头权限" message:nil preferredStyle:UIAlertControllerStyleAlert];
        [rootVC presentViewController:alertC animated:YES completion:nil];
        //UIAlertAction * cancelAction = [UIAlertAction actionWithTitle:@"我知道了" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
          //  [rootVC dismissViewControllerAnimated:YES completion:nil];
        //}];
        //[alertC addAction:cancelAction];
        UIAlertAction * setAction = [UIAlertAction actionWithTitle:@"去设置" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            [rootVC dismissViewControllerAnimated:YES completion:nil];
            //设置界面
//            NSURL *url = [NSURL URLWithString:@"prefs:root=Privacy&path=CAMERA"];
//            if ([[UIApplication sharedApplication] canOpenURL:url])
//            {
//                [[UIApplication sharedApplication] openURL:url];
//            }else
//            {
//                
//            }
            
            NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
            if ([[UIApplication sharedApplication] canOpenURL:url]) {
                [[UIApplication sharedApplication] openURL:url];
            }
            
        }];
        [alertC addAction:setAction];
        return;
    }else{
    }
}



///验证登录信息
+(BOOL)checkIsLoginSucess
{
    ///验证登录
    if ([RequestData getUserInfo] == nil) {
        
        //TODO:跳转到登录页面
        
        return false;
    }
    return true;
}

#pragma mark - 检查当前是否开启APP通知
+(void)checkNotificationStatus:(UIViewController *)rootVC
{
    ///当前APP未开启通知功能
    if ([[UIApplication sharedApplication] currentUserNotificationSettings].types  == UIUserNotificationTypeNone) {
        NSDate *stampValueData = [[NSUserDefaults standardUserDefaults] objectForKey:[NSString stringWithFormat:@"%@_%ld",notificationName,(long)[RequestData getUserInfo].uId]];//notificationName
        
        NSDate *nowDate        = [NSDate date];
        BOOL isJumpSetting     = [NSDate date:stampValueData componentsDate2:nowDate];
        
        if (isJumpSetting || stampValueData == nil) {
            //文案调整
            
            NSString *toastTitle = @"";
            if ([RequestData getUserInfo].verifiedStatus == 2) {
                //律师
                toastTitle = @"请打开通知功能，以便您及时收到用户直连、提问等信息";
            }else
            {
                toastTitle = @"请打开通知功能，以便及时收到律师回复信息";
            }
            
            UIAlertController * alertC = [UIAlertController alertControllerWithTitle:@"请到设置->掌律->开启通知" message:toastTitle preferredStyle:UIAlertControllerStyleAlert];
            [rootVC presentViewController:alertC animated:YES completion:nil];
            
            UIAlertAction * setAction = [UIAlertAction actionWithTitle:@"去打开" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                [rootVC dismissViewControllerAnimated:YES completion:nil];
                
                NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
                if ([[UIApplication sharedApplication] canOpenURL:url]) {
                    [[UIApplication sharedApplication] openURL:url];
                }
            }];
            
            UIAlertAction * cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
            }];
            
            [alertC addAction:setAction];
            [alertC addAction:cancelAction];
            
            //记录当前日期
            [[NSUserDefaults standardUserDefaults] setObject:[NSDate date] forKey:[NSString stringWithFormat:@"%@_%ld",notificationName,(long)[RequestData getUserInfo].uId]];
            [[NSUserDefaults standardUserDefaults] synchronize];
            return;
        }
    }
}


#pragma mark - 缓存用户信息
///缓存用户信息
+(void)cacheUserInfo:(UserInfoModel *)userModel
{
    [[TMCache sharedCache] setObject:userModel forKey:@"UserInfoModel"];
}

///获取用户缓存信息
+(UserInfoModel *)getCacheUserInfo
{
    UserInfoModel *model =  [[TMCache sharedCache] objectForKey:@"UserInfoModel"];
    return model;
}

///删除用户缓存信息
+(void)removeCacheUserInfo
{
    [[TMCache sharedCache] removeObjectForKey:@"UserInfoModel"];
}

#pragma mark - 计算现金余额
+(NSInteger)calculationHowmuchMoney:(NSInteger)balance froze:(NSInteger)froze charge:(NSInteger)charge
{
    NSInteger canUseMoney = 0;
    if (froze > 0) {
        ///带有现金抵用金
        NSInteger frozeChage = charge/2;
        return balance - frozeChage;//实际现金余额
    }else
    {
        ///正常余额
        canUseMoney = balance;
    }
    return canUseMoney;
}

#pragma mark - 获取当前用户头像

/**
 获取用户默认头像信息

 @param gender 1男2女0未知
 @param isLawyer
 @return
 */
+(NSString *)getHeaderNameWithGender:(NSInteger)gender isLawyer:(BOOL)isLawyer
{
    if (isLawyer) {
        //律师默认头像
        if (gender == 1) {
            return @"head_lawyer_male";
        }else if (gender == 2)
        {
            return @"head_lawyer_female";
        }else
        {
            return @"default_head";
        }
    }else
    {
        //普通用户默认头像
        if (gender == 1) {
            return @"head_user_male";
        }else if (gender == 2)
        {
            return @"head_user_female";
        }else
        {
            return @"default_head";
        }
    }
    return @"";
}

@end
