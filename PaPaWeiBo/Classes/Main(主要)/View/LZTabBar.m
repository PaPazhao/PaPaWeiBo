//
//  LZTabBar.m
//  PaPaWeiBo
//
//  Created by zhaoli on 16/3/6.
//  Copyright © 2016年 zhaoli. All rights reserved.
//

#import "LZTabBar.h"

@interface LZTabBar ()
@property (nonatomic, weak) UIButton *plusButton;
@end

@implementation LZTabBar

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        LZLog(@"%@",self.delegate);
        UIButton *plusButton = [[UIButton alloc]init];
        [plusButton setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button"] forState:UIControlStateNormal];
        [plusButton setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button_highlighted"] forState:UIControlStateHighlighted];
        
        [plusButton setImage:[UIImage imageNamed:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
        [plusButton setImage:[UIImage imageNamed:@"tabbar_compose_icon_add_highlighted"] forState:UIControlStateHighlighted];
        plusButton.size = plusButton.currentBackgroundImage.size;
        [plusButton addTarget:self action:@selector(plusButtonClicked) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:plusButton];
        self.plusButton = plusButton;
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat itemW = self.width / 5;

    // 计算 TabBarButton 的位置
    NSInteger itemsIndex = 0;
    for (UIView *itemView in self.subviews) {
        if (![itemView isKindOfClass:NSClassFromString(@"UITabBarButton")]) continue;
        itemView.width = itemW;
        itemView.x = itemsIndex * itemW;
        itemsIndex++;
        if (itemsIndex == 2) {
            itemsIndex++;
        }
    }
    
    // 计算 plusButton 的位置
    self.plusButton.centerX = self.width * 0.5;
    self.plusButton.centerY = self.height * 0.5;
}

- (void)plusButtonClicked {
    if ([self.delegate respondsToSelector:@selector(tabBarDidClickPlusButton)]) {
        [self.delegate tabBarDidClickPlusButton];
    }
}
@end
