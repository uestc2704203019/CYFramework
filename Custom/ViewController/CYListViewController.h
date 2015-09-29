//
//  CYListViewController.h
//  LUSIR
//
//  Created by longyuan on 15/9/11.
//  Copyright (c) 2015年 L. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CYViewController.h"
#import "CYNavigationBar.h"

@interface CYListViewController : CYViewController

@property (nonatomic, strong) UITableView *contentTable;

@property (nonatomic, assign) NSInteger totalCount;
@property (nonatomic, assign) NSInteger pageLimitCount;

@property (nonatomic, assign) BOOL hasNextPage;

#pragma mark - data Load and reset

- (void)refreshMethod;

- (void)loadMoreMethod;

@end
