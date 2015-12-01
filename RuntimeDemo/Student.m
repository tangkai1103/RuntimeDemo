//
//  Student.m
//  RuntimeDemo
//
//  Created by John on 15/12/1.
//  Copyright © 2015年 Mr Tang. All rights reserved.
//

#import "Student.h"

@implementation Student
{
    NSString *course;
}
- (void)logAddress {
    NSLog(@"北京");
}

- (void)logNameWithStu:(Student *)stu {
    NSLog(@"name == %@",stu.name);
}

- (NSInteger)changeAge {
    return 22;
}

@end
