//
//  MainViewController.m
//  UIViewWindowDemo
//
//  Created by lijian on 2019/5/27.
//  Copyright © 2019 com.yaymedialabs. All rights reserved.
//

#import "MainViewController.h"
#import "PushViewController.h"
#import "PresentViewController.h"
#import "ChildViewController.h"

@interface MainViewController () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation MainViewController

#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCellReuseID"];
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

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCellReuseID" forIndexPath:indexPath];
    if (indexPath.row == 0) {
        cell.textLabel.text = @"push 一个控制器";
    } else if (indexPath.row == 1) {
        cell.textLabel.text = @"present 一个控制器";
    } else if (indexPath.row == 2) {
        cell.textLabel.text = @"添加一个子控制器";
    }
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0) {
        NSLog(@"###################test--- push 一个控制器");
        PushViewController *pushVC = [[PushViewController alloc] init];
        [self.navigationController pushViewController:pushVC animated:YES];
    } else if (indexPath.row == 1) {
        NSLog(@"##################test--- present 一个控制器");
        PresentViewController *presentVC = [[PresentViewController alloc] init];
        [self presentViewController:presentVC animated:YES completion:nil];
        __weak __typeof(self)weakSelf = self;
        presentVC.backActionBlock = ^{
            [weakSelf dismissViewControllerAnimated:YES completion:nil];
        };
    } else if (indexPath.row == 2) {
        NSLog(@"###################test--- 添加一个子控制器");
        ChildViewController *childVC = [[ChildViewController alloc] init];
        [self addChildViewController:childVC];
        [self.view addSubview:childVC.view];
        __weak __typeof(childVC)weakChildVC = childVC;
        childVC.backActionBlock = ^{
            [weakChildVC removeFromParentViewController];
            [weakChildVC.view removeFromSuperview];
        };
    }
}

#pragma mark - Private Methods

@end
