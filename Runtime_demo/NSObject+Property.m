//
//  NSObject+Property.m
//  Runtime_demo
//
//  Created by mac on 17/5/16.
//  Copyright © 2017年 zhangjian. All rights reserved.
//

#import "NSObject+Property.h"
#import <objc/runtime.h>

static const char *key = "name";

@implementation NSObject (Property)

- (NSString *)name{
    
    //根据关联的key,获取关联的值
    return objc_getAssociatedObject(self, key);
    
}

- (void)setName:(NSString *)name{
    
    /**
     *  第四个参数:关联的策略
     */
    
    objc_setAssociatedObject(self, key, name, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    
}


@end
