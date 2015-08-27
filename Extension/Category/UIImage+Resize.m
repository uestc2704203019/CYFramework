//
//  UIImage+Resize.m
//  LUSIR
//
//  Created by longyuan on 15/8/24.
//  Copyright (c) 2015年 L. All rights reserved.
//

#import "UIImage+Resize.h"

@implementation UIImage (Resize)

/****
 *
 *
 *  !@brief 从边距开始扩展延伸
 *
 *
 ****/
- (UIImage *)resizeImageWithInsetEdge:(UIEdgeInsets)edgeInset
{
    return [self resizableImageWithCapInsets:edgeInset resizingMode:UIImageResizingModeStretch];
}

@end
