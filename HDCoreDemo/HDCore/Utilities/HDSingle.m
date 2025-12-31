//
//  HDSingle.m
//  shiku_im
//
//  Created by 欢乐果 on 2019/11/25.
//  Copyright © 2019 Reese. All rights reserved.
//

#import "HDSingle.h"
#import <objc/runtime.h>


@implementation HDSingle

+ (instancetype)sharedInstance {
    id instance = objc_getAssociatedObject(self, @"instance");
    if (!instance) {
        instance = [[super allocWithZone:NULL] init];
        NSLog(@"单例创建=====%@=====",instance);
        objc_setAssociatedObject(self, @"instance", instance, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return instance;
}

+ (id)allocWithZone:(struct _NSZone *)zone {
    return [self sharedInstance];
}

- (id)copyWithZone:(struct _NSZone *)zone {
    Class selfClass = [self class];
    return [selfClass sharedInstance];
}

@end
