//
//  ViewController.m
//  semaphoreDemo
//
//  Created by zhouwei on 2018/8/10.
//  Copyright © 2018年 zhouwei. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSLog(@"%@", [NSThread currentThread]);
    
    dispatch_semaphore_t signal = dispatch_semaphore_create(1);
    __block long x = 0;
    dispatch_sync(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        sleep(1);
        NSLog(@"waiting");
        //此时信号量为0 对signal增加1 信号量变为1，
        x = dispatch_semaphore_signal(signal);
        NSLog(@"1_x:%ld",x);
        
        sleep(2);
        NSLog(@"waking");
        
        x = dispatch_semaphore_signal(signal);
        NSLog(@"2_x:%ld",x);
    });
    //此时信号量为1 所以执行下边，对signal减掉1，然后信号量为0
    x = dispatch_semaphore_wait(signal, DISPATCH_TIME_FOREVER);
    NSLog(@"3_x:%ld",x);
    
    //此时信号量为0，永远等待，在等待的时候执行block了，在等待block时候block内对信号量增加了1，然后开始执行下边，并且信号量再次减掉1 变为0
    x = dispatch_semaphore_wait(signal, DISPATCH_TIME_FOREVER);
    NSLog(@"wait 2");
    NSLog(@"4_x:%ld",x);
    
    //此时信号量为0，永远等待，在等待的时候执行block了，在等待block时候block内对信号量增加了1，然后开始执行下边，并且信号量再次减掉1 变为0
    x = dispatch_semaphore_wait(signal, DISPATCH_TIME_FOREVER);
    
    NSLog(@"wait 3");
    NSLog(@"5_x:%ld",x);
    
    sleep(2);
    
    x = dispatch_semaphore_signal(signal);
    NSLog(@"6_x:%ld",x);
    
}

- (void)demo2
{
    // 创建队列组
    dispatch_group_t group = dispatch_group_create();
    
    // 创建信号量，并且设置值为10
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(10);
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    for (int i = 0; i < 100; i++)
    {
        // 由于是异步执行的，所以每次循环Block里面的dispatch_semaphore_signal根本还没有执行就会执行dispatch_semaphore_wait，
        //从而semaphore-1.当循环10次后，semaphore等于0，则会阻塞线程，直到执行了Block的dispatch_semaphore_signal 才会继续执行
        NSInteger value = dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
        NSLog(@"1_%ld",value);
        
        dispatch_group_async(group, queue, ^{
            NSLog(@"%i",i);
            sleep(3);
            // 每次发送信号则semaphore会+1，
            NSInteger value = dispatch_semaphore_signal(semaphore);
            NSLog(@"2_%ld",value);
        });
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
