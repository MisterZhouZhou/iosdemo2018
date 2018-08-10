//
//  ModuleA.h
//  simple_router
//
//  Created by zhouwei on 2018/8/10.
//  Copyright © 2018年 zhouwei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MoudleProtocol.h"

@protocol ModuleA <BaseModule>

@required
// input 作为组件A的入参 可以自定义任意属性
@property(nonatomic, strong) NSString *name;

@end
