//
//  ocClass.m
//  swiftlib
//
//  Created by fengsh on 19/8/15.
//  Copyright © 2015年 fengsh. All rights reserved.
//

#import "ocClass.h"

//#import <swiftlib/swiftlib-Swift.h>
#import <swiftlib/swiftlib-CustomHeaderSF.h>

@implementation OCClass

- (id)init
{
    self = [super init];
    if (self) {
        NSLog(@"ocClass init.");
    }
    return self;
}

- (void)dealloc
{
    NSLog(@"ocClass free.");
}

- (void)ocApi
{
    //纯swift 不被OC所识别
    //NonOcCall *oc = NonOcCall
    
    ObjectCCallSwift *ocswfit = [ObjectCCallSwift construct];
    
    [ocswfit display];
    
    NSLog(@"oc 的 接品被调用。");
}

@end
