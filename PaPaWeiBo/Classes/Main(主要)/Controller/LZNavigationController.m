//
//  LZNavigationController.m
//  PaPaWeiBo
//
//  Created by zhaoli on 16/3/2.
//  Copyright © 2016年 zhaoli. All rights reserved.
//

#import "LZNavigationController.h"

@implementation LZNavigationController

+(void)initialize {
    // 设置 NavigationBar 的样式
    [self setupNavigationBarTheme];
    
    // 设置 UIBarButton 的样式
    [self setupUIBarButtonTheme];
}

// 设置 NavigationBar 的样式
+ (void)setupNavigationBarTheme {
    UINavigationBar *appearance = [UINavigationBar appearance];
    
    if (iOS6) {
        [appearance setBackgroundImage:[UIImage imageNamed:@"navigationbar_background"] forBarMetrics:UIBarMetricsDefault];
    }
    
    NSMutableDictionary *textAttr = [NSMutableDictionary dictionary];
    textAttr[NSFontAttributeName] = [UIFont boldSystemFontOfSize:20];
    textAttr[UITextAttributeTextShadowOffset] = [NSValue valueWithUIOffset:UIOffsetZero];// 取消阴影效果，在ios6中有阴影的效果
    [appearance setTitleTextAttributes:textAttr];
}

/**
 *  设置整个项目 UIBarButton 的样式
 *  通过 appearance 对象能修改整个项目中所有的 UIBarButton的样式
 */
+ (void)setupUIBarButtonTheme {

    UIBarButtonItem *appearance = [UIBarButtonItem appearance];
    
    /** 设置文字的样式 */
    NSMutableDictionary *textAttr = [NSMutableDictionary dictionary];
    textAttr[NSFontAttributeName] = [UIFont systemFontOfSize:15];
    textAttr[NSForegroundColorAttributeName] = [UIColor orangeColor];
    textAttr[UITextAttributeTextShadowOffset] = [NSValue valueWithUIOffset:UIOffsetZero];
    [appearance setTitleTextAttributes:textAttr forState:UIControlStateNormal];
    
    NSMutableDictionary *highTextAttr = [NSMutableDictionary dictionaryWithDictionary:textAttr];
    highTextAttr[NSForegroundColorAttributeName] = [UIColor blackColor];
    [appearance setTitleTextAttributes:highTextAttr forState:UIControlStateHighlighted];
    
    NSMutableDictionary *disableTextAttr = [NSMutableDictionary dictionaryWithDictionary:textAttr];
    disableTextAttr[NSForegroundColorAttributeName] = [UIColor lightGrayColor];
    [appearance setTitleTextAttributes:disableTextAttr forState:UIControlStateDisabled];
     
    /** 设置背景的图片 */
    // 为了让某个按钮的背景消失，设置一直完全透明的背景图片
    [appearance setBackgroundImage:[UIImage imageNamed:@"navigationbar_button_background"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
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
