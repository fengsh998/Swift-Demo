//
//  OCSource.m
//  SwiftOC
//
//  Created by fengsh on 18/8/15.
//  Copyright © 2015年 fengsh. All rights reserved.
//

#import "OCSource.h"
//不放在头文件，是为避免循环引用
#import "SwiftOC-Swift.h"

//引用lib中的头文件
#import "OCDatatypeTest.h"

//引用swift的frame work 文头件
//#import <swiftlib/swiftlib-Swift.h>
#import <swiftlib/swiftlib-CustomHeaderSF.h>
//引用swift的frame work 文头件
#import <swiftlib/swiftpublic.h>

@implementation OCSource

+ (instancetype)share
{
    static OCSource*instance = nil;
    if (!instance) {
        instance = [[OCSource alloc]init];
    }
    return instance;
}

- (id)init
{
    self = [super init];
    if (self) {
        NSLog(@"OCSource init.");
    }
    return self;
}

- (void)dealloc
{
    NSLog(@"OCSource free.");
}

- (NSInteger)multi:(NSInteger)a with:(NSInteger)b
{
    return a * b;
}

- (void)toCallSwiftAPIInSameProject
{
    swiftMix *sm = [[swiftMix alloc]init];
    
    //又回到了自己的内部处理
    [sm toUseOcAPIInSameProject];
}

- (void)toCallLibOCApi
{
    OCDatatypeTest *OClib = [[OCDatatypeTest alloc]init];
    [OClib callSwiftFrameworkFunc];
}

- (void)toCallSwiftFrameworkOCApi
{
    //ocCanCallSwift *callswift = [[ocCanCallSwift alloc]init];//error 因为不是继承NSObject 所以没有alloc
    
    SwiftObj *sobj = [[SwiftObj alloc]init];
    [sobj display];
    
    
}
//调用
- (void)toCallSwiftFrameworkSwiftApi
{
    OCClass *oc = [[OCClass alloc]init];
    [oc ocApi];
}

@end
