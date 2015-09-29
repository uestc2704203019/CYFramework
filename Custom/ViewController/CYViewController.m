//
//  CYViewController.m
//  LUSIR
//
//  Created by longyuan on 15/9/11.
//  Copyright (c) 2015年 L. All rights reserved.
//

#import "CYViewController.h"


@interface CYViewController () <UIGestureRecognizerDelegate>
{
    
}
@end

@implementation CYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationController.interactivePopGestureRecognizer.delegate = self;
    
    [self loadContentView];
    [self loadSubViews];
    [self loadNavigationBar];
}

- (void)loadSubViews
{
    
}

- (void)loadNavigationBar
{
    [self createNavigationBar];
}

- (void)createNavigationBar
{
    if (_navigationBar!=nil) {
        return;
    }
    CYNavigationBar *navigationBar = [[CYNavigationBar alloc] init];
    navigationBar.frame = CGRectMake(0, 0, kScreenWidth, kNavigationBarHeight);
    navigationBar.navigationController = self.navigationController;
    [self.view addSubview:navigationBar];
    
    _navigationBar = navigationBar;
}

- (void)setNavigationBar:(CYNavigationBar *)navigationBar
{
    _navigationBar = navigationBar;
    self.navigationBarHidden = NO;
}

- (void)setNavigationBarHidden:(BOOL)navigationBarHidden
{
    [self createNavigationBar];
    _navigationBar.hidden = navigationBarHidden;
}

- (void)setTitle:(NSString *)title
{
    [super setTitle:title];
    [self createNavigationBar];
    _navigationBar.title = title;
}

- (void)loadContentView
{
    CGRect baseFrame = self.view.bounds;
    
    UIView *baseView = [[UIView alloc] init];
    baseView.frame = baseFrame;
    [self.view addSubview:baseView];
    
    _contentView = baseView;
}

#pragma mark - 网络数据获取
- (void)loadData
{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
