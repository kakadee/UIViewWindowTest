//
//  ChildViewController.m
//  UIViewWindowDemo
//
//  Created by lijian on 2019/5/27.
//  Copyright © 2019 com.yaymedialabs. All rights reserved.
//

#import "ChildViewController.h"

@interface ChildViewController ()

@property (nonatomic, strong) UIButton *backButton;

@end

@implementation ChildViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    
    self.backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.backButton.frame = CGRectMake(50, 50, 100, 100);
    self.backButton.backgroundColor = [UIColor yellowColor];
    [self.backButton setTitle:@"返回" forState:UIControlStateNormal];
    
    [self.backButton addTarget:self action:@selector(backButtonAction) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.backButton];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"test---%@,selfWindow:%p,keyWindow:%p,delegateWindow:%p",@(__FUNCTION__),self.view.window,[UIApplication sharedApplication].keyWindow,[UIApplication sharedApplication].delegate.window);
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSLog(@"test---%@,selfWindow:%p,keyWindow:%p,delegateWindow:%p",@(__FUNCTION__),self.view.window,[UIApplication sharedApplication].keyWindow,[UIApplication sharedApplication].delegate.window);
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    NSLog(@"test---%@,selfWindow:%p,keyWindow:%p,delegateWindow:%p",@(__FUNCTION__),self.view.window,[UIApplication sharedApplication].keyWindow,[UIApplication sharedApplication].delegate.window);
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    NSLog(@"test---%@,selfWindow:%p,keyWindow:%p,delegateWindow:%p",@(__FUNCTION__),self.view.window,[UIApplication sharedApplication].keyWindow,[UIApplication sharedApplication].delegate.window);
}


- (void)backButtonAction {
    //    [self dismissViewControllerAnimated:YES completion:nil];
    if (self.backActionBlock) {
        self.backActionBlock();
    }
}

@end
