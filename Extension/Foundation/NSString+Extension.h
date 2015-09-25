//
//  NSString+Extension.h
//  LoadingView
//
//  Created by longyuan on 15/9/25.
//  Copyright © 2015年 chai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (Extension)

@end

@interface NSString (Size)

/*****
 *
 *  !@brief 计算字符串需要的Size
 *
 ****/
- (CGSize)sizeWithFont:(UIFont *)font maxWidth:(float)width maxHeight:(float)height breakMode:(NSLineBreakMode)breakMode;

@end

@interface NSString (Date)

/***
 *
 *  !@brief 转化年月日的日期格式
 *
 *
 ***/
- (NSDate *)toYMDDate;

@end
