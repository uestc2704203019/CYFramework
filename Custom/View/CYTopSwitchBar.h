//
//  CYTopSwitchBar.h
//  LUSIR
//
//  Created by longyuan on 15/9/1.
//  Copyright (c) 2015年 L. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CYTopSwitchBarDelegate <NSObject>

@optional

- (void)switchbarSelectIndex:(NSInteger)selectIndex;

@end

@interface CYTopSwitchBar : UIView

#pragma mark - separator manager
@property (nonatomic, assign) BOOL hasSeparator;
@property (nonatomic, strong) UIColor *separatorColor;
@property (nonatomic, assign) float separatorHeight;

#pragma mark - line manager
@property (nonatomic, assign) BOOL hasLine;
@property (nonatomic, assign) float lineHeight;
@property (nonatomic, strong) UIColor *lineColor;

#pragma mark - base setting
@property (nonatomic, strong) UIColor *selectColor;
@property (nonatomic, strong) UIColor *normalColor;

@property (nonatomic, strong) UIFont *barFont;

@property (nonatomic, assign) NSInteger selectIndex;

@property (nonatomic, assign) id <CYTopSwitchBarDelegate> delegate;

/****
 *
 *  !@brief 初始化
 *
 *  @param barcount tag按钮的个数
 *  @param
 *
 ***/
- (instancetype)initWithFrame:(CGRect)frame titles:(NSArray *)titles;

/***
 *
 *  !@brief set方法设置完成后调用
 *
 ***/
- (void)setParamComplete;

/**
 *
 *  !@brief 外部选择index
 *
 **/
- (void)resetSelectItem;

@end
