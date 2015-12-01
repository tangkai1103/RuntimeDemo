//
//  Student.h
//  RuntimeDemo
//
//  Created by John on 15/12/1.
//  Copyright © 2015年 Mr Tang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Student : NSObject
@property (copy, nonatomic) NSString *name;
@property (copy, nonatomic) NSString *address;
@property (assign, nonatomic) NSInteger age;

- (void)logNameWithStu:(Student *)stu;
- (NSInteger)changeAge;
- (void)logAddress;

@end
