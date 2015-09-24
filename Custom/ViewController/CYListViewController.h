//
//  CYListViewController.h
//  LUSIR
//
//  Created by longyuan on 15/9/11.
//  Copyright (c) 2015年 L. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CYListViewController : UIViewController

@property (nonatomic, strong) UITableView *contentTable;

@property (nonatomic, strong) UIView *contentView;

@property (nonatomic, assign) NSInteger totalCount;
@property (nonatomic, assign) NSInteger pageLimitCount;

@property (nonatomic, assign) BOOL hasNextPage;

#pragma mark - view Load and refresh

- (void)loadSubViews;

- (void)loadNavigationBar;

#pragma mark - data Load and reset

- (void)refreshMethod;

- (void)loadMoreMethod;

@end
