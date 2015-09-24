//
//  LYFileManager.h
//  LUSIR
//
//  Created by longyuan on 15/9/9.
//  Copyright (c) 2015年 L. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CYFileManager : NSObject

/***
 *
 *
 *  !@brief 获取文件路径
 *
 *
 *
 ***/
+ (NSString *)filePathForCache:(NSString *)fileName;

/***
 *
 *
 *  !@brief 获取文件的属性
 *
 *
 **/
+ (NSDictionary *)attributesForFile:(NSString *)filePath;

/***
 *
 *  !@brief 移除某个文件
 *
 ***/
+ (void)removeFileWithPath:(NSString *)filePath;

@end
