//
//  LZSoftVersion.m
//  PaPaWeiBo
//
//  Created by zhaoli on 16/3/6.
//  Copyright © 2016年 zhaoli. All rights reserved.
//

#import "LZSoftVersion.h"

@implementation LZSoftVersion
/**
 *  当前的软件版本
 */
+(NSString *)currentSoftVersion {
    NSString *versionKey = @"CFBundleVersion";
    return [[NSBundle mainBundle].infoDictionary objectForKey:versionKey];
}

/**
 *  沙盒中保存了上一次打开的软件版本
 */
+(NSString *)lastSotfVersion {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults objectForKey:@"CFBundleVersion"];;
}

/**
 *  保存当前的软件版本到沙盒
 */
+ (void) saveCurrentSoftVersion {
    NSString *current = [self currentSoftVersion];
    [[NSUserDefaults standardUserDefaults] setObject:current forKey:@"CFBundleVersion"];
}
@end
