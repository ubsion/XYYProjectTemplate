//
//  ViewController.m
//  AskBrotherApp
//
//  Created by xuyong on 16/6/15.
//  Copyright © 2016年 xuyong. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()<NavBarViewDelegate>

@property (nonatomic, strong) UILabel *textLab;

@property (nonatomic,strong) UIButton *sendButton;

@end

@implementation ViewController

-(UILabel *)textLab {
    if (!_textLab) {
        _textLab = [[UILabel alloc]initWithFrame:CGRectZero];
        _textLab.textColor = [UIColor colorWithHexString:@"B7BFBF"];
        _textLab.textAlignment = NSTextAlignmentCenter;
        _textLab.font = [UIFont systemFontOfSize:14];
        _textLab.numberOfLines = 2;
    }
    return _textLab;
}

-(UIButton *)sendButton
{
    if (!_sendButton) {
        _sendButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH/3, 64)];
        [_sendButton setTitle:@"" forState:UIControlStateNormal];
        _sendButton.backgroundColor = [UIColor colorWithHexString:@"54D381"];
        _sendButton.layer.masksToBounds = true;
        _sendButton.layer.cornerRadius = 25;
        [_sendButton addTarget:self action:@selector(sendButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _sendButton;
}

-(void)sendButtonClick:(UIButton *)button
{
    [self sendButtonClick:button];
}

-(UIImageView *)defaultView
{
    if (!_defaultView) {
        _defaultView = [[UIImageView alloc]initWithFrame:(CGRect){(SCREEN_WIDTH-(420/2))/2.0,0,420/2,260/2}];//420/260
        _defaultView.image = [UIImage imageNamed:@"without_conent_default"];
    }
    return _defaultView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.isKeyboard = false;
//    self.navigationController.fd_viewControllerBasedNavigationBarAppearanceEnabled = false;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    self.view.backgroundColor = [UIColor whiteColor];
    //自己调用自己
    [self addSubviews];
}

-(void)viewDidLayoutSubviews
{
    [self setNavBarViewBar];
}

#pragma mark - UI
-(void)setNavBarViewBar {
    [self.navBarView setLeftWithTitle:@"navi_back" type:0];
    [self.navBarView setMiddleWithWithTitle:self.title type:1];

//    [self.navBarView setMiddleWithWithTitle:@"首页" type:1];
//    [self.navBarView setRightWithTitle:@"home_lanch_video" type:0];
}

#pragma mark - 导航栏代理
-(void)leftBtnClickByNavBarView:(SS_NavBarView *)navView {
    NSLog(@"leftBtnClickByNavBarView - click");
    [self.navigationController popViewControllerAnimated:YES];
}

//右边按钮被点击
-(void)rightBtnClickByNavBarView:(SS_NavBarView *)navView {
    NSLog(@"rightBtnClickByNavBarView - click");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - getter/setter

-(SS_NavBarView *)navBarView {
    if (!_navBarView) {
        _navBarView = [[SS_NavBarView alloc]initWithFrame:(CGRect){0,0,SCREEN_WIDTH, kTopHeight}];
        _navBarView.navDelegate = self;
        [self.view addSubview:_navBarView];
    }
    return _navBarView;
}


-(void)showDefultView:(CGFloat)top {
    top = top + 64;

    CGRect frame = self.defaultView.frame;
    frame.origin.y = top;
    self.defaultView.frame = frame;
    
    [self.view sendSubviewToBack:self.defaultView];
    _defaultView.image = [UIImage imageNamed:@"without_conent_default"];
}

-(void)hiddenDefultView {
    [self.defaultView removeFromSuperview];
    self.defaultView = nil;
}

-(void)checkData:(NSArray *)array top:(CGFloat)top view:(UIView *)view{
    if (array.count==0) {
        [self showDefultView:top];
        [view addSubview:_defaultView];
    }else {
        [self hiddenDefultView];
    }
}

-(void)checkData:(NSArray *)array top:(CGFloat)top view:(UIView *)view text:(NSString *)text{
    if (array.count==0) {
        [self showDefultView:top];
        [view addSubview:_defaultView];
        
        self.textLab.frame = (CGRect){0,self.defaultView.bottom,SCREEN_WIDTH,40};
        self.textLab.text = text;
        
        [view addSubview:self.textLab];
        
    }else {
        [self hiddenDefultView];
        
        [self.textLab removeFromSuperview];
        self.textLab = nil;
    }
}

-(void)checkData:(NSArray *)array top:(CGFloat)top view:(UIView *)view text:(NSString *)text button:(NSString *)buttonTitle{
    if (array.count==0) {
        [self showDefultView:top];
        [view addSubview:_defaultView];
        
        self.textLab.frame = (CGRect){0,self.defaultView.bottom,SCREEN_WIDTH,20};
        self.textLab.text = text;
        [view addSubview:self.textLab];
        
        [view addSubview:self.sendButton];
        CGFloat width = (SCREEN_WIDTH*3)/4 - 80;
        self.sendButton.frame = CGRectMake(SCREEN_WIDTH/2 - (width)/2,_textLab.szBottom + 20, width, 54);
        [_sendButton setTitle:buttonTitle forState:UIControlStateNormal];
        
    }else {
        [self hiddenDefultView];
        
        [self.textLab removeFromSuperview];
        self.textLab = nil;
        
        [self.sendButton removeFromSuperview];
        self.sendButton = nil;
        
    }
}

///另外一种，带有图片的
-(void)checkData1:(NSArray *)array top:(CGFloat)top view:(UIView *)view text:(NSString *)text{
    if (array.count==0) {
        [self showDefultView:top];
        _defaultView.image = [UIImage imageNamed:@"conent_without"];
        [view addSubview:_defaultView];
        
        //修正view的位置260/2
        self.defaultView.frame = CGRectMake(self.defaultView.origin.x, view.frame.size.height/2 -  260/2, self.defaultView.size.width, self.defaultView.size.height);
        
        self.textLab.frame = (CGRect){0,self.defaultView.bottom,SCREEN_WIDTH,40};
        self.textLab.text = text;
        
        [view addSubview:self.textLab];
        
    }else {
        [self hiddenDefultView];
        
        [self.textLab removeFromSuperview];
        self.textLab = nil;
    }
}

-(void)checkData1:(NSArray *)array top:(CGFloat)top view:(UIView *)view text:(NSString *)text button:(NSString *)buttonTitle{
    if (array.count==0) {
        [self showDefultView:top];
        _defaultView.image = [UIImage imageNamed:@"conent_without"];
        [view addSubview:_defaultView];
        
        //修正view的位置260/2
        self.defaultView.frame = CGRectMake(self.defaultView.origin.x, view.frame.size.height/2 -  260/2, self.defaultView.size.width, self.defaultView.size.height);
        
        self.textLab.frame = (CGRect){0,self.defaultView.bottom,SCREEN_WIDTH,20};
        self.textLab.text = text;
        [view addSubview:self.textLab];
        
        [view addSubview:self.sendButton];
        CGFloat width = (SCREEN_WIDTH*3)/4 - 80;
        self.sendButton.frame = CGRectMake(SCREEN_WIDTH/2 - (width)/2,_textLab.szBottom + 20, width, 54);
        [_sendButton setTitle:buttonTitle forState:UIControlStateNormal];
        
    }else {
        [self hiddenDefultView];
        
        [self.textLab removeFromSuperview];
        self.textLab = nil;
        
        [self.sendButton removeFromSuperview];
        self.sendButton = nil;
        
    }
}

-(void)checkData:(NSArray *)array top:(CGFloat)top view:(UIView *)view text:(NSString *)text button:(NSString *)buttonTitle imageName:(NSString *)imageName{
    if (array.count==0) {
        [self showDefultView:top];
        _defaultView.image = [UIImage imageNamed:imageName];
        [view addSubview:_defaultView];
        
        ///310 280
        CGFloat imageWidth = 310/2;
        //修正view的位置260/2
        self.defaultView.frame = CGRectMake(SCREEN_WIDTH/2 - imageWidth/2, view.frame.size.height/2 -  260/2, imageWidth, 280/2);
        
        self.textLab.frame = (CGRect){0,self.defaultView.bottom,SCREEN_WIDTH,20};
        self.textLab.text = text;
        [view addSubview:self.textLab];
        
        [view addSubview:self.sendButton];
        CGFloat width = (SCREEN_WIDTH*3)/4 - 80;
        self.sendButton.frame = CGRectMake(SCREEN_WIDTH/2 - (width)/2,_textLab.szBottom + 20, width, 54);
        [_sendButton setTitle:buttonTitle forState:UIControlStateNormal];
        
    }else {
        [self hiddenDefultView];
        
        [self.textLab removeFromSuperview];
        self.textLab = nil;
        
        [self.sendButton removeFromSuperview];
        self.sendButton = nil;
        
    }
}

-(void)checkWebData:(BOOL)isFailed top:(CGFloat)top view:(UIView *)view text:(NSString *)text button:(NSString *)buttonTitle imageName:(NSString *)imageName{
    if (isFailed) {
        [self showDefultView:top];
        _defaultView.image = [UIImage imageNamed:imageName];
        [view addSubview:_defaultView];
        
        ///310 280
        CGFloat imageWidth = 280/2;
        //修正view的位置260/2
        self.defaultView.frame = CGRectMake(SCREEN_WIDTH/2 - imageWidth/2, view.frame.size.height/2 -  260/2, imageWidth, imageWidth);
        
        self.textLab.frame = (CGRect){0,self.defaultView.bottom + 20,SCREEN_WIDTH,20};
        self.textLab.text = text;
        [view addSubview:self.textLab];
        
        [view addSubview:self.sendButton];
        CGFloat width = (SCREEN_WIDTH*3)/4 - 80;
        self.sendButton.frame = CGRectMake(SCREEN_WIDTH/2 - (width)/2,_textLab.szBottom + 20, width, 54);
        [_sendButton setTitle:buttonTitle forState:UIControlStateNormal];
        //
        _sendButton.backgroundColor = [UIColor whiteColor];
        [_sendButton setTitleColor:[UIColor colorWithHexString:@"B7BFBF"] forState:UIControlStateNormal];
        
    }else {
        [self hiddenDefultView];
        
        [self.textLab removeFromSuperview];
        self.textLab = nil;
        
        [self.sendButton removeFromSuperview];
        self.sendButton = nil;
        
    }
}



-(void)hiddenView{
    [self hiddenDefultView];
    
    [self.textLab removeFromSuperview];
    self.textLab = nil;
}

- (BOOL)shouldAutorotate {
    return self.isKeyboard;
}


- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskLandscapeRight;
}


//- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
//    return UIInterfaceOrientationPortrait;
//}


- (void)addActionTarget:(UIAlertController *)alertController title:(NSString *)title action:(void(^)(UIAlertAction *action))actionTarget
{
    UIAlertAction *action = [UIAlertAction actionWithTitle:title style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        actionTarget(action);
    }];
    [alertController addAction:action];
}

// 取消按钮
-(void)addCancelActionTarget:(UIAlertController*)alertController title:(NSString *)title
{
    UIAlertAction *action = [UIAlertAction actionWithTitle:title style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        
    }];
    [alertController addAction:action];
}

-(void)addCancelActionTarget:(UIAlertController*)alertController title:(NSString *)title action:(void(^)(UIAlertAction *action))actionTarget {
    UIAlertAction *action = [UIAlertAction actionWithTitle:title style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        actionTarget(action);
    }];
    [alertController addAction:action];
}

#pragma mark - ******* 添加当前页面UI *********
-(void)addSubviews
{
}

@end
