//
//  UIColor+CYColor.m
//  LUSIR
//
//  Created by longyuan on 15/8/19.
//  Copyright (c) 2015年 L. All rights reserved.
//

#import "UIColor+CYColor.h"

@implementation UIColor (CYColor)

/**
 *
 *  !@brief 十六进制颜色值转化
 *
 *
 ***/
+ (UIColor *)colorWithHex:(NSString *)hexStr alpha:(float)alpha
{
    if ([[hexStr substringToIndex:1] isEqualToString:@"#"]) {
        hexStr = [hexStr substringFromIndex:1];
    }
    
    float red = 0;
    float green = 0;
    float blue = 0;
    
    switch (hexStr.length) {
        case 1:;
        {
            red = 0;
            green = 0;
            blue = [self hexNumber:hexStr];
        }
            break;
        case 2:;
        {
            red = 0;
            green = 0;
            NSString *b = hexStr;
            blue = [self hexNumber:[b substringWithRange:NSMakeRange(0, 1)]]*16+[self hexNumber:[b substringWithRange:NSMakeRange(1, 1)]];
        }
            break;
        case 3:;
        {
            NSString *r = [hexStr substringWithRange:NSMakeRange(0,1)];
            NSString *g = [hexStr substringWithRange:NSMakeRange(1, 1)];
            NSString *b = [hexStr substringWithRange:NSMakeRange(2, 1)];
            red = [self hexNumber:r]*17;
            green = [self hexNumber:g]*17;
            blue = [self hexNumber:b]*17;
        }
            break;
        case 4:;
        {
            NSString *g = [hexStr substringWithRange:NSMakeRange(0, 2)];
            NSString *b = [hexStr substringWithRange:NSMakeRange(2, 2)];
            red = 0;
            green = [self hexNumber:[g substringWithRange:NSMakeRange(0, 1)]]*16+[self hexNumber:[g substringWithRange:NSMakeRange(1, 1)]];
            blue = [self hexNumber:[b substringWithRange:NSMakeRange(0, 1)]]*16+[self hexNumber:[b substringWithRange:NSMakeRange(1, 1)]];
        }
            break;
        case 5:;
        {
            NSString *r = [hexStr substringWithRange:NSMakeRange(0,1)];
            NSString *g = [hexStr substringWithRange:NSMakeRange(1, 2)];
            NSString *b = [hexStr substringWithRange:NSMakeRange(3, 2)];
            red = [self hexNumber:r];
            green = [self hexNumber:[g substringWithRange:NSMakeRange(0, 1)]]*16+[self hexNumber:[g substringWithRange:NSMakeRange(1, 1)]];
            blue = [self hexNumber:[b substringWithRange:NSMakeRange(0, 1)]]*16+[self hexNumber:[b substringWithRange:NSMakeRange(1, 1)]];
        }
            break;
        default:;
        {
            NSString *r = [hexStr substringWithRange:NSMakeRange(0,2)];
            NSString *g = [hexStr substringWithRange:NSMakeRange(2, 2)];
            NSString *b = [hexStr substringWithRange:NSMakeRange(4, 2)];
            red = [self hexNumber:[r substringWithRange:NSMakeRange(0, 1)]]*16+[self hexNumber:[r substringWithRange:NSMakeRange(1, 1)]];
            green = [self hexNumber:[g substringWithRange:NSMakeRange(0, 1)]]*16+[self hexNumber:[g substringWithRange:NSMakeRange(1, 1)]];
            blue = [self hexNumber:[b substringWithRange:NSMakeRange(0, 1)]]*16+[self hexNumber:[b substringWithRange:NSMakeRange(1, 1)]];
            
        }
            break;
    }
    return [UIColor colorWithRed:red/255.0f green:green/255.0f blue:blue/255.0 alpha:alpha];
}

/***
 *
 *  !@brief 十六进制颜色值转化辅助
 *
 ****/
+ (int)hexNumber:(NSString *)hexStr
{
    if ([hexStr isEqualToString:@"f"]) {
        return 15;
    }
    if ([hexStr isEqualToString:@"e"]) {
        return 14;
    }
    if ([hexStr isEqualToString:@"d"]) {
        return 13;
    }
    if ([hexStr isEqualToString:@"c"]) {
        return 12;
    }
    if ([hexStr isEqualToString:@"b"]) {
        return 11;
    }
    if ([hexStr isEqualToString:@"a"]) {
        return 10;
    }
    return [hexStr intValue];
}

/****
 *
 *
 * !@brief 生成纯颜色的值
 *
 ****/
+ (UIImage *)imageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f,0.0f,1.0f,1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context =UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *myImage =UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return myImage;
}

@end
