//
//  UIPageControl+Point.h
//  LUSIR
//
//  Created by longyuan on 15/8/24.
//  Copyright (c) 2015年 L. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CYPageControl : UIView

@property (nonatomic, strong) UIImage *unselectImage;

@property (nonatomic, strong) UIImage *selectImage;

@property (nonatomic, assign) NSInteger pageNumber;

@property (nonatomic, assign) NSInteger currentPage;

@end
