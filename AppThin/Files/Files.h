//
//  Files.h
//  AppThin
//
//  Created by sunner on 2021/3/3.
//  Copyright © 2021 sunner. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Files : NSObject

+ (NSArray<NSString *> *)findAllFilesIn:(NSString *)projectPath suffix:(NSArray <NSString*> *)suffix;

+ (NSArray<NSString *> *)findResoucesIn:(NSArray<NSString *> *)files pattern:(NSString *)pattern;

@end

NS_ASSUME_NONNULL_END
