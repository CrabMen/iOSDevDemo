//
//  ViewController.m
//  KVO_Demo
//
//  Created by DragonLi on 2018/4/6.
//  Copyright © 2018年 DragonLi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}


/**
 NSKeyValueObservingOptionNew = 0x01, 返回新值
 NSKeyValueObservingOptionOld = 0x02,
 NSKeyValueObservingOptionInitial  在注册的时候发送一条通知,再改变的时候也会发送通知
 NSKeyValueObservingOptionPrior  改变之前,之后都会发送通知
 */
- (void)kvoDemoOne{
    [self addObserver:self.view forKeyPath:@"backgroundColor" options:0 context:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
