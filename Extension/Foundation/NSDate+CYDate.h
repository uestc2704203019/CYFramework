//
//  NSDate+CYDate.h
//  LUSIR
//
//  Created by longyuan on 15/8/19.
//  Copyright (c) 2015年 L. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (CYDate)

#pragma mark - 日期转化格式

/****
 *
 *  !@brief 转化为YMD年月日date
 *
 *****/
- (NSString *)toYMDDateStr;

/***
 *
 *  !@brief 转化本地时区
 *
 ****/
- (NSDate *)getNowDateFromatAnDate;

@end
