//
//  LFLMonitorView.h
//  monitoringDemo
//
//  Created by DragonLi on 2017/11/20.
//  Copyright © 2017年 XiTu Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LFLMonitorView : UIWindow


/**
 creat a monitorView,after 3sec
 */
+ (void)startMonitorcompletion:(void (^ __nullable)(LFLMonitorView *))completion;

@end
