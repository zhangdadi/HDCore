//
//  UIAlertView+HDCore.m
//  HDCore
//
//  Created by zhangdadi on 2019/9/27.
//  Copyright © 2019 Reese. All rights reserved.
//

#import "UIAlertView+HDCore.h"
#import <objc/runtime.h>

static const char HDAlertViewDelegateHelperKey = '\0';

/**
 *  委托助手
 */
@interface HDAlertViewDelegateHelper : NSObject <UIAlertViewDelegate>
@property (nonatomic, copy) HDAlertViewBlock clickBlock;
@end


@interface UIAlertView ()
@property (nonatomic, strong) HDAlertViewDelegateHelper *helper;

@end

@implementation UIAlertView (HDCore)

+ (instancetype)HDCreatWithTitle:(NSString *)title
                         message:(NSString *)message
                      clickBlock:(HDAlertViewBlock)clickBlock
               cancelButtonTitle:(NSString *)cancelButtonTitle
               otherButtonTitles:(NSString *)otherButtonTitles, ... {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:cancelButtonTitle otherButtonTitles:otherButtonTitles, nil];
    
    va_list list;
    va_start(list, otherButtonTitles);
    while (YES) {
        NSString *buttonTitle = va_arg(list, NSString*);
        if (!buttonTitle) {
            break;
        }
        [alertView addButtonWithTitle:buttonTitle];
    }
    va_end(list);
    
    alertView.helper = [[HDAlertViewDelegateHelper alloc] init];
    alertView.helper.clickBlock = clickBlock;
    alertView.delegate = alertView.helper;
    return alertView;
}

- (void)setHelper:(HDAlertViewDelegateHelper *)helper {
    objc_setAssociatedObject(self, &HDAlertViewDelegateHelperKey, helper, OBJC_ASSOCIATION_RETAIN);
}

- (HDAlertViewDelegateHelper *)helper {
    return objc_getAssociatedObject(self, &HDAlertViewDelegateHelperKey);
}

@end



@implementation HDAlertViewDelegateHelper

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (_clickBlock) {
        _clickBlock(buttonIndex);
    }
}

@end
