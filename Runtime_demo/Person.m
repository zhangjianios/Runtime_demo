//
//  Person.m
//  Runtime_demo
//
//  Created by mac on 17/5/16.
//  Copyright © 2017年 zhangjian. All rights reserved.
//

#import "Person.h"
#import <objc/runtime.h>

@implementation Person

+ (void)run{
    NSLog(@"run");
}

+ (void)study{
    NSLog(@"study");
}

void eat(id self, SEL sel){
    NSLog(@"%@, %@", self, NSStringFromSelector(sel));
}


+ (BOOL)resolveInstanceMethod:(SEL)sel{
    
    if (sel == @selector(eat)) {
        //动态添加eat方法
        /**
         *
         *
         *  @param 第一个参数:self 给哪个类添加方法
         *  @param 第二个参数:@selector(eat)  添加方法的方法编号
         *  @param 第三个参数:eat  添加方法的函数实现
         *  @param 第四个参数:函数的类型
         *  @return
         */
        
        
        class_addMethod(self, @selector(eat), eat, "v@:");
        
        
    }
    
    return [super resolveInstanceMethod:sel];
    
}



@end
