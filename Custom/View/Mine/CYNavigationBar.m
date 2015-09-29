//
//  CYNavigationBar.m
//  SmartWatch
//
//  Created by chai on 15/9/26.
//  Copyright © 2015年 chai. All rights reserved.
//

#import "CYNavigationBar.h"

#define kTitleFont [UIFont systemFontOfSize:18]

@interface CYNavigationBar ()
{
    
}
@end

@implementation CYNavigationBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createItems];
    }
    return self;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self createItems];
    }
    return self;
}

- (void)setShowBackItem:(BOOL)showBackItem
{
    _showBackItem = showBackItem;
}

- (void)createItems
{
    _showBackItem = YES;
    [self createNavigationItem];
    [self createBackItem];
}

- (void)createBackItem
{
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = (CGRect){0,0,44,44};
    backButton.imageEdgeInsets = UIEdgeInsetsMake(0, -18, 0, 18);
    [backButton addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    [backButton setImage:[UIImage imageNamed:@"back_bar_item"] forState:UIControlStateNormal];
    
    UIBarButtonItem *backButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    _leftItems = @[backButtonItem];

    [_navigationItem setLeftBarButtonItems:_leftItems];
}

- (void)createNavigationItem
{
    if (_navigationItem!=nil) {
        return;
    }
    _navigationItem = [[UINavigationItem alloc] initWithTitle:@""];
    [self pushNavigationItem:_navigationItem animated:NO];
}

- (void)setLeftItem:(UIBarButtonItem *)leftItem
{
    _leftItem = leftItem;
    [_navigationItem setLeftBarButtonItem:leftItem animated:NO];
}

- (void)setLeftItems:(NSArray *)leftItems
{
    _leftItems = leftItems;
    [_navigationItem setLeftBarButtonItems:leftItems animated:NO];
}

- (void)setTitleView:(UIView *)titleView
{
    _titleView = titleView;
    [_navigationItem setTitleView:_titleView];
}

- (void)setTitle:(NSString *)title
{
    _title = title;
    [_navigationItem setTitle:_title];
}

- (void)setRightItem:(UIBarButtonItem *)rightItem
{
    _rightItem = rightItem;
    [_navigationItem setRightBarButtonItem:rightItem animated:NO];

}

- (void)setRightItems:(NSArray *)rightItems
{
    _rightItems = rightItems;
    [_navigationItem setRightBarButtonItems:rightItems animated:NO];
}

- (void)backAction
{
    [self.navigationController popViewControllerAnimated:YES];
}


@end
