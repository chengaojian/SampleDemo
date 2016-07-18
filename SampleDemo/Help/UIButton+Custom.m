//
//  UIButton+Custom.m
//  SampleDemo
//
//  Created by 三海 on 16/7/16.
//  Copyright © 2016年 三海. All rights reserved.
//

#import "UIButton+Custom.h"

@implementation UIButton (Custom)

- (instancetype)initWithTitle:(NSString *)title andTitleColor:(UIColor *)titlecolor andBackgroundColor:(UIColor *)backgroundColor andFont:(UIFont *)fontSize{

    if ([super init]) {
        
        [self setTitle:title forState:UIControlStateNormal];
        [self setTitleColor:titlecolor forState:UIControlStateNormal];
        [self setBackgroundColor:backgroundColor];
        [self.titleLabel setFont:fontSize];
    }

    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
