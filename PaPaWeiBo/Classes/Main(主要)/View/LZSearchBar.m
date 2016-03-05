//
//  LZSearchBar.m
//  PaPaWeiBo
//
//  Created by zhaoli on 16/3/5.
//  Copyright © 2016年 zhaoli. All rights reserved.
//

#import "LZSearchBar.h"

@implementation LZSearchBar

+(instancetype)searchBar {
    return [[LZSearchBar alloc]init];
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // 设置背景图片
        self.background = [UIImage resizeImageWithName:@"searchbar_textfield_background"];
        // 设置内容 -- 垂直居中
        self.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        self.font = [UIFont systemFontOfSize:12];
        self.clearButtonMode = UITextFieldViewModeAlways;
        
        // 设置左边的放大镜
        UIImageView *letfView = [[UIImageView alloc]init];
        letfView.image = [UIImage imageNamed:@"searchbar_textfield_search_icon"];
        letfView.height = letfView.image.size.height;
        letfView.width = letfView.image.size.width + 10;
        letfView.contentMode = UIViewContentModeCenter;


        self.leftView = letfView;
        self.leftViewMode = UITextFieldViewModeAlways;
    }
    return self;
}
@end
