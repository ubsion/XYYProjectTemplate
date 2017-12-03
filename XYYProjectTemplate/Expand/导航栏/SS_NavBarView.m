//
//  SS_NavBarView.m
//  SchoolSociety
//
//  Created by xuyong on 16/6/20.
//  Copyright © 2016年 xuyong. All rights reserved.
//

#import "SS_NavBarView.h"

#import "UIButton+WebCache.h"

@interface SS_NavBarView ()

@property (nonatomic, strong) UIView *redPointView;



@end

@implementation SS_NavBarView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self){
        
        self.clipsToBounds = YES;
        self.rightEnable = YES;

        self.backImg = [[UIImageView alloc]initWithFrame:(CGRect){0,0,SCREEN_WIDTH,64}];
        self.backImg.image = [UIImage imageNamed:@"navBarback"];
        self.backImg.backgroundColor = FOUR_MAIN_BLUE;
        self.backImg.contentMode = UIViewContentModeScaleAspectFill;
        
        [self addSubview:self.backImg];
        
        [self.backImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self);
            make.top.mas_equalTo(self);
            make.bottom.mas_equalTo(self);
            make.right.mas_equalTo(self);
        }];
    }
    return self;
}

#pragma mark - 红点

-(UIView *)redPointView {
    if (!_redPointView) {
        _redPointView = [[UIView alloc]initWithFrame:(CGRect){self.szWidth-15,25,8,8}];
        _redPointView.backgroundColor = [UIColor redColor];
        _redPointView.layer.cornerRadius = 4;
        _redPointView.layer.masksToBounds = true;
        
        [self addSubview:_redPointView];
    }
    return _redPointView;
}

- (void)addRedPoint {
    [self redPointView];
}
- (void)removeRedPoint {
    [self.redPointView removeFromSuperview];
    self.redPointView = nil;
}

#pragma mark - getter/setter

-(void)setBackColor:(UIColor *)backgroundColor {
    self.backgroundColor = backgroundColor;
}

-(void)removeViewWithTag:(NSUInteger)tag {
    UIView *view = [self viewWithTag:tag];
    view.hidden = true;
    [view removeFromSuperview];
    view = nil;
}

