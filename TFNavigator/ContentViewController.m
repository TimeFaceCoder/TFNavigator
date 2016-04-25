//
//  ContentViewController.m
//  TFNavigator
//
//  Created by Melvin on 4/1/16.
//  Copyright © 2016 TimeFace. All rights reserved.
//

#import "ContentViewController.h"

@implementation ContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"close" style:UIBarButtonItemStyleDone target:self action:@selector(closeAction)];
}

- (void)closeAction {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
