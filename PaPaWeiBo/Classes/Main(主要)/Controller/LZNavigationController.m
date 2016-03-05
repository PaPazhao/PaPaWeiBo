//
//  LZNavigationController.m
//  PaPaWeiBo
//
//  Created by zhaoli on 16/3/2.
//  Copyright © 2016年 zhaoli. All rights reserved.
//

#import "LZNavigationController.h"

@implementation LZNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];

    // 设置整个项目 UIBarButton 的样式
    [self setupUIBarButtonStyle];
}

/**
 *  设置整个项目 UIBarButton 的样式
 *  通过 appearance 对象能修改整个项目中所有的 UIBarButton的样式
 */
- (void)setupUIBarButtonStyle {

    UIBarButtonItem *appearance = [UIBarButtonItem appearance];
    
    NSMutableDictionary *textAttr = [NSMutableDictionary dictionary];
    textAttr[NSFontAttributeName] = [UIFont systemFontOfSize:15];
    textAttr[NSForegroundColorAttributeName] = [UIColor orangeColor];
    [appearance setTitleTextAttributes:textAttr forState:UIControlStateNormal];
    
    NSMutableDictionary *highTextAttr = [NSMutableDictionary dictionary];
    highTextAttr[NSForegroundColorAttributeName] = [UIColor blackColor];
    [appearance setTitleTextAttributes:highTextAttr forState:UIControlStateHighlighted];
    
    NSMutableDictionary *disableTextAttr = [NSMutableDictionary dictionary];
    disableTextAttr[NSForegroundColorAttributeName] = [UIColor lightGrayColor];
    [appearance setTitleTextAttributes:disableTextAttr forState:UIControlStateDisabled];
}

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
