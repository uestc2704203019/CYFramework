//
//  UIImage+Resize.h
//  LUSIR
//
//  Created by longyuan on 15/8/24.
//  Copyright (c) 2015年 L. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Resize)

/****
 *
 *
 *  !@brief 从边距开始扩展延伸
 *
 *
 ****/
- (UIImage *)resizeImageWithInsetEdge:(UIEdgeInsets)edgeInset;

@end
