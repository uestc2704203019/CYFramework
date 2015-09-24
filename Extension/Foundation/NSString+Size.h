//
//  NSString+Size.h
//  LUSIR
//
//  Created by longyuan on 15/8/21.
//  Copyright (c) 2015年 L. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Size)

/*****
 *
 *  !@brief 计算字符串需要的Size
 *
 ****/
- (CGSize)sizeWithFont:(UIFont *)font maxWidth:(float)width maxHeight:(float)height breakMode:(NSLineBreakMode)breakMode;

/***
 *
 *
 *
 ***/

@end
