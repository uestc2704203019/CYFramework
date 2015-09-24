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

/***
 *
 *  !@brief 从某个点开始截取一定大小的图片
 *
 *
 ***/
- (UIImage *)captureImageWithPoint:(CGPoint)point size:(CGSize)size
{
    CGRect rect = (CGRect){point,size.width*self.scale,size.height*self.scale};
    CGImageRef subImageRef = CGImageCreateWithImageInRect(self.CGImage, rect);
    CGRect smallBounds = CGRectMake(0, 0, CGImageGetWidth(subImageRef), CGImageGetHeight(subImageRef));
    
    UIGraphicsBeginImageContext(smallBounds.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextDrawImage(context, smallBounds, subImageRef);
    UIImage* resizeImage = [UIImage imageWithCGImage:subImageRef];
    CGImageRelease(subImageRef);
    UIGraphicsEndImageContext();
    return resizeImage;
}

@end