///设置左侧按钮 0=图片  1=文字  2=网络图片
-(void)setLeftWithTitle:(NSString *)title type:(NSInteger)type {
    [self removeViewWithTag:10000];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.tag = 10000;
    
    if (type==0) {
        
        UIImage *image = [UIImage imageNamed:title];
        
        [btn setImage:image forState:UIControlStateNormal];
        btn.frame = (CGRect){0,kStatusBarHeight + 2,60,40};
        [btn.imageView setContentMode:UIViewContentModeScaleAspectFill];

    }else if (type==1) {
        btn.frame = (CGRect){15,kStatusBarHeight + (44-40)/2,60,40};
        
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
        [btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateDisabled];
        [btn setTitle:title forState:UIControlStateNormal];
        
    }else if (type==2) {
        btn.frame = (CGRect){0,kStatusBarHeight + (44-40)/2,60,40};
        btn.layer.cornerRadius = 5;
        btn.layer.masksToBounds = true;
        
        NSString *urlString = [title documentFullPath];
        [btn sd_setImageWithURL:[NSURL URLWithString:urlString] forState:UIControlStateNormal];
        [btn sd_setImageWithURL:[NSURL URLWithString:urlString] forState:UIControlStateHighlighted];
        [btn.imageView setContentMode:UIViewContentModeScaleAspectFill];
    }
    btn.exclusiveTouch = true;
    [btn addTarget:self action:@selector(tapLeft:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:btn];
    
    btn = nil;
}

///设置右侧按钮 0=图片  1=文字  2=网络图片
-(void)setRightWithTitle:(NSString *)title type:(NSInteger)type{
    [self removeViewWithTag:20000];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.tag = 20000;
    
    if (type==0) {
        UIImage *image = [UIImage imageNamed:title];
        
        btn.frame = (CGRect){SCREEN_WIDTH-40-10,kStatusBarHeight + 2,40,40};
        
        [btn setImage:image forState:UIControlStateNormal];
        
        [btn.imageView setContentMode:UIViewContentModeScaleAspectFill];
        
    }else if (type==1) {
        
        if (title.length>5) {
            btn.frame = (CGRect){SCREEN_WIDTH-95,kStatusBarHeight + (44-40)/2,90,40};
        }else {
            btn.frame = (CGRect){SCREEN_WIDTH-65,kStatusBarHeight + (44-40)/2,60,40};
        }
        
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
        [btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateDisabled];
        [btn setTitle:title forState:UIControlStateNormal];
        btn.titleLabel.font = SYSTEM_FONT(14.f);
    }else if (type==2) {
        btn.frame = (CGRect){SCREEN_WIDTH-40-10,kStatusBarHeight + (44-40)/2,40,40};
        btn.layer.cornerRadius = 5;
        btn.layer.masksToBounds = true;
        
        NSString *urlString = [title documentFullPath];
        [btn sd_setImageWithURL:[NSURL URLWithString:urlString] forState:UIControlStateNormal];
        [btn sd_setImageWithURL:[NSURL URLWithString:urlString] forState:UIControlStateHighlighted];
        [btn.imageView setContentMode:UIViewContentModeScaleAspectFill];
    }
    btn.exclusiveTouch = true;
    [btn addTarget:self action:@selector(tapRight:) forControlEvents:UIControlEventTouchUpInside];
    btn.enabled = self.rightEnable;
    [self addSubview:btn];
    
    btn = nil;
}

-(void)setWithTitle:(NSString *)title alpha:(CGFloat)alpha {
    [self removeViewWithTag:30323];
    UILabel *lab = [[UILabel alloc]initWithFrame:CGRectZero];
    lab.text = title.length>10?[NSString stringWithFormat:@"%@...",[title substringToIndex:10]]:title;
    lab.textColor = [UIColor whiteColor];
    lab.tag = 30323;
    lab.textAlignment = NSTextAlignmentCenter;
    lab.font = [UIFont systemFontOfSize:18];
    [lab sizeToFit];
    lab.frame = (CGRect){(SCREEN_WIDTH-lab.szWidth)/2,kStatusBarHeight + (44-lab.szHeight)/2,lab.szWidth,lab.szHeight};
    lab.alpha = alpha;
    [self addSubview:lab];
    lab = nil;
}
///设置标题 0=图片  1=文字  2=网络图片 3=logo
-(void)setMiddleWithWithTitle:(NSString *)title type:(NSInteger)type {
    [self removeViewWithTag:30000];
    [self removeViewWithTag:30001];
    [self removeViewWithTag:20001];
    
    if (type==0) {
        UIImage *image = [Utility getImgWithImageName:[NSString stringWithFormat:@"%@@2x",title]];

        UIImageView *img = [[UIImageView alloc]initWithFrame:(CGRect){(SCREEN_WIDTH-image.size.width)/2,kStatusBarHeight + (44-image.size.height)/2,image.size.width,image.size.height}];
        img.image = image;
        img.tag = 30000;
        [self addSubview:img];
        img = nil;
    }else if (type==1) {
        UILabel *lab = [[UILabel alloc]initWithFrame:CGRectZero];
        lab.text = title;
        lab.textColor = [UIColor whiteColor];
        lab.tag = 20001;
        lab.textAlignment = NSTextAlignmentCenter;
        lab.font = BOLD_FONT(16.f);
        [lab sizeToFit];
        lab.frame = (CGRect){80,kStatusBarHeight + (44-lab.szHeight)/2,SCREEN_WIDTH-160,lab.szHeight};
        
        [self addSubview:lab];
        lab = nil;
    }else if (type==3) {
        UIImage *logoImg = [Utility getImgWithImageName:@"logoprojection@2x"];
        UIImageView *logoImgView = [[UIImageView alloc]initWithFrame:(CGRect){(SCREEN_WIDTH-logoImg.size.width)/2,64-logoImg.size.height,logoImg.size.width,logoImg.size.height}];
        logoImgView.image = logoImg;
        logoImgView.tag = 30001;
        [self addSubview:logoImgView];
        logoImgView = nil;
        
        UIImage *image = [Utility getImgWithImageName:[NSString stringWithFormat:@"%@@2x",title]];
        
        UIImageView *img = [[UIImageView alloc]initWithFrame:(CGRect){(SCREEN_WIDTH-image.size.width)/2,kStatusBarHeight + (44-image.size.height)/2,image.size.width,image.size.height}];
        img.image = image;
        img.tag = 30000;
        [self addSubview:img];
        img = nil;
    }
}


-(void)setIsReding:(BOOL)isReding {
    _isReding = isReding;
    
    if (isReding) {
        [self addRedPoint];
    }else {
        [self removeRedPoint];
    }
}

-(void)setRightEnable:(BOOL)rightEnable {
    _rightEnable = rightEnable;
    
    UIButton *btn = (UIButton *)[self viewWithTag:20000];
    btn.enabled = rightEnable;
}

-(UIButton *)navBarRightButton
{
    return (UIButton *)[self viewWithTag:20000];
}

#pragma mark - action

-(void)tapLeft:(id)sender {
    if (self.navDelegate && [self.navDelegate respondsToSelector:@selector(leftBtnClickByNavBarView:)]) {
        [self.navDelegate leftBtnClickByNavBarView:self];
    }
}

-(void)tapRight:(id)sender {
    if (self.navDelegate && [self.navDelegate respondsToSelector:@selector(rightBtnClickByNavBarView:)]) {
        [self.navDelegate rightBtnClickByNavBarView:self];
    }
}
@end
