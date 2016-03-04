//
//  LZNavigationController.m
//  PaPaWeiBo
//
//  Created by zhaoli on 16/3/2.
//  Copyright © 2016年 zhaoli. All rights reserved.
//

#import "LZNavigationController.h"

@implementation LZNavigationController

/**
 *  拦截所有的 push 的控制，在这里设置所有的当push的时候处理的操作
 */
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {

    // 当push新的控制器，隐藏底部的tabBar
    if(self.childViewControllers.count) {
        viewController.hidesBottomBarWhenPushed = YES;
        
        // 通过拦截导航控制器的 push 操作，为所有的 push后的控制器统一的增加返回和更多的功能
        viewController.navigationItem.leftBarButtonItem =
        [UIBarButtonItem itemButtonWithImageName:@"navigationbar_back"
                                   highImageName:@"navigationbar_back_highlighted"
                                          target:self
                                          action:@selector(back)];
        
        viewController.navigationItem.rightBarButtonItem =
        [UIBarButtonItem itemButtonWithImageName:@"navigationbar_more"
                                   highImageName:@"navigationbar_more_highlighted"
                                          target:self
                                          action:@selector(pop)];
    }

    [super pushViewController:viewController animated:animated];
}

/**
 *  返回
 */
- (void)back {
    [self popToRootViewControllerAnimated:YES];
}
/**
 *  回到栈顶
 */
- (void)pop {
    [self popViewControllerAnimated:YES];
}

@end
