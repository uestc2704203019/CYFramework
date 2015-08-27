//
//  UIFont+height.m
//  LUSIR
//
//  Created by longyuan on 15/8/25.
//  Copyright (c) 2015年 L. All rights reserved.
//

#import "UIFont+height.h"

@implementation UIFont (height)

/****
 *
 *
 *  !@brief 计算空白的额外边距
 *
 ****/
- (float)repairHeightForYEdge
{
    float repair_height = (self.lineHeight-self.pointSize)/2.f;
    return repair_height;
}

@end
