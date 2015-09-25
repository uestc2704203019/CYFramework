//
//  UIFont+height.h
//  LUSIR
//
//  Created by longyuan on 15/8/25.
//  Copyright (c) 2015年 L. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIFont (Extension)

@end

@interface UIFont (HeightError)

/****
 *
 *
 *  !@brief 计算空白的额外边距
 *
 ****/
- (float)repairHeightForYEdge;

@end
