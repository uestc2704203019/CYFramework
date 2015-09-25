//
//  NSDate+CYDate.m
//  LUSIR
//
//  Created by longyuan on 15/8/19.
//  Copyright (c) 2015年 L. All rights reserved.
//

#import "NSDate+Extension.h"

@implementation NSDate (Extension)

@end

@implementation NSDate (DateFormatter)

/****
 *
 *  !@brief 转化为YMD年月日date
 *
 *****/
- (NSString *)toYMDDateStr
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    return [dateFormatter stringFromDate:self];
}

/***
 *
 *  !@brief 转化本地时区
 *
 ****/
- (NSDate *)getNowDateFromatAnDate
{
    //设置源日期时区
    NSTimeZone* sourceTimeZone = [NSTimeZone timeZoneWithAbbreviation:@"UTC"];//或GMT
    //设置转换后的目标日期时区
    NSTimeZone* destinationTimeZone = [NSTimeZone localTimeZone];
    //得到源日期与世界标准时间的偏移量
    NSInteger sourceGMTOffset = [sourceTimeZone secondsFromGMTForDate:self];
    //目标日期与本地时区的偏移量
    NSInteger destinationGMTOffset = [destinationTimeZone secondsFromGMTForDate:self];
    //得到时间偏移量的差值
    NSTimeInterval interval = destinationGMTOffset - sourceGMTOffset;
    //转为现在时间
    NSDate* destinationDateNow = [[NSDate alloc] initWithTimeInterval:interval sinceDate:self];
    return destinationDateNow;
}

@end
