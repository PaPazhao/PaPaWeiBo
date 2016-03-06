//
//  LZTabBarController.m
//  PaPaWeiBo
//
//  Created by zhaoli on 16/2/28.
//  Copyright © 2016年 zhaoli. All rights reserved.
//

#import "LZTabBarController.h"
#import "UIImage+Extension.h"
#import "ProfileController.h"
#import "HomeController.h"
#import "DiscoverController.h"
#import "MessageController.h"
#import "LZNavigationController.h"
#import <objc/runtime.h>
#import "LZTabBar.h"
@interface LZTabBarController () <UITabBarControllerDelegate>

@end

//    objc_setAssociatedObject


@implementation LZTabBarController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    // 添加所有的自控制器
    [self addAllChildController];
    
    // 设置自定义的TabBar，更换掉系统自带的tabBar
    [self setupCustomTabBar];
}

/**
 *  设置自定义的TabBar，更换掉系统自带的tabBar
 */
- (void) setupCustomTabBar {
    LZTabBar *customTabBar = [[LZTabBar alloc]init];
    customTabBar.backgroundImage = [UIImage imageNamed:@"tabbar_background"];
    customTabBar.selectionIndicatorImage = [UIImage imageNamed:@"navigationbar_button_background"];
    [self setValue:customTabBar forKeyPath:@"tabBar"];
}

/**
 *  添加所有的自控制器
 */
- (void) addAllChildController {
    HomeController *home = [[HomeController alloc]init];
    [self addChildViewController:home titleName:@"首页"
                       imageName:@"tabbar_home"
                    selectedName:@"tabbar_home_selected"];
    
    DiscoverController *discover = [[DiscoverController alloc]init];
    [self addChildViewController:discover titleName:@"发现"
                       imageName:@"tabbar_discover"
                    selectedName:@"tabbar_discover_selected"];
    
    MessageController *message = [[MessageController alloc]init];
    [self addChildViewController:message titleName:@"消息"
                       imageName:@"tabbar_message_center"
                    selectedName:@"tabbar_message_center_selected"];
    
    ProfileController *profile = [[ProfileController alloc]init];
    [self addChildViewController:profile titleName:@"我"
                       imageName:@"tabbar_profile"
                    selectedName:@"tabbar_profile_selected"];
}

- (void) addChildViewController:(UIViewController *)childController
                      titleName:(NSString *)title
                      imageName:(NSString *)imageName
                   selectedName:(NSString *)selectedName{
    
    
#warning 这句代码过早的调用控制器的view，导致了控制器一创建，控制器的view就立即进行创建。
    //如果过早的创建view导致先创建view，然后再调用导航appearance的设置全局的字体导致这个方法不起作用
//    childController.view.backgroundColor = LZRamomColor;

    // 设置导航标题和tabbar的标题，这一句代码等效下面两行
    childController.title = title;
//    childController.navigationItem.title = title;   // 设置导航条的标题
//    childController.tabBarItem.title = title;       // 设置tabBar的标题

    childController.tabBarItem.selectedImage = [self originalImageWithName:selectedName];
    childController.tabBarItem.image = [self originalImageWithName:imageName];
    
    NSMutableDictionary *selectedTextAttrs = [NSMutableDictionary dictionary];
    selectedTextAttrs[NSForegroundColorAttributeName] = [UIColor orangeColor];
    [childController.tabBarItem setTitleTextAttributes:selectedTextAttrs forState:UIControlStateSelected];

    self.view.backgroundColor = [UIColor redColor];
 
    // 为每个控制器套一层导航控制器
    LZNavigationController *nav = [[LZNavigationController alloc]initWithRootViewController:childController];
    [self addChildViewController:nav];
}

- (UIImage *) originalImageWithName:(NSString *)name {
    UIImage *image = [UIImage imageWithName:name];
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    return image;
}

/**
 *  自定义TabBar的 PlusButton点击事件的代理（注意，控制器并没有设置tabBar的代理依然能执行这个方法，说明在tabbar内部自动设置了控制器成为其代理）
 */
- (void)tabBarDidClickPlusButton {
    UIViewController *vc1 = [[UIViewController alloc]init];
    vc1.view.backgroundColor = LZRamomColor;
    LZNavigationController *nav = [[LZNavigationController alloc]initWithRootViewController:vc1];
    [self presentViewController:nav animated:YES completion:nil];
    LZLogFunc();
}
@end
