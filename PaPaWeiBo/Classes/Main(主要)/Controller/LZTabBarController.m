//
//  LZTabBarController.m
//  PaPaWeiBo
//
//  Created by zhaoli on 16/2/28.
//  Copyright © 2016年 zhaoli. All rights reserved.
//

#import "LZTabBarController.h"
#import "UIImage+Extension.h"
@interface LZTabBarController ()

@end

@implementation LZTabBarController

- (void)viewDidLoad {
    [super viewDidLoad]; 
    
    UIViewController *home = [[UIViewController alloc]init];
    [self addChildViewController:home titleName:@"首页"
                       imageName:@"tabbar_home"
                    selectedName:@"tabbar_home_selected"];
    
    UIViewController *discover = [[UIViewController alloc]init];
    [self addChildViewController:discover titleName:@"发现"
                       imageName:@"tabbar_discover"
                    selectedName:@"tabbar_discover_selected"];
    
    UIViewController *message = [[UIViewController alloc]init];
    [self addChildViewController:message titleName:@"消息"
                       imageName:@"tabbar_message_center"
                    selectedName:@"tabbar_message_center_selected"];
    
    
    UIViewController *profile = [[UIViewController alloc]init];
    [self addChildViewController:profile titleName:@"我"
                       imageName:@"tabbar_profile"
                    selectedName:@"tabbar_profile_selected"];

}


- (void) addChildViewController:(UIViewController *)childController
                      titleName:(NSString *)title
                      imageName:(NSString *)imageName
                   selectedName:(NSString *)selectedName{

    childController.tabBarItem.title = title;
    childController.tabBarItem.selectedImage = [self originalImageWithName:selectedName];
    childController.tabBarItem.image = [self originalImageWithName:imageName];
    self.view.backgroundColor = [UIColor redColor];
    [self addChildViewController:childController];
}


- (UIImage *) originalImageWithName:(NSString *)name {
    UIImage *image = [UIImage imageWithName:name];
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    return image;
}

@end
