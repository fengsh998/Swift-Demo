//
//  swiftlib.h
//  swiftlib
//
//  Created by fengsh on 18/8/15.
//  Copyright © 2015年 fengsh. All rights reserved.
//

#import <UIKit/UIKit.h>

//! Project version number for swiftlib.
FOUNDATION_EXPORT double swiftlibVersionNumber;

//! Project version string for swiftlib.
FOUNDATION_EXPORT const unsigned char swiftlibVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <swiftlib/PublicHeader.h>

//公开的头文件一定要设置为public类型
//只针对该framework中使用oc代码时需要向外暴露头文件swift的就不用了，默认是公开的
#import <swiftlib/swiftpublic.h>
