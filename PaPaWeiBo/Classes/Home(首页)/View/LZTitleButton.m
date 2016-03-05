//
//  LZTitleButton.m
//  PaPaWeiBo
//
//  Created by zhaoli on 16/3/5.
//  Copyright © 2016年 zhaoli. All rights reserved.
//

#import "LZTitleButton.h"

@implementation LZTitleButton

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.imageView.contentMode = UIViewContentModeCenter;
        self.titleLabel.textAlignment = NSTextAlignmentRight;
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.titleLabel.font = LZNavigationTitleFont;
        self.adjustsImageWhenHighlighted = NO;
    }
    return self;
}



/** 重新计算 imageRect titleRect,实现对button内部的title和image的子控件做镜像*/
/**
 *  对计算好的titleRect做镜像
 */
- (CGRect)titleRectForContentRect:(CGRect)contentRect{

    CGRect back = [super titleRectForContentRect:contentRect];
    CGFloat newX = contentRect.size.width - back.origin.x - back.size.width;
    back.origin.x = newX - 2;
    return back;
}
/**
 *  对计算好的mageRect做镜像
 */
- (CGRect)imageRectForContentRect:(CGRect)contentRect{
    CGRect back = [super imageRectForContentRect:contentRect];
    CGFloat newX = contentRect.size.width - back.origin.x - back.size.width;
    back.origin.x = newX + 2;
    return back;
}

@end
