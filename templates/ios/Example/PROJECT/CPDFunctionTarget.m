//
//  CPDFunctionTarget.m
//  PROJECT_Example
//
//  Created by dasheng on 2020/3/18.
//  Copyright © 2020 PROJECT_OWNER. All rights reserved.
//

#import "CPDFunctionTarget.h"

@implementation CPDFunctionTarget

- (instancetype)initWithTitle:(NSString *)title viewController:(Class)VCClass{
    
    if (self = [super init]) {
        _title = title;
        _VCClass = VCClass;
    }
    return self;
}

- (instancetype)initWithTitle:(NSString *)title target:(id)target selector:(SEL)selector{
    
    if (self = [super init]) {
        _title = title;
        _target = target;
        _selector = selector;
    }
    return self;
}

@end
