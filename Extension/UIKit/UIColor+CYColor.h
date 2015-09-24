//
//  UIColor+CYColor.h
//  LUSIR
//
//  Created by longyuan on 15/8/19.
//  Copyright (c) 2015年 L. All rights reserved.
//

#import <UIKit/UIKit.h>

#define RGBColor(r,g,b,a) [UIColor colorWithRed:r/255.f green:g/255.f blue:b/255.f alpha:1]

#define HexColor(s,a) [UIColor colorWithHex:s alpha:a]

@interface UIColor (CYColor)

/**
 *
 *  !@brief 十六进制颜色值转化
 *
 *
 ***/
+ (UIColor *)colorWithHex:(NSString *)hexStr alpha:(float)alpha;


/****
 *
 *
 * !@brief 生成纯颜色的值
 *
 ****/
+ (UIImage *)imageWithColor:(UIColor *)color;
@end
