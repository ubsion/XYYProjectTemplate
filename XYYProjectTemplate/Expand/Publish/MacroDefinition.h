//
//  MacroDefinition.h
//  WatchAPP
//
//  Created by xuyong on 15/9/23.
//  Copyright (c) 2015年 xuyong. All rights reserved.
//

#ifndef WatchAPP_MacroDefinition_h
#define WatchAPP_MacroDefinition_h

#endif


#define   TEST_VERSION              //外网| 不注释 内网
//#define   APPSTORE_VERSION     //注释 外网| 不注释 appstore

/*********服务器配置Bengin************/
#ifdef    TEST_VERSION

    #define   FILE_URL              @"http://192.168.100.58:8082/v1/file/"
    #define   SERVER_URL            @"http://192.168.100.58:8082/v1/"

#else

    #ifdef    APPSTORE_VERSION

        #define   FILE_URL              @"https://www.zhanglv.mobi/v1/file/"
        #define   SERVER_URL            @"https://www.zhanglv.mobi/v1"

    #else

        #define   FILE_URL              @"http://test.91lvdou.com/v1/file/"
        #define   SERVER_URL            @"http://test.91lvdou.com/v1"

    #endif

#endif
/*********服务器配置End************/


/*********第三方key配置Begin***************/
#ifdef    TEST_VERSION

    #define   APPID                 @"com.lianxi.ldzb"
    #define   BaiDuGameAppKey       @"96cbc78cdf"
    ///友盟
    #define   UMAppKey              @"57958869e0f55a6d260039ec"

    #define   HXAppKey              @"wenshixiong#ldzb"
    #define   HXApnsName            @"ldzb_dis"

    //腾讯云
    #define    SDKAppID              1400012128//1400013700//
    #define    AccountType           6341//7285//

    //微信登录：
    #define    WXAppID               @"wxb8a31bf1428f8833"
    #define    WXAppSecret           @"4bae0b44e130908552c3daf0e20a33af"

    //腾讯登录：
    #define    QQAppID               @"1105768451"
    #define    QQAppSecret           @"hRi1zeyNLrZobEXl"

    //微博登录：
    #define    WBAppID               @"1629234386"
    #define    WBAppSecret           @"16b9b55aecb8625a6041f94468ae2591"
    #define    kRedirectURI          @"https://api.weibo.com/oauth2/default.html"

#else

    #ifdef    APPSTORE_VERSION

        #define   APPID                 @"com.lianxi.ldzb"
        #define   BaiDuGameAppKey       @"96cbc78cdf"
        ///友盟
        #define   UMAppKey              @"57958869e0f55a6d260039ec"

        #define   HXAppKey              @"wenshixiong#ldzb"
        #define   HXApnsName            @"ldzb_dis"

        //腾讯云
        #define    SDKAppID              1400012128//1400013700//
        #define    AccountType           6341//7285//

        //微信登录：
        #define    WXAppID               @"wxb8a31bf1428f8833"
        #define    WXAppSecret           @"4bae0b44e130908552c3daf0e20a33af"

        //腾讯登录：
        #define    QQAppID               @"1105768451"
        #define    QQAppSecret           @"hRi1zeyNLrZobEXl"

        //微博登录：
        #define    WBAppID               @"1629234386"
        #define    WBAppSecret           @"16b9b55aecb8625a6041f94468ae2591"
        #define    kRedirectURI          @"https://api.weibo.com/oauth2/default.html"

    #else

        #define   APPID                 @"com.lianxi.ldzb"
        #define   BaiDuGameAppKey       @"96cbc78cdf"
        ///友盟
        #define   UMAppKey              @"57958869e0f55a6d260039ec"

        #define   HXAppKey              @"wenshixiong#ldzb"
        #define   HXApnsName            @"ldzb_dis"

        //腾讯云
        #define    SDKAppID              1400012128//1400013700//
        #define    AccountType           6341//7285//

        //微信登录：
        #define    WXAppID               @"wxb8a31bf1428f8833"
        #define    WXAppSecret           @"4bae0b44e130908552c3daf0e20a33af"

        //腾讯登录：
        #define    QQAppID               @"1105768451"
        #define    QQAppSecret           @"hRi1zeyNLrZobEXl"

        //微博登录：
        #define    WBAppID               @"1629234386"
        #define    WBAppSecret           @"16b9b55aecb8625a6041f94468ae2591"
        #define    kRedirectURI          @"https://api.weibo.com/oauth2/default.html"

    #endif

