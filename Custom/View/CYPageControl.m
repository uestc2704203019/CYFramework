//
//  UIPageControl+Point.m
//  LUSIR
//
//  Created by longyuan on 15/8/24.
//  Copyright (c) 2015年 L. All rights reserved.
//

#import "CYPageControl.h"

@implementation CYPageControl

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    [self updateDots];
}

- (void)setCurrentPage:(NSInteger)currentPage
{
    _currentPage = currentPage;
    [self updateDots];
}

- (void)setPageNumber:(NSInteger)pageNumber
{
    _pageNumber = pageNumber;
    [self updateDots];
}

- (void)updateDots
{
    float item_width = 10;
    
    float item_space = 0.f;
    
    float start_x = (self.frame.size.width-item_width*_pageNumber-item_space*(_pageNumber-1))/2.f;
    
    if (self.subviews.count<=0) {
        
        for (int i=0; i<_pageNumber; i++) {
            UIImageView *imageView = [[UIImageView alloc] init];
            imageView.tag = i;
            imageView.frame = CGRectMake((item_space+item_width)*i+start_x, (self.frame.size.height-item_width)/2.f, item_width, item_width);
            if (imageView.tag == _currentPage) {
                imageView.image = _selectImage;
            }else{
                imageView.image = _unselectImage;
            }
            [self addSubview:imageView];
        }
        return;
    }
    
    for (UIImageView *conView in self.subviews) {
        if ([conView isKindOfClass:[UIImageView class]]) {
            conView.frame = CGRectMake((item_space+item_width)*conView.tag+start_x, (self.frame.size.height-item_width)/2.f, item_width, item_width);
            if (conView.tag == _currentPage) {
                conView.image = _selectImage;
            }else{
                conView.image = _unselectImage;
            }
        }
    }
    
}

@end
