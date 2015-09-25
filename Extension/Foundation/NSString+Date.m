//
//  NSString+Date.m
//  LUSIR
//
//  Created by longyuan on 15/8/19.
//  Copyright (c) 2015年 L. All rights reserved.
//

#import "NSString+Date.h"

@implementation NSString (Date)

/***
 *
 *  !@brief 转化年月日的日期格式
 *
 *
 ***/
- (NSDate *)toYMDDate
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = [NSString stringWithFormat:@"yyyy-MM-dd"];
    NSDate *date = [formatter dateFromString:self];
    return date;
}

@end
