//
//  CYViewController.h
//  LUSIR
//
//  Created by longyuan on 15/9/11.
//  Copyright (c) 2015年 L. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CYNavigationBar.h"

@interface CYViewController : UIViewController

@property (nonatomic, strong) CYNavigationBar *navigationBar;
@property (nonatomic, assign) BOOL navigationBarHidden;

@property (nonatomic, strong) UIView *contentView;

#pragma mark - view manager
- (void)loadSubViews;

- (void)loadNavigationBar;

#pragma mark - data get
- (void)loadData;

@end
