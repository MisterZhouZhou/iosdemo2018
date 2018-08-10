//
//  ModuleAViewController.m
//  simple_router
//
//  Created by zhouwei on 2018/8/10.
//  Copyright © 2018年 zhouwei. All rights reserved.
//

#import "ModuleAViewController.h"

@interface ModuleAViewController ()

@end

@implementation ModuleAViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self initUI];
}

- (void)initUI {
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(30, 50, 200, 40)];
    label.text = self.interface.name;
    label.textColor = [UIColor blueColor];
    [self.view addSubview:label];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    !self.interface.callback ?: self.interface.callback(@"我没了");
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
