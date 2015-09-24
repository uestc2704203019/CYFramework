//
//  CYViewController.h
//  LUSIR
//
//  Created by longyuan on 15/9/11.
//  Copyright (c) 2015年 L. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CYViewController : UIViewController

@property (nonatomic, strong) UIView *contentView;

- (void)loadSubViews;

- (void)loadNavigationBar;

@end
