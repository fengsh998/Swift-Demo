//
//  BridgeOC.m
//  SwiftC
//
//  Created by fengsh on 17/8/15.
//  Copyright © 2015年 fengsh. All rights reserved.
//

#import "BridgeOC.h"
#import "cppUtils.h"

@implementation BridgeOC

- (void)callCppDisplay
{
    TestCpp *tc = new TestCpp();
    tc->display();
}
@end
