//
//  ViewController.m
//  RuntimeDemo
//
//  Created by John on 15/12/1.
//  Copyright © 2015年 Mr Tang. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>
#import "Student.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self methodList];
    // Do any additional setup after loading the view, typically from a nib.
}

+ (void)load {
    //方法一
    Method propertyList = class_getInstanceMethod(self, @selector(propertyList));
    //方法二
    Method methodList = class_getInstanceMethod(self, @selector(methodList));
    //交换俩个方法的执行
    method_exchangeImplementations(propertyList, methodList);
}

- (void)propertyList {
    //用来记录属性的个数
    u_int count = 0;
    //获取属性的个数
    objc_property_t *properties = class_copyPropertyList([Student class], &count);
    for (int i = 0; i < count; i ++) {
        //属性名称
        const char *propertyName = property_getName(properties[i]);
        //转成NSString
        NSString *strName = [NSString stringWithCString:propertyName encoding:NSUTF8StringEncoding];
        NSLog(@"strName == %@",strName);
    }
    //调用方法一 其实执行方法二
    [self propertyList];
}

- (void)methodList {
    u_int count;
    //获取方法
    Method *methods = class_copyMethodList([Student class], &count);
    for (int i = 0; i < count; i ++) {
        SEL name = method_getName(methods[i]);
        NSString *strName = [NSString stringWithCString:sel_getName(name) encoding:NSUTF8StringEncoding];
        NSLog(@"method == %@",strName);
        //由Method得到SEL
        SEL selecter = method_getName(methods[i]);
        NSString *selectStr = [NSString stringWithCString:sel_getName(selecter) encoding:NSUTF8StringEncoding];
        //获取参数个数
        unsigned int paramsCount = method_getNumberOfArguments(methods[i]);
        //返回值类型
        char returnType = *method_copyReturnType(methods[i]);
        
        //转成字符串
        NSString *returnTypeStr = [NSString stringWithCString:&returnType encoding:NSUTF8StringEncoding];
        
         NSLog(@" === selectStr == %@ \n 参数个数为：%d \n 返回值类型：%@",selectStr,paramsCount,returnTypeStr);
        
    }

    
    
    
    
    
    
    
    
    
}



@end
