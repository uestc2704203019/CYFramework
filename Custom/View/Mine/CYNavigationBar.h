//
//  CYNavigationBar.h
//  SmartWatch
//
//  Created by chai on 15/9/26.
//  Copyright © 2015年 chai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CYNavigationBar : UINavigationBar

@property (nonatomic, assign) BOOL showBackItem;

@property (nonatomic, strong) UINavigationItem *navigationItem;

@property (nonatomic, strong) UINavigationController *navigationController;

@property (nonatomic, strong) UIBarButtonItem *leftItem;
@property (nonatomic, strong) NSArray *leftItems;
@property (nonatomic, strong) UIView *titleView;
@property (nonatomic, strong) UIBarButtonItem *rightItem;
@property (nonatomic, strong) NSArray *rightItems;

@property (nonatomic, copy) NSString *title;

@end
