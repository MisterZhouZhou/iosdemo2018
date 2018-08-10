//
//  MoudleProtocol.h
//  simple_router
//
//  Created by zhouwei on 2018/8/9.
//  Copyright © 2018年 zhouwei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#ifndef MoudleProtocol_ServerInterface
#define MoudleProtocol_ServerInterface @"SI"
#endif

@protocol BaseModule <NSObject>

@required
// server body
@property(nonatomic, strong) __kindof UIViewController *serverBody;

@optional
// callback
@property(nonatomic, copy) void (^callback) (id params);

@end