#endif
/*********第三方key配置End***************/


/**********程序配置Benin*********************/
#define    SCREEN_WIDTH         [UIScreen mainScreen].bounds.size.width
#define    SCREEN_HEIGHT        [UIScreen mainScreen].bounds.size.height
#define    Platform             [[[UIDevice currentDevice] systemVersion] floatValue]

#ifdef DEBUG
    #define debugLog(...)    NSLog(__VA_ARGS__)
    #define debugMethod()    NSLog(@"%s", __func__)
    #define debugError()     NSLog(@"Error at %s Line:%d", __func__, __LINE__)
    #define DLog(fmt, ...)   NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
    #define debugLog(...)
    #define debugMethod()
    #define debugError()
    #define DLog(...)
#endif

#define     LOADVC(string) [[NSClassFromString(string) alloc]initWithNibName:string bundle:nil];

#define     VCHeight     0
#define     TabbarHeight 80

#define     GaryColor         [UIColor colorWithRed:0.556863 green:0.556863 blue:0.576471 alpha:1];
#define     SYSTEM_FONT(A)    [UIFont systemFontOfSize:A]
#define     BOLD_FONT(A)      [UIFont boldSystemFontOfSize:A]

#define     FOUR_MAIN_BLUE    [UIColor colorWithHexString:@"55d481"]///主色调蓝
#define     FOUR_BLACK_1      [UIColor colorWithHexString:@"434a4c"]///cell标题
#define     FOUR_BLACK_2      [UIColor colorWithHexString:@"9da5a7"]///cell评论之类灰
#define     FOUR_BLACK_3      [UIColor colorWithHexString:@"4dffff"]///“发文字”颜色
#define     FOUR_CELL_LINE    [UIColor colorWithHexString:@"f1f5f8"]///cell评论之类灰
#define     FOUR_RED          RGB_COLOR(242, 115, 90, 1.f)          ///红色角标

#define     TIP_RES_CANCEL    @"对方已取消"
#define     TIP_RES_BUSY      (self.isLawyerCallBack==false?@"律师暂时忙，请稍后再试":@"用户暂时忙，请稍后再试")
#define     TIP_RES_REFUSE    @"对方已拒绝您的直连请求"
#define     TIP_PEER_TIMEOUT  @"对方手机可能不在身边，请稍后再试"
#define     TIP_NET_ERROR     @"网络不佳，请重新尝试"
#define     TIP_END           @"直连结束"

#define     perPageSize 20    //每页获取数据大小
#define     previewHeight 130 //预告栏高度

//当前用户id
#define     LoginUserID       ([RequestData getUserInfo].uId)
//当前用户是否存在
#define     LoginUserInfo     ([RequestData getUserInfo])

//通知name
#define kNetworkChangedNotification   @"kNetworkChangedNotification"



/**********程序配置End*********************/


/**********TICK Benin*********************/
#define     TICK            NSDate *startTime = [NSDate date];
#define     TOCK            DLog(@"Time: %f", -[startTime timeIntervalSinceNow]);
/**********TOCK Benin*********************/


/**********适配选项Begin*************/
///tabbar 配置宏
#define kTabbarHieght   kTabBarHeight//44.f

///判断当前型号是否是iPhoneX
#define IsiPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)

#define kStatusBarHeight [[UIApplication sharedApplication] statusBarFrame].size.height
#define kNavBarHeight 44.0
#define kTabBarHeight ([[UIApplication sharedApplication] statusBarFrame].size.height >20 ?83:49)
#define kTopHeight (kStatusBarHeight + kNavBarHeight)

//当前view距离底部父视图的距离
#define kBottomToSuperHeight ([[UIApplication sharedApplication] statusBarFrame].size.height >20 ?34:0)
#define kTopToSuperHeight ([[UIApplication sharedApplication] statusBarFrame].size.height >20 ?kStatusBarHeight:0)
//兼容xib顶到头后contentInset 修正当前问题
#define kTopContentInsetValue ([[UIApplication sharedApplication] statusBarFrame].size.height >20 ?kStatusBarHeight:kTopHeight)
/**********适配选项End*************/


