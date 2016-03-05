//
//  UIImage+Extension.h
//  PaPaWeiBo
//
//  Created by zhaoli on 16/2/28.
//  Copyright © 2016年 zhaoli. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extension)
 
+ (UIImage *) imageWithName:(NSString *)name ;

/**
 *  拉伸的方式创建一张图片
 */
+ (UIImage *) resizeImageWithName:(NSString *)name ;
@end
