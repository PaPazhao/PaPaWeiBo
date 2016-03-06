//
//  LZDorpDownMenu.m
//  PaPaWeiBo
//
//  Created by zhaoli on 16/3/6.
//  Copyright © 2016年 zhaoli. All rights reserved.
//

#import "LZDorpDownMenu.h"

@interface LZDorpDownMenu ()
/**
 *  将来用来显示具体内容的容器
 */
@property (nonatomic, weak) UIImageView *containerView;
@end

@implementation LZDorpDownMenu

#pragma mark 外部方法
/**
 *  创建一个下拉菜单
 */
+ (instancetype) menu {
    return [[LZDorpDownMenu alloc]init];
}

/**
 *  展示下拉菜单
 *
 *  @param from 下拉菜单的箭头指向的view
 */
- (void)showFrom:(UIView *)from {
    // 获得当前最上方的window
    UIWindow *win = [[UIApplication sharedApplication].windows lastObject];
    
    // 转换from view的坐标系到 window 的坐标系
    CGRect fromRect = [from convertRect:from.bounds toView:win];
    
    self.containerView.centerX = CGRectGetMidX(fromRect);
    self.containerView.y = CGRectGetMaxY(fromRect);

    [win addSubview:self];
    
    self.size = win.bounds.size;
}

/**
 *  销毁下拉菜单
 */
- (void)dismiss {
    if ([self.delegate respondsToSelector:@selector(willDorpDownMenuDismiss)]) {
        [self.delegate willDorpDownMenuDismiss];
    }
    [self removeFromSuperview];
}


#pragma mark 初始化方法
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3];
    }
    return self;
}

#pragma mark 属性方法
/**
 *  设置下拉菜单显示的内容
 */
- (void)setContent:(UIView *)content {
    _content = content;
    
    content.x = 8;
    content.y = 15;

    self.containerView.width = content.width + 2 * content.x;
    self.containerView.height = content.height + 2 * content.y - 4;
    
    [self.containerView addSubview:content];
}

- (void)setContentController:(UIViewController *)contentController {
    _contentController = contentController;
    self.content = contentController.view;
}

/**
 *  下拉菜单里面灰色的容器
 */
- (UIImageView *)containerView {
    if (_containerView == nil) {
        UIImageView *containerView = [[UIImageView alloc]init];
        containerView.userInteractionEnabled = YES;
        containerView.image = [UIImage imageNamed:@"popover_background"];
        [self addSubview:containerView];
        self.containerView = containerView;
    }
    return _containerView;
}

#pragma mark 代理方法
/**
 *  触摸蒙版，自动取消菜单
 */
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self dismiss];
}
@end
