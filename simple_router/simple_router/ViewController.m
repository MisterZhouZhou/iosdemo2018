//
//  ViewController.m
//  simple_router
//
//  Created by zhouwei on 2018/8/9.
//  Copyright © 2018年 zhouwei. All rights reserved.
//

#import "ViewController.h"
#import "OHGRouter.h"
#import "ModuleA.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    id <ModuleA> obj = [[OHGRouter router] interfaceForProtocol: @protocol(ModuleA)];
//    id<ModuleA> obj = [[OHGRouter router] interfaceForURL:[NSURL URLWithString:@"ModuleA://?name=xiaobaitu"]];
    obj.name = @"小白兔";
    obj.callback = ^(id params) {
        NSLog(@"%@", params);
    };
    [self presentViewController:obj.serverBody animated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
