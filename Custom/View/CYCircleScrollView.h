//
//  CYCircleScrollView.h
//  CYAutoScroll
//
//  Created by longyuan on 15/3/6.
//  Copyright (c) 2015年 ly. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CYCircleScrollView;

@protocol CircleDataSource <NSObject>

- (NSInteger)numberForViews;

@optional

- (UIView *)viewAtIndex:(NSInteger)index;

- (UIView *)circleView:(CYCircleScrollView *)circleView atIndex:(NSInteger)index;

@end

@protocol CircleDelegate <NSObject>

@optional
- (void)selectViewMethod:(NSInteger)index;

- (void)scrollToIndex:(NSInteger)index;

@end

@interface CYCircleScrollView : UIScrollView <UIScrollViewDelegate>

@property (nonatomic, strong) NSArray *shows;

@property (nonatomic, assign) NSInteger curPage;

@property (nonatomic, assign) BOOL isAutoScroll;

@property (nonatomic, assign) id <CircleDataSource> circledatasource;

@property (nonatomic, assign) id <CircleDelegate> circledelegate;

- (void)reLoadData;

- (void)endAutoScroll;

- (void)toIndex:(NSInteger)index;

@end
