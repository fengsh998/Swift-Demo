//
//  OCDatatypeTest.h
//  oclib
//
//  Created by fengsh on 18/8/15.
//  Copyright © 2015年 fengsh. All rights reserved.
//
/*
  NSInteger
  NSString
  BOOL
  NSArray
  NSDictionary
  enum
  CGFloat
  CGPoint
  CGSize
  id
  NSNumber
 
  block
*/

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NSInteger (^SumBlock)(NSInteger a, NSInteger b);


typedef NS_ENUM(NSInteger,OCEnum)
{
    ocNone          = 0,
    ocState         = 3,
    ocOK            = 5
};

@interface OCDatatypeTest : NSObject

- (void)setDatatype:(NSInteger) ivalue withString:(NSString *)str withBool:(BOOL)flag
           withEnum:(OCEnum)ocenum withCGFloat:(CGFloat)ocfloat withCGPoint:(CGPoint)ocpt
         withCGSize:(CGSize)ocsize withID:(id)object withNSNumber:(NSNumber *)ocnb
        withNSArray:(NSArray *)array withBlock:(SumBlock)sum withNSDictionary:(NSDictionary *)dic;

- (OCEnum)getCurrentEnum;

- (void)callSwiftFrameworkFunc;

@end
