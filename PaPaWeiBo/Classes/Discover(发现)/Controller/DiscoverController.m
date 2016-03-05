//
//  DiscoverController.m
//  PaPaWeiBo
//
//  Created by zhaoli on 16/2/28.
//  Copyright © 2016年 zhaoli. All rights reserved.
//

#import "DiscoverController.h"

@implementation DiscoverController
- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.rightBarButtonItem =
    [[UIBarButtonItem alloc]initWithTitle:@"发现"
                                    style:UIBarButtonItemStylePlain
                                   target:self
                                   action:@selector(find)];
    self.navigationItem.rightBarButtonItem.enabled = NO;
}

- (void)find {
    NSLog(@"%s",__func__);
}

@end
