//
//  UIBarButtonItem+Extention.h
//  PaPaWeiBo
//
//  Created by zhaoli on 16/3/2.
//  Copyright © 2016年 zhaoli. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extention)
/**
 *  自定义 UIBarButtonItem
 *
 *  @param imageName     button背景图片的Normal
 *  @param highImageName button背景图片的Highlighted
 *  @param target        button点击执行的目标
 *  @param action        button点击执行的方法
 *
 *  @return <#return value description#>
 */
+ (UIBarButtonItem *)itemButtonWithImageName:(NSString *)imageName
                               highImageName:(NSString *)highImageName
                                      target:(id)target
                                      action:(SEL)action ;
@end
