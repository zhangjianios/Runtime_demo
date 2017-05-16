//
//  ViewController.m
//  Runtime_demo
//
//  Created by mac on 17/5/16.
//  Copyright © 2017年 zhangjian. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>
#import "Person.h"
#import "NSObject+Property.h"


@interface ViewController ()

@end




@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self runtimeTest4];
    
}


/**
 *  runtime运行时机制;
 *  用法一:简单类方法或者是实例方法进行交换
 */

- (void)runtimeTest1{
    
    //黑魔法
    Method m1 = class_getClassMethod([Person class], @selector(run));
    Method m2 = class_getClassMethod([Person class], @selector(study));
    
    //交换方法
    method_exchangeImplementations(m1, m2);
    
    [Person run];
    [Person study];

}


/**
 *  runtime运行时机制;
 *  用法二:对系统方法进行拦截
 *  步骤：
 1、为UIImage建一个分类（UIImage+Category）
 2、在分类中实现一个自定义方法，方法中写要在系统方法中加入的语句，比如版本判断
 */

- (void)runtimeTest2{
    
    UIImage *image = [UIImage imageNamed:@""];
    
}

/**
 *  runtime运行时机制;
 *  用法三:动态添加方法
 */

- (void)runtimeTest3{
    
    Person *p = [[Person alloc]init];
    
    //报错
//    [p eat];
    
    //动态添加方法就不会报错
    [p performSelector:@selector(eat)];
    
    
}


/**
 *  runtime运行时机制;
 *  用法四:给分类添加属性
 */

- (void)runtimeTest4{
    
    //给系统的NSObject类添加属性name
    NSObject *objc = [[NSObject alloc]init];
    
    objc.name = @"123木头人";
    
    NSLog(@"%@", objc.name);
    
}







- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
