//
//  CostomDemo.m
//  XYYProjectTemplate
//
//  Created by xuyong on 2017/12/16.
//  Copyright © 2017年 xuyong. All rights reserved.
//

#import "CostomDemo.h"

@interface CostomDemo ()

@end

@implementation CostomDemo

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)addSubviews
{
    
    
    
    AlertHelp *help = [AlertHelp alertWith:@"title" message:@"the messgae" funBtns:@{} cancelBtn:@"取消" alertStyle:UIAlertControllerStyleAlert cancelAction:^(UIAlertAction * _Nonnull action) {
        
    }];
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
