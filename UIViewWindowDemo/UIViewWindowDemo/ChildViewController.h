//
//  ChildViewController.h
//  UIViewWindowDemo
//
//  Created by lijian on 2019/5/27.
//  Copyright © 2019 com.yaymedialabs. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ChildViewController : UIViewController

@property (nonatomic, copy) void (^backActionBlock)(void);

@end

NS_ASSUME_NONNULL_END
