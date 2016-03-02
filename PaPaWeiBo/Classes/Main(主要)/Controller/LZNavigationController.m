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
 *
 *  @param viewController <#viewController description#>
 *  @param animated       <#animated description#>
 */
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {

    // 当push新的控制器，隐藏底部的tabBar
    if(self.childViewControllers.count) {
        viewController.hidesBottomBarWhenPushed = YES;
    }

    [super pushViewController:viewController animated:animated];
}



@end
