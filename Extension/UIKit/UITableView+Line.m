//
//  UITableView+Line.m
//  LUSIR
//
//  Created by longyuan on 15/8/21.
//  Copyright (c) 2015年 L. All rights reserved.
//

#import "UITableView+Line.h"

@implementation UITableView (Line)

//左边线对齐
- (void)separatorLineEdgeZero
{
    if ([self respondsToSelector:@selector(layoutMargins)]) {
        self.layoutMargins = UIEdgeInsetsMake(0, -20, 0, 0);
    }
    if ([self respondsToSelector:@selector(separatorInset)]) {
        self.separatorInset = UIEdgeInsetsMake(0, -20, 0, 0);
    }
}

//隐藏额外线
- (void)hiddenAdditionalLine
{
    UIView *baseView = [[UIView alloc] init];
    baseView.backgroundColor = [UIColor clearColor];
    self.tableHeaderView = baseView;
    self.tableFooterView = baseView;
}

@end
