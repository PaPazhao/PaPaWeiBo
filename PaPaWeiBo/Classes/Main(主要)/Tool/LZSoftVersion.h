//
//  LZSoftVersion.h
//  PaPaWeiBo
//
//  Created by zhaoli on 16/3/6.
//  Copyright © 2016年 zhaoli. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LZSoftVersion : NSObject
/**
 *  当前的软件版本
 */
+(NSString *)currentSoftVersion;

/**
 *  沙盒中保存了上一次打开的软件版本
 */
+(NSString *)lastSotfVersion;

/**
 *  保存当前的软件版本到沙盒
 */
+ (void) saveCurrentSoftVersion;
@end
