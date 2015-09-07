//
//  NSObject+Test.m
//  Test
//
//  Created by BaiXiong on 15/8/26.
//  Copyright (c) 2015年 BaiXiong. All rights reserved.
//

#import "NSObject+Test.h"

@implementation NSObject (Test)

int b=0;

NSObject *obj=nil;
-(int)a{
    return b;
}

-(void)setA:(int) v_a{
    b=v_a;
}

@end
