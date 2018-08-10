//
//  ModuleAViewController.h
//  simple_router
//
//  Created by zhouwei on 2018/8/10.
//  Copyright © 2018年 zhouwei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModuleA.h"

@interface ModuleAViewController : UIViewController

@property(nonatomic, strong) id <ModuleA> interface;

@end
