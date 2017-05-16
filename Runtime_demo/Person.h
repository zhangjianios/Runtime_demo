//
//  Person.h
//  Runtime_demo
//
//  Created by mac on 17/5/16.
//  Copyright © 2017年 zhangjian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

+ (void)run;

+ (void)study;

void eat(id self, SEL sel);

@end
