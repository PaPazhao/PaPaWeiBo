//
//  LZNewFeatureController.m
//  PaPaWeiBo
//
//  Created by zhaoli on 16/3/6.
//  Copyright © 2016年 zhaoli. All rights reserved.
//

#import "LZNewFeatureController.h"

#import "LZTabBarController.h"
#define imageViewCount  4

@interface LZNewFeatureController () <UIScrollViewDelegate>
@property (nonatomic, weak) UIScrollView *scrollView;
@property (nonatomic, weak) UIPageControl *pageControl;
@end

@implementation LZNewFeatureController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupScrollView];
    [self setupPageControl];
}

#pragma mark scrollview method
/**
 *  设置scrollview
 */
- (void)setupScrollView {
    UIScrollView *scrollView = [[UIScrollView alloc]init];
    scrollView.frame = self.view.bounds;
    scrollView.delegate = self;
    scrollView.pagingEnabled = YES;
    scrollView.bounces = NO;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.contentSize = CGSizeMake(ScreenWidth * imageViewCount, ScreenHeigh);
    [self.view addSubview:scrollView];
    self.scrollView = scrollView ;
    [self addImageView];
}

/**
 *  添加四张图片到scrollview
 */
-(void) addImageView {

    for (int index = 0; index < imageViewCount; index++) {
        UIImageView *imageView = [[UIImageView alloc]init];
        imageView.frame = CGRectMake(index * ScreenWidth, 0, ScreenWidth, ScreenHeigh);
        imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"new_feature_%d",index+1]];
        [self.scrollView addSubview:imageView];
        if (index == 3) {
            [self setupStartAppButtonTo:imageView];
            imageView.userInteractionEnabled = YES;
        }
    }
}

#pragma mark pageControll method
/**
 *  设置 pageController
 */
- (void)setupPageControl {
    UIPageControl *pageControl = [[UIPageControl alloc]init];
    pageControl.width = 100;
    pageControl.height = 30;
    pageControl.centerX = ScreenWidth * 0.5;
    pageControl.centerY = ScreenHeigh * 0.9;
    pageControl.numberOfPages = imageViewCount;
    pageControl.currentPage = 0;
    pageControl.pageIndicatorTintColor = [UIColor grayColor];
    pageControl.currentPageIndicatorTintColor = [UIColor redColor];
    [self.view addSubview:pageControl];
    self.pageControl = pageControl;
}

#pragma mark add setup Start App Button
- (void)setupStartAppButtonTo:(UIView *)view {
    UIButton *startBtn = [[UIButton alloc]init];
    [startBtn setBackgroundImage:[UIImage imageNamed:@"new_feature_finish_button"] forState:UIControlStateNormal];
    [startBtn setBackgroundImage:[UIImage imageNamed:@"new_feature_finish_button_highlighted"] forState:UIControlStateHighlighted];
    startBtn.size = startBtn.currentBackgroundImage.size;
    startBtn.centerX = ScreenWidth * 0.5;
    startBtn.centerY = ScreenHeigh * 0.8;
    [startBtn setTitle:@"启动微博" forState:UIControlStateNormal];
    startBtn.titleLabel.font = [UIFont boldSystemFontOfSize:16];
    [startBtn addTarget:self action:@selector(startAppBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:startBtn];
}

- (void)startAppBtnClick {
    LZLog(@"%s",__func__);
    UIWindow *win = [UIApplication sharedApplication].keyWindow;
    win.rootViewController = [[LZTabBarController alloc]init];
    [win makeKeyAndVisible];
}

#pragma mark scrollview delegate method
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    self.pageControl.currentPage = (NSInteger)((scrollView.contentOffset.x / ScreenWidth) + 0.5);
}



@end
