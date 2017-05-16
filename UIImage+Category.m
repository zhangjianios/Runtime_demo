//
//  UIImage+Category.m
//  Runtime_demo
//
//  Created by mac on 17/5/16.
//  Copyright © 2017年 zhangjian. All rights reserved.
//

#import "UIImage+Category.h"
#import <objc/runtime.h>

@implementation UIImage (Category)


+ (UIImage *)ex_imageName:(NSString *)name{
    
    double version = [[UIDevice currentDevice].systemVersion doubleValue];
    // 如果系统版本是7.0以上，使用另外一套文件名结尾jiu是‘_os7’的扁平化图片
    if (version >= 7.0) {
        name = [name stringByAppendingString:@"_os7"];
    }
    
    return [UIImage ex_imageName:name];
}


+ (void)load{
    
    Method m1 = class_getClassMethod([UIImage class], @selector(imageNamed:));
    Method m2 = class_getClassMethod([UIImage class], @selector(ex_imageName:));
    
    method_exchangeImplementations(m1, m2);

}




@end
