//
//  Files.m
//  AppThin
//
//  Created by sunner on 2021/3/3.
//  Copyright © 2021 sunner. All rights reserved.
//

#import "Files.h"

@implementation Files

+ (NSArray<NSString *> *)findAllFilesIn:(NSString *)projectPath suffix:(NSArray <NSString*> *)suffix {
    NSFileManager *fileMgr = [[NSFileManager alloc] init];
    NSMutableArray *files = [NSMutableArray array];
    [self searchAllFiles:fileMgr In:projectPath files:files suffix:suffix];
    return files.copy;
}

+ (void)searchAllFiles:(NSFileManager *)fileMgr In:(NSString *)path files:(NSMutableArray *)files suffix:(NSArray <NSString*> *)suffix  {
    BOOL isDir = NO;
    BOOL isExistAtPath = [fileMgr fileExistsAtPath:path isDirectory:&isDir];
    if (!isDir && isExistAtPath) {
        NSString *pathSuffix = [path componentsSeparatedByString:@"."].lastObject;
        pathSuffix = [NSString stringWithFormat:@".%@", pathSuffix];
        for (int i = 0; i < suffix.count; i++) {
            if ([pathSuffix isEqualToString:suffix[i]]) {
                [files addObject:path];
                return;
            }
        }
    }
    if (isDir && isExistAtPath) {
        NSArray *dirs = [fileMgr directoryContentsAtPath:path];
        for (int i = 0; i < dirs.count; i++) {
            NSString *inPath = [NSString stringWithFormat:@"%@/%@", path, dirs[i]];
            [self searchAllFiles:fileMgr In:inPath files:files suffix:suffix];
        }
    }
}

+ (NSArray<NSString *> *)findResoucesIn:(NSArray<NSString *> *)files pattern:(NSString *)pattern {
    NSMutableArray *resources = [NSMutableArray array];
    for (int i = 0; i < files.count; i++) {
        NSString *content = [NSString stringWithContentsOfFile:files[i] encoding:NSUTF8StringEncoding error:nil];
        NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:pattern options:NSRegularExpressionCaseInsensitive error:nil];
        NSTextCheckingResult *result = [regex firstMatchInString:content options:0 range:NSMakeRange(0, [content length])];
        if (result) {
            [resources addObject:[content substringWithRange:result.range]];
        }
    }
    return resources.copy;
}

@end
