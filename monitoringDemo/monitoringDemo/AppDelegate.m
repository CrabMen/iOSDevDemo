//
//  AppDelegate.m
//  monitoringDemo
//
//  Created by DragonLi on 2017/11/17.
//  Copyright © 2017年 XiTu Inc. All rights reserved.
//

#import "AppDelegate.h"
#import "LFLMonitorView.h"

@interface AppDelegate ()

@property (nonatomic, strong) LFLMonitorView *monitorView;

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    __weak typeof(self) ws=self;
    [LFLMonitorView startMonitorcompletion:^(LFLMonitorView *mon) {
        ws.monitorView = mon;
    }];
    return YES;
}

@end
