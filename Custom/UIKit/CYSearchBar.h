//
//  CYSearchBar.h
//  LUSIR
//
//  Created by longyuan on 15/3/24.
//  Copyright (c) 2015年 L. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CYSearchBar : UISearchBar

@property (nonatomic, assign) BOOL isCleanBackgroud;        //清除背景色
@property (nonatomic, assign) BOOL isNoBorder;              //清除边框
@property (nonatomic, assign) BOOL hasBorder;               //设定边框
@property (nonatomic, assign) BOOL isCorner;                //设置内部textfield圆角
@property (nonatomic, weak) UIFont *font;                   //设置内部textfield字体
@property (nonatomic, weak) UIColor *textBackground;        //设置内部textfield背景色
@property (nonatomic, weak) UIColor *textColor;

@property (nonatomic, copy) NSString *cancelButtonTitle;

@end
