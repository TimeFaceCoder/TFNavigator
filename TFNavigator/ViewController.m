//
//  ViewController.m
//  TFNavigator
//
//  Created by Melvin on 3/31/16.
//  Copyright © 2016 TimeFace. All rights reserved.
//

#import "ViewController.h"
#import "TFNavigator.h"
#import "TFNavigator/TFURLAction.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(100, 100, CGRectGetWidth(self.view.bounds) - 200, 50);
    button.backgroundColor = [UIColor lightGrayColor];
    [button setTitle:@"open url" forState:UIControlStateNormal];
    [self.view addSubview:button];
    
    [button addTarget:self action:@selector(onViewClick:) forControlEvents:UIControlEventTouchUpInside];
    
//    TFOpenURL(@"/content/12", @{});
//    
//    TFURLAction *action = [TFURLAction actionWithURLPath:@"/content/" userInfo:@{}];
//    
//    [[TFNavigator sharedNavigator] openURLAction:action];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)onViewClick:(id)sender {
//    TFOpenURL(@"alipay://", @{@"userID":@"21212"});
    
    TFURLAction *action = [TFURLAction actionWithURLPath:@"/content/" userInfo:nil];
    action.presentModel = YES;
    [[TFNavigator sharedNavigator] openURLAction:action];
}

@end
