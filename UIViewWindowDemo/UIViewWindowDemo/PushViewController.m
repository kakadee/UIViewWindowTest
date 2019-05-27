//
//  PushViewController.m
//  UIViewWindowDemo
//
//  Created by lijian on 2019/5/27.
//  Copyright © 2019 com.yaymedialabs. All rights reserved.
//

#import "PushViewController.h"

@interface PushViewController ()

@end

@implementation PushViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blueColor];
    NSLog(@"test---%@,selfWindow:%p,keyWindow:%p,delegateWindow:%p",@(__FUNCTION__),self.view.window,[UIApplication sharedApplication].keyWindow,[UIApplication sharedApplication].delegate.window);
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


@end
