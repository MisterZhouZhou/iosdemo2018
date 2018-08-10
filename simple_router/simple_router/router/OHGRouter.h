//
//  OHGRouter.h
//  simple_router
//
//  Created by zhouwei on 2018/8/9.
//  Copyright © 2018年 zhouwei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface OHGRouter : NSObject

+ (instancetype) router;
/**
 请确保组件遵守组件对应的协议，并创建对应的接口类
 */
- (id) interfaceForProtocol:(Protocol *) p;
- (id) interfaceForURL:(NSURL *) url;

// for unit test
- (void) assertForMoudleWithProtocol:(Protocol *) p;
- (void) assertForMoudleWithURL:(NSURL *) url;

// navi type for vc
// push present
- (UIViewController *) findVcOfView:(UIView *) view;


@end
