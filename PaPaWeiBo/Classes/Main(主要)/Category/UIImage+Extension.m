//
//  UIImage+Extension.m
//  PaPaWeiBo
//
//  Created by zhaoli on 16/2/28.
//  Copyright © 2016年 zhaoli. All rights reserved.
//

#import "UIImage+Extension.h"

#define iOS7 ([[UIDevice currentDevice].systemVersion floatValue] >= 7.0)
@implementation UIImage (Extension)
+ (UIImage *) imageWithName:(NSString *)name {
    
    
    NSString *newName = name;
    if (iOS7) {
        newName = [newName stringByAppendingString:@"_OS7"];
    }
    
    UIImage *image = [UIImage imageNamed:newName];
    
    if (image == nil) {
        image = [UIImage imageNamed:name];
    }
    
    return image;
}

/**
 *  拉伸的方式创建一张图片
 */
+ (UIImage *)resizeImageWithName:(NSString *)name {
    UIImage *image = [self imageNamed:name];
    
    return [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
}
@end
