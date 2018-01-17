//
//  ViewController.m
//  InterviewExampleCode
//
//  Created by DragonLi on 2018/1/15.
//  Copyright © 2018年 XiTu Inc. All rights reserved.
//

#import "ViewController.h"
#import "LFLConstInlineHeader.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    LFLImagePlaceholder()
    
//    [self dispatch_queue_tDemo];
//    [self dispatch_semaphore_tDemo];
}



/**
 保持线程同步
 */
- (void)dispatch_queue_tDemo{
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    
    __block int j = 0;
    dispatch_async(queue, ^{  //
        j = 100;
        dispatch_semaphore_signal(semaphore);
    });
    
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    NSLog(@"%zd", j);

}

/**
 为线程加锁
 */
- (void)dispatch_semaphore_tDemo{
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(1);
    
    for (int i = 0; i < 100; i++) {
        dispatch_async(queue, ^{
            // 加锁
            dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
            NSLog(@"i = %zd %@", i, semaphore);
            // 解锁
            dispatch_semaphore_signal(semaphore);
        });
    }
    
}




@end
