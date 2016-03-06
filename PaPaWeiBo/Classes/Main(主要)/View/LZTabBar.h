//
//  LZTabBar.h
//  PaPaWeiBo
//
//  Created by zhaoli on 16/3/6.
//  Copyright © 2016年 zhaoli. All rights reserved.
//

#import <UIKit/UIKit.h>
#warning 因为 LZTabBar继承自UITabBar，所以作为LZTab的代理，继承自原有类的代理
@protocol LZTabBarDelegate <UITabBarDelegate>

@optional
- (void)tabBarDidClickPlusButton;
@end

@interface LZTabBar : UITabBar
@property (nonatomic, weak) id <LZTabBarDelegate> delegate;
@end
