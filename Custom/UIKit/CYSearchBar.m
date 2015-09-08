//
//  CYSearchBar.m
//  LUSIR
//
//  Created by longyuan on 15/3/24.
//  Copyright (c) 2015年 L. All rights reserved.
//

#import "CYSearchBar.h"

#define CYSystem(n) ([[UIDevice currentDevice].systemVersion floatValue]>n)?YES:NO

@implementation CYSearchBar

#warning barstyle需要设置为default，不然设置将不起作用

- (void)setIsCleanBackgroud:(BOOL)isCleanBackgroud
{
    _isCleanBackgroud = isCleanBackgroud;
    if (_isCleanBackgroud) {
        self.barTintColor = [UIColor clearColor];
        self.backgroundColor = [UIColor clearColor];
        UIView *contentView = nil;
        if (CYSystem(7.0)) {
            contentView = [self.subviews objectAtIndex:0];
        }else{
            contentView = self;
        }
        for (UIView *conView in contentView.subviews) {
            if ([conView isKindOfClass:NSClassFromString(@"UISearchBarBackground")]) {
                [conView removeFromSuperview];
            }
        }
    }
}

- (void)setIsNoBorder:(BOOL)isNoBorder
{
    _isNoBorder = isNoBorder;
    if (isNoBorder) {
        self.barTintColor = [UIColor clearColor];
        self.backgroundColor = [UIColor clearColor];
        UIView *contentView = nil;
        if (CYSystem(7.0)) {
            contentView = [self.subviews objectAtIndex:0];
        }else{
            contentView = self;
        }
        for (UIView *conView in contentView.subviews) {
            if ([conView isKindOfClass:NSClassFromString(@"UISearchBarTextField")]) {
                conView.backgroundColor = [UIColor clearColor];
            }
        }
    }
}

- (void)setIsCorner:(BOOL)isCorner
{
    _isCorner = isCorner;
    if (_isCorner) {
        UIView *contentView = nil;
        if (CYSystem(7.0)) {
            contentView = [self.subviews objectAtIndex:0];
        }else{
            contentView = self;
        }
        for (UIView *conView in contentView.subviews) {
            if ([conView isKindOfClass:NSClassFromString(@"UISearchBarTextField")]) {
                float height = 58.0f/2.0;
                conView.layer.cornerRadius = height/2.0f;
                conView.layer.masksToBounds = YES;
                conView.backgroundColor = [UIColor whiteColor];
            }
        }

    }
}

- (void)setHasBorder:(BOOL)hasBorder
{
    _hasBorder = hasBorder;
    if (_hasBorder) {
        UIView *contentView = nil;
        if (CYSystem(7.0)) {
            contentView = [self.subviews objectAtIndex:0];
        }else{
            contentView = self;
        }
        for (UIView *conView in contentView.subviews) {
            if ([conView isKindOfClass:NSClassFromString(@"UISearchBarTextField")]) {
                conView.layer.borderWidth = 0.5f;
                conView.layer.borderColor = [UIColor lightGrayColor].CGColor;
            }
        }
    }
}

- (void)setFont:(UIFont *)font
{
    _font = font;
    self.barTintColor = [UIColor clearColor];
    self.backgroundColor = [UIColor clearColor];
    UIView *contentView = nil;
    if (CYSystem(7.0)) {
        contentView = [self.subviews objectAtIndex:0];
    }else{
        contentView = self;
    }
    for (UIView *conView in contentView.subviews) {
        if ([conView isKindOfClass:NSClassFromString(@"UISearchBarTextField")]) {
            UITextField *textfield = (UITextField *)conView;
            textfield.font = _font;
        }
    }
}

- (void)setTextBackground:(UIColor *)textBackground
{
    _textBackground = textBackground;
    self.barTintColor = [UIColor clearColor];
    self.backgroundColor = [UIColor clearColor];
    UIView *contentView = nil;
    if (CYSystem(7.0)) {
        contentView = [self.subviews objectAtIndex:0];
    }else{
        contentView = self;
    }
    for (UIView *conView in contentView.subviews) {
        if ([conView isKindOfClass:NSClassFromString(@"UISearchBarTextField")]) {
            UITextField *textfield = (UITextField *)conView;
            textfield.backgroundColor = _textBackground;
        }
    }
}

- (void)setTextColor:(UIColor *)textColor
{
    _textColor = textColor;
    self.barTintColor = [UIColor clearColor];
    self.backgroundColor = [UIColor clearColor];
    UIView *contentView = nil;
    if (CYSystem(7.0)) {
        contentView = [self.subviews objectAtIndex:0];
    }else{
        contentView = self;
    }
    for (UIView *conView in contentView.subviews) {
        if ([conView isKindOfClass:NSClassFromString(@"UISearchBarTextField")]) {
            UITextField *textField = (UITextField *)conView;
            textField.textColor = _textColor;
        }
    }
}

- (void)setCancelButtonTitle:(NSString *)cancelButtonTitle
{
    _cancelButtonTitle = cancelButtonTitle;
    self.barTintColor = [UIColor clearColor];
    self.backgroundColor = [UIColor clearColor];
    UIView *contentView = nil;
    if (CYSystem(7.0)) {
        contentView = [self.subviews objectAtIndex:0];
    }else{
        contentView = self;
    }
    for (UIView *conView in contentView.subviews) {
        if ([conView isKindOfClass:NSClassFromString(@"UINavigationButton")]) {
            UIButton *button = (UIButton *)conView;
            [button setTitle:_cancelButtonTitle forState:UIControlStateNormal];
        }
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
