//
//  LYFileManager.m
//  LUSIR
//
//  Created by longyuan on 15/9/9.
//  Copyright (c) 2015年 L. All rights reserved.
//

#import "CYFileManager.h"

@implementation CYFileManager

/***
 *
 *
 *  !@brief 获取caches文件路径
 *
 *
 ***/
+ (NSString *)filePathForCaches:(NSString *)fileName
{
    NSString *filePath = [NSHomeDirectory() stringByAppendingFormat:@"%@%@",@"/Library/Caches/",fileName];
    return filePath;
}

/***
 *
 *  !@brief 获取documents文件路径
 *
 ****/
+ (NSString *)filePathForDocuments:(NSString *)fileName
{
    NSString *filePath = [NSHomeDirectory() stringByAppendingFormat:@"%@%@",@"/Library/Documents/",fileName];
    return filePath;
}

/***
 *
 *
 *  !@brief 获取文件的属性
 *
 *
 **/
+ (NSDictionary *)attributesForFile:(NSString *)filePath {
    
    // note: singleton is not thread-safe
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *aPath = filePath;
    
    if (![fileManager fileExistsAtPath:aPath]) return nil;
    
    NSError *attributesRetrievalError = nil;
    NSDictionary *attributes = [fileManager attributesOfItemAtPath:aPath
                                                             error:&attributesRetrievalError];
    
    if (!attributes) {
        NSLog(@"Error for file at %@: %@", aPath, attributesRetrievalError);
        return nil;
    }
    
    NSMutableDictionary *returnedDictionary = [NSMutableDictionary dictionaryWithObjectsAndKeys:[attributes fileType], @"fileType",
     [attributes fileModificationDate], @"fileModificationDate",
     [attributes fileCreationDate], @"fileCreationDate",
     [NSNumber numberWithUnsignedLongLong:[attributes fileSize]], @"fileSize",
     nil];
    
    return returnedDictionary;
}

/***
 *
 *  !@brief 移除某个文件
 *
 ***/
+ (void)removeFileWithPath:(NSString *)filePath
{
    NSError *error = nil;
    [[NSFileManager defaultManager] removeItemAtPath:filePath error:&error];
}

@end
