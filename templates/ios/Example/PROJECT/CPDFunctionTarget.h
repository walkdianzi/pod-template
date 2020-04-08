//
//  CPDFunctionTarget.h
//  PROJECT_Example
//
//  Created by dasheng on 2020/3/18.
//  Copyright © 2020 PROJECT_OWNER. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CPDFunctionTarget : NSObject

@property(nonatomic, copy)  NSString         *title;
@property(nonatomic, strong)id               target;
@property(nonatomic, assign)SEL              selector;
@property(nonatomic, assign)Class            VCClass;

- (instancetype)initWithTitle:(NSString *)title target:(id)target selector:(SEL)selector;
- (instancetype)initWithTitle:(NSString *)title viewController:(Class)VCClass;

@end

NS_ASSUME_NONNULL_END
