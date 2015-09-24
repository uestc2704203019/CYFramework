//
//  CYSlider.m
//  LUSIR
//
//  Created by longyuan on 15/8/26.
//  Copyright (c) 2015年 L. All rights reserved.
//

#import "CYSlider.h"

@implementation CYSlider

- (void)resizeTrackRectWithRect:(CGRect)rect
{
    [self trackRectForBounds:rect];
}

- (CGRect)trackRectForBounds:(CGRect)bounds
{
    return bounds;
}

- (void)resizeThumbRectWithRect:(CGRect)rect
{
//    [self thumbRectForBounds:rect trackRect:rect value:0];
}

//- (CGRect)thumbRectForBounds:(CGRect)bounds trackRect:(CGRect)rect value:(float)value
//{
//    return bounds;
//}
//
@end
