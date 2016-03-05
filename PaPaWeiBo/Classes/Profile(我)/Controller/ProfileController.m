//
//  ProfileController.m
//  PaPaWeiBo
//
//  Created by zhaoli on 16/2/28.
//  Copyright © 2016年 zhaoli. All rights reserved.
//

#import "ProfileController.h"

@implementation ProfileController
-(void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItem =
                [[UIBarButtonItem alloc]initWithTitle:@"设置"
                                                style:UIBarButtonItemStyleDone
                                               target:nil action:nil];

}
@end
