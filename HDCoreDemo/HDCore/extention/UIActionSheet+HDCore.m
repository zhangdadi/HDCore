//
//  UIActionSheet+HDCore.m
//  HDCore
//
//  Created by zhangdadi on 2019/9/27.
//  Copyright © 2019 Reese. All rights reserved.
//

#import "UIActionSheet+HDCore.h"
#import <objc/runtime.h>


static const char HDActionSheetDelegateHelperKey = '\0';

/**
 *  委托助手
 */
@interface HDActionSheetDelegateHelper : NSObject <UIActionSheetDelegate>
@property (nonatomic, copy) HDActionSheetBlock clickBlock;
@end


@interface UIAlertView ()
@property (nonatomic, strong) HDActionSheetDelegateHelper *helper;

@end


@implementation UIActionSheet (HDCore)

+ (instancetype)HDCreatWithTitle:(NSString *)title
                      clickBlock:(HDActionSheetBlock)clickBlock
               cancelButtonTitle:(NSString *)cancelButtonTitle
          destructiveButtonTitle:(NSString *)destructiveButtonTitle
               otherButtonTitles:(NSString *)otherButtonTitles, ... {
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:title delegate:nil cancelButtonTitle:cancelButtonTitle destructiveButtonTitle:destructiveButtonTitle otherButtonTitles:otherButtonTitles, nil];
    
    va_list list;
    va_start(list, otherButtonTitles);
    while (YES) {
        NSString *buttonTitle = va_arg(list, NSString*);
        if (!buttonTitle) {
            break;
        }
        [actionSheet addButtonWithTitle:buttonTitle];
    }
    va_end(list);
    
    actionSheet.helper = [[HDActionSheetDelegateHelper alloc] init];
    actionSheet.helper.clickBlock = clickBlock;
    actionSheet.delegate = actionSheet.helper;
    return actionSheet;
}

- (void)setHelper:(HDActionSheetDelegateHelper *)helper {
    objc_setAssociatedObject(self, &HDActionSheetDelegateHelperKey, helper, OBJC_ASSOCIATION_RETAIN);
}

- (HDActionSheetDelegateHelper *)helper {
    return objc_getAssociatedObject(self, &HDActionSheetDelegateHelperKey);
}

@end


@implementation HDActionSheetDelegateHelper

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (_clickBlock) {
        _clickBlock(buttonIndex);
    }
}

@end

