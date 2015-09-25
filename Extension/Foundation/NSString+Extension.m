//
//  NSString+Extension.m
//  LoadingView
//
//  Created by longyuan on 15/9/25.
//  Copyright © 2015年 chai. All rights reserved.
//

#import "NSString+Extension.h"

@implementation NSString (Extension)

@end

@implementation NSString (Size)

/*****
 *
 *  !@brief 计算字符串需要的Size
 *
 ****/
- (CGSize)sizeWithFont:(UIFont *)font maxWidth:(float)width maxHeight:(float)height breakMode:(NSLineBreakMode)breakMode
{
    NSMutableParagraphStyle *paragraph = [NSMutableParagraphStyle new];
    paragraph.lineBreakMode = breakMode;
    
    CGSize containerSize = CGSizeMake(width, height);
    
    CGRect rect = [self boundingRectWithSize:containerSize
                                     options:NSStringDrawingUsesLineFragmentOrigin
                                  attributes:@{NSFontAttributeName:font,NSParagraphStyleAttributeName:paragraph}
                                     context:nil];
    return rect.size;
}

@end

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

