//
//  NSString+Size.m
//  LUSIR
//
//  Created by longyuan on 15/8/21.
//  Copyright (c) 2015年 L. All rights reserved.
//

#import "NSString+Size.h"

@implementation NSString (Size)

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
