//
//  OCDatatypeTest.m
//  oclib
//
//  Created by fengsh on 18/8/15.
//  Copyright © 2015年 fengsh. All rights reserved.
//

#import "OCDatatypeTest.h"
//#import <swiftlib/swiftlib-Swift.h>
#import <swiftlib/swiftlib-CustomHeaderSF.h>
#import <swiftlib/swiftpublic.h>

@implementation OCDatatypeTest

- (void)setDatatype:(NSInteger)ivalue withString:(NSString *)str withBool:(BOOL)flag
           withEnum:(OCEnum)ocenum withCGFloat:(CGFloat)ocfloat withCGPoint:(CGPoint)ocpt
         withCGSize:(CGSize)ocsize withID:(id)object withNSNumber:(NSNumber *)ocnb
        withNSArray:(NSArray *)array withBlock:(SumBlock)sum withNSDictionary:(NSDictionary *)dic
{
    NSString *s = [NSString stringWithFormat:@"i : %ld,string : %@,Bool : %@,enum : %ld,float:%f,point:%@,size:%@,object:%@,number:%@,array:%@,block:%@,dic:%@",(long)ivalue,str,flag?@"YES":@"NO",(long)ocenum,ocfloat,NSStringFromCGPoint(ocpt),NSStringFromCGSize(ocsize),object,ocnb,array,sum,dic];
    
    if (sum) {
        NSInteger isum = sum(40,60);
        NSLog(@"40 + 60 = %ld",(long)isum);
    }
    
    NSLog(@"%@",s);
}

- (OCEnum)getCurrentEnum
{
    return ocState;
}

- (void)callSwiftFrameworkFunc
{
    //swiftCallOc *s = [swiftCallOc new];//[[swiftCallOc alloc]init];
    
    ObjectCCallSwift *s = [ObjectCCallSwift construct];
    [s display];
    
//    SwiftObj *sobj = [[SwiftObj alloc]init];
//    [sobj display];
//    
//    ocClass *oc = [[ocClass alloc]init];
//    [oc ocApi];
}

@end
