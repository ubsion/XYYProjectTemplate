//
//  UITextView+XYYTextView.m
//  AskBrotherApp
//
//  Created by xuyong on 16/12/15.
//  Copyright © 2016年 李昀. All rights reserved.
//

#import "UITextView+XYYTextViewKit.h"
#import "XYYMacro.h"
#import <objc/runtime.h>

static NSInteger const maxLimitNum = 1000;

@implementation UITextView (XYYTextViewKit)
@dynamic  limiteNumber;
static char limiteNumberKey;

@dynamic placeholderText;
static char placeholderTextKey;

@dynamic readayPlaceholderText;
static char readayPlaceholderTextkey;

-(UITextView *)textViewPlaceholderText:(NSString *)placeholderText
                              fontSize:(CGFloat)fontSize
                             textColor:(UIColor *)textColor
                      placeholderColor:(UIColor *)placeholderColor
{
    //输入框
//    UITextView *conentTextView = [[UITextView alloc] init];
    self.delegate = self;
    self.font = [UIFont systemFontOfSize:fontSize];
    self.textColor = textColor;
    self.backgroundColor = [UIColor whiteColor];
    //placeholder
    UILabel *placeholderTextLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 8, SCREEN_WIDTH - 50, 20)];
    placeholderTextLabel.text = placeholderText;
    placeholderTextLabel.textColor = placeholderColor;//[UIColor colorWithHexString:@"a5bec9"];//[self colorWithHexString:@"B8CAD6"];
    placeholderTextLabel.font = [UIFont systemFontOfSize:fontSize];
    self.placeholderText = placeholderText;
    [self addSubview:placeholderTextLabel];
    return self;
}

#pragma mark - setter/getter
-(NSInteger)limiteNumber
{
    return [(NSNumber *)objc_getAssociatedObject(self, &limiteNumberKey) integerValue];
}

-(void)setLimiteNumber:(NSInteger)limiteNumber
{
    objc_setAssociatedObject(self, &limiteNumberKey, @(limiteNumber), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(NSString *)placeholderText
{
    return objc_getAssociatedObject(self, &placeholderTextKey);
}

-(void)setPlaceholderText:(NSString *)placeholderText
{
    objc_setAssociatedObject(self, &placeholderTextKey, placeholderText, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


-(NSString *)readayPlaceholderText
{
    return objc_getAssociatedObject(self, &readayPlaceholderTextkey);

}

-(void)setReadayPlaceholderText:(NSString *)readayPlaceholderText
{
    objc_setAssociatedObject(self, &readayPlaceholderTextkey, readayPlaceholderText, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    NSInteger limit = self.limiteNumber;
    if (limit == 0) {
        limit = maxLimitNum;
    }
    
    if (self.text.length > limit) {
        self.text = [self.text substringToIndex:limit];
    }
    
    
    NSArray *subviews = self.subviews;
    UILabel *placeholderTextLabel;
    for (NSObject *obj in subviews) {
        if ([obj isKindOfClass:[UILabel class]]) {
            placeholderTextLabel = (UILabel *)obj;
            break;
        }
    }
    
    if (![self.text isEqualToString:@""]) {
        placeholderTextLabel.text = @"";
    }else{
        placeholderTextLabel.text = self.placeholderText;
    }

    
}


#pragma mark - UITextViewDelegate
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if ([text isEqualToString:@"\n"]){ //判断输入的字是否是回车，即按下return
        [textView resignFirstResponder];
        return NO;
    }
    
    NSInteger limit = self.limiteNumber;
    if (limit == 0) {
        limit = maxLimitNum;
    }
    
    if (range.location < limit)
    {
        return  YES;
    }
    else
    {
        return NO;
    }
    return true;
}

- (void)textViewDidChange:(UITextView *)textView
{
    if (textView == self) {
        
        NSInteger limit = self.limiteNumber;
        if (limit == 0) {
            limit = maxLimitNum;
        }
        
        if (textView.text.length > limit) {
            textView.text = [textView.text substringToIndex:limit];
        }
    }
    
    NSArray *subviews = textView.subviews;
    UILabel *placeholderTextLabel;
    for (NSObject *obj in subviews) {
        if ([obj isKindOfClass:[UILabel class]]) {
            placeholderTextLabel = (UILabel *)obj;
            break;
        }
    }
    
    if (![textView.text isEqualToString:@""]) {
        placeholderTextLabel.text = @"";
    }else{
        placeholderTextLabel.text = self.placeholderText;
    }
    
}

/**
 @method 获取指定宽度width的字符串在UITextView上的高度
 @param textView 待计算的UITextView
 @param Width 限制字符串显示区域的宽度
 @result float 返回的高度
 */
+ (float) heightForString:(UITextView *)textView andWidth:(float)width{
    CGSize sizeToFit = [textView sizeThatFits:CGSizeMake(width, MAXFLOAT)];
    return sizeToFit.height;
}



@end
