//
//  HomeController.m
//  PaPaWeiBo
//
//  Created by zhaoli on 16/2/28.
//  Copyright © 2016年 zhaoli. All rights reserved.
//

#import "HomeController.h"
#import "LZTitleButton.h"
#import "LZDorpDownMenu.h"

@interface HomeController () <LZDorpDownMenuDelegate>

@end

@implementation HomeController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupNavigationItem];
    
    //设置导航栏的标题button
    [self setupNavigationTitleView];
}


#pragma mark 设置导航栏的内容
/**
 *  设置导航栏的标题button
 */
- (void)setupNavigationTitleView {
    LZTitleButton *titleView = [[LZTitleButton alloc]init];
    titleView.width = 100;
    titleView.height = 30;
    [titleView setTitle:@"首页" forState:UIControlStateNormal];
    [titleView setImage:[UIImage imageNamed:@"navigationbar_arrow_down"] forState:UIControlStateNormal];
    [titleView addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.titleView = titleView;
}

- (void)buttonClick:(UIButton *)button {
    [button setImage:[UIImage imageNamed:@"navigationbar_arrow_up"] forState:UIControlStateNormal];
    
    LZDorpDownMenu *menu = [LZDorpDownMenu menu];
    menu.delegate = self;
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 100, 200)];
    [btn setTitle:@"haha" forState:UIControlStateHighlighted];
    menu.content = btn;
    [menu showFrom:button];
}

- (void)willDorpDownMenuDismiss {
    LZTitleButton *titleBtn = (LZTitleButton *)self.navigationItem.titleView;
    
    [titleBtn setImage:[UIImage imageNamed:@"navigationbar_arrow_down"] forState:UIControlStateNormal];
}

/**
 *  设置导航栏的 leftBarButtonItem，letbarButtonItem
 */
- (void)setupNavigationItem {
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
