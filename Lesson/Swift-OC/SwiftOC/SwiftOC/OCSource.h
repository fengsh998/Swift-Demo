//
//  OCSource.h
//  SwiftOC
//
//  Created by fengsh on 18/8/15.
//  Copyright © 2015年 fengsh. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface OCSource : NSObject

+ (instancetype)share;

- (NSInteger)multi:(NSInteger)a with:(NSInteger)b;

//在同一工程师使用swift代码
- (void)toCallSwiftAPIInSameProject;
//调用lib中oc写的api
- (void)toCallLibOCApi;
//调用lib中swift写的api
- (void)toCallSwiftFrameworkOCApi;
//调用
- (void)toCallSwiftFrameworkSwiftApi;
@end
