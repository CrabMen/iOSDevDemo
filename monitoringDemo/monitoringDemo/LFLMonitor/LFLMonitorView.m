//
//  LFLMonitorView.m
//  monitoringDemo
//
//  Created by DragonLi on 2017/11/20.
//  Copyright © 2017年 XiTu Inc. All rights reserved.
//

#import "LFLMonitorView.h"

@implementation LFLMonitorView

+ (void)startMonitorcompletion:(void (^ __nullable)(LFLMonitorView *))completion{
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat WHYValue = 128;  // y value  > 88 
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        completion([[self alloc]initWithFrame:CGRectMake( screenWidth - 250, WHYValue, WHYValue, WHYValue)]);
    });
}
- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor grayColor];
        self.windowLevel = UIWindowLevelAlert + 1;  // + 2 ,显示级别高于系统的弹框
        [self makeKeyAndVisible];
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = frame.size.width / 2;
    }
    
    return self;
}

@end
