//
//  LZDorpDownMenu.h
//  PaPaWeiBo
//
//  Created by zhaoli on 16/3/6.
//  Copyright © 2016年 zhaoli. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LZDorpDownMenuDelegate <NSObject>

@optional
/*下拉菜单销毁调用*/
- (void)willDorpDownMenuDismiss;
@end


@interface LZDorpDownMenu : UIView
@property (nonatomic, weak) id <LZDorpDownMenuDelegate> delegate;
/**
 *  下拉菜单里面的内容的viw
 */
@property (nonatomic, strong) UIView *content;
/**
 *  向下拉菜单里面添加一个控制器
 */
@property (nonatomic, strong) UIViewController *contentController;

/**
 *  创建一个下拉菜单
 */
+ (instancetype) menu;

/**
 *  展示下拉菜单
 *
 *  @param from 下拉菜单的箭头指向的view
 */
- (void)showFrom:(UIView *)from;

/**
 *  销毁下拉菜单
 */
- (void)dismiss;
@end
