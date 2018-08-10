//
//  ModuleASI.m
//  simple_router
//
//  Created by zhouwei on 2018/8/10.
//  Copyright © 2018年 zhouwei. All rights reserved.
//

#import "ModuleASI.h"
#import "ModuleAViewController.h"

@implementation ModuleASI

@synthesize callback;
@synthesize name;
@synthesize serverBody;

- (UIViewController *)serverBody {
    if(!serverBody){
        serverBody = [ModuleAViewController new];
        ((ModuleAViewController *)serverBody).interface = self;
    }
    return serverBody;
}


@end
