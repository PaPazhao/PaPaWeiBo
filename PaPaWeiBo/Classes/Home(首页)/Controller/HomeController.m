//
//  HomeController.m
//  PaPaWeiBo
//
//  Created by zhaoli on 16/2/28.
//  Copyright © 2016年 zhaoli. All rights reserved.
//

#import "HomeController.h"


@implementation HomeController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 添加导航栏左边的 letbarButtonItem
    self.navigationItem.leftBarButtonItem =
    [UIBarButtonItem itemButtonWithImageName:@"navigationbar_friendsearch"
                               highImageName:@"navigationbar_friendsearch_highlighted"
                                      target:self action:@selector(friendsearch)];
    // 添加导航栏右边边的 letbarButtonItem
    self.navigationItem.rightBarButtonItem =
    [UIBarButtonItem itemButtonWithImageName:@"navigationbar_pop"
                               highImageName:@"navigationbar_pop_highlighted"
                                      target:self action:@selector(pop)];
    
    UITextField *textField = [[UITextField alloc] init];
    textField.backgroundColor = [UIColor redColor];
    textField.frame = CGRectMake(100, 100, 100, 30);
    textField.inputAccessoryView = [[[NSBundle mainBundle] loadNibNamed:@"KeyboardTool" owner:nil options:nil] lastObject];
    [self.view addSubview:textField];

}

- (void)friendsearch {
    LZLog(@"friendsearch");
}

- (void)pop {
    LZLog(@"pop");
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ID"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"ID"];
    }
    
    cell.detailTextLabel.text = [NSString stringWithFormat:@"测试数据 -- %ld",indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    TwoViewController *vc = [[TwoViewController alloc]init];
//    vc.hidesBottomBarWhenPushed = YES;
//    vc.view.backgroundColor = [UIColor redColor];
//    [self.navigationController pushViewController:vc animated:YES];
}
@end
