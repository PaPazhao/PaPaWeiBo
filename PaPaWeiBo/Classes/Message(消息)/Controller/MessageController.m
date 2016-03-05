//
//  MessageController.m
//  PaPaWeiBo
//
//  Created by zhaoli on 16/2/28.
//  Copyright © 2016年 zhaoli. All rights reserved.
//

#import "MessageController.h"

@implementation MessageController
-(void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"写私信" style:UIBarButtonItemStyleDone target:self action:@selector(composeMsg)];
    self.navigationItem.rightBarButtonItem.enabled = NO;
}


- (void)composeMsg {
    LZLogFunc();
}

@end
