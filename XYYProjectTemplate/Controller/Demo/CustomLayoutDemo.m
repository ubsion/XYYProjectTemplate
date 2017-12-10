//
//  CustomLayoutDemo.m
//  XYYProjectTemplate
//
//  Created by xuyong on 2017/12/9.
//  Copyright © 2017年 xuyong. All rights reserved.
//

#import "CustomLayoutDemo.h"

@interface CustomLayoutDemo ()

@property (nonatomic,strong) UIView *blackView;

@property (nonatomic,strong) UIView *yellowView;

@property (nonatomic,strong) UIView *redView;

@property (nonatomic,strong) YYLabel *conentLabel;
@property (nonatomic,strong) YYLayoutModel *contentTextLayoutModel;

@end

@implementation CustomLayoutDemo

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"CustomLayoutDemo";

    
    [self addUISubviews];
}

-(void)addUISubviews
{
    _blackView = [UIView new];
    _blackView.backgroundColor = [UIColor whiteColor];
    _blackView.layer.masksToBounds = YES;
    _blackView.layer.borderWidth = 1;
    _blackView.layer.borderColor = [UIColor blackColor].CGColor;
    [self.view addSubview:_blackView];
    
//    _yellowView = [UIView new];
//    _yellowView.backgroundColor = [UIColor yellowColor];
//    [_blackView addSubview:_yellowView];
//
//    _redView = [UIView new];
//    _redView.backgroundColor = [UIColor redColor];
//    [_blackView addSubview:_redView];
    
//    _conentLabel = [YYLabel new];
//    _conentLabel.backgroundColor = [UIColor blackColor];
//    _conentLabel.font = [UIFont systemFontOfSize:15];
//    _conentLabel.lineBreakMode = NSLineBreakByCharWrapping;
//    _conentLabel.textColor = [UIColor lightGrayColor];
//    _conentLabel.numberOfLines = 0;
//    _conentLabel.preferredMaxLayoutWidth = SCREEN_WIDTH - 20;
//    _conentLabel.text = @"当我们在某个类的内部调整子视图位置时，需要调用。反过来的意思就是说：如果你想要在外部设置的位置，就不要重写。)反过来的意思就是说：如果你想要在外部设置的位置，就不要重写。反过来的意思就是说：如果你想要在外部设置的位置，就不要重写。反过来的意思就是说：如果你想要在外部设置的位置，就不要重写。反过来的意思就是说：如果你想要在外部设置的位置，就不要重写。反过来的意思就是说：如果你想要在外部设置的位置，就不要重写。反过来的意思就是说：如果你想要在外部设置的位置，就不要重写。反过来的意思就是说：如果你想要在外部设置的位置，就不要重写。反过来的意思就是说：如果你想要在外部设置的位置，就不要重写。~~~~~这个是结尾哦，那个高度好像不对.I means that you are my best friend,and I need you pershare with us , we can't deal with it without you,please.";
//    [_blackView addSubview:_conentLabel];
    
    _conentLabel = [YYLabel new];
    _conentLabel.backgroundColor = [UIColor blackColor];
    _conentLabel.displaysAsynchronously = YES;
    [_blackView addSubview:_conentLabel];
    NSString *string = @"当我们在某个类的内部调整子视图位置时，需要调用。反过来的意思就是说：如果你想要在外部设置的位置，就不要重写。)反过来的意思就是说：如果你想要在外部设置的位置，就不要重写。反过来的意思就是说：如果你想要在外部设置的位置，就不要重写。反过来的意思就是说：如果你想要在外部设置的位置，就不要重写。反过来的意思就是说：如果你想要在外部设置的位置，就不要重写。反过来的意思就是说：如果你想要在外部设置的位置，就不要重写。反过来的意思就是说：如果你想要在外部设置的位置，就不要重写。反过来的意思就是说：如果你想要在外部设置的位置，就不要重写。反过来的意思就是说：如果你想要在外部设置的位置，就不要重写。~~~~~这个是结尾哦，那个高度好像不对.I means that you are my best friend,and I need you pershare with us , we can't deal with it without you,please.";
    _contentTextLayoutModel = [UIView layoutYYTextLabelLayout:string
                                 preferredMaxLayoutWidth:(SCREEN_WIDTH -20)
                                           textAlignment:NSTextAlignmentLeft
                                           lineBreakMode:NSLineBreakByCharWrapping
                                                fontSize:16
                                               textColor:[UIColor lightGrayColor]];
}



-(void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    //1.水平布局
//    [_blackView sizeWith:CGSizeMake(SCREEN_WIDTH, SCREEN_WIDTH/2)];
//    [_blackView layoutParentVerticalCenter];
//    [_blackView alignParentTopWithMargin:kTopHeight];
//
//    [_blackView alignSubviewsHorizontallyWithPadding:10 margin:10];

    //2.先定大小，再定位置
//    [_blackView sizeWith:CGSizeMake(SCREEN_WIDTH, 100)];
//    [_blackView alignParentTopWithMargin:kTopHeight + 44];
//    [_blackView alignParentLeftWithMargin:0];
//
//    CGRect rect = self.blackView.bounds;
//    rect = CGRectInset(rect, 0, 0);
//    [_blackView alignSubviews:@[_redView,_yellowView] horizontallyWithPadding:10 margin:10 inRect:rect];

    //3.YYLabel初步使用
//    [_blackView sizeWith:CGSizeMake(SCREEN_WIDTH, 400)];
//    [_blackView alignParentTopWithMargin:kTopHeight + 44];
//    [_blackView alignParentLeftWithMargin:0];
//
//    [_redView sizeWith:CGSizeMake(44, 44)];
//    [_redView alignParentTopWithMargin:10];
//    [_redView alignParentLeftWithMargin:10];
//
//    [_yellowView sizeWith:CGSizeMake(44, 44)];
//    [_yellowView layoutToRightOf:_redView margin:10];
//    [_yellowView alignVerticalCenterOf:_redView];
//
//    [_conentLabel sizeWith:CGSizeMake(SCREEN_WIDTH - 20, [_conentLabel layoutWithContainerSizeHeight:SCREEN_WIDTH - 20 text:_conentLabel.text])];
//    [_conentLabel alignLeft:_redView];
//    [_conentLabel layoutBelow:_redView margin:10];
    
    //4.YY布局新方式
    [_blackView sizeWith:CGSizeMake(SCREEN_WIDTH, 400)];
    [_blackView alignParentTopWithMargin:kTopHeight + 44];
    [_blackView alignParentLeftWithMargin:0];
    
    [_conentLabel sizeWith:CGSizeMake(SCREEN_WIDTH - 20, _contentTextLayoutModel.textLayoutHeight)];
    [_conentLabel alignParentTopWithMargin:10];
    [_conentLabel alignParentLeftWithMargin:10];
    _conentLabel.textLayout = _contentTextLayoutModel.textLayout;
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
