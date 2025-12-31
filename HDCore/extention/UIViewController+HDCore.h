//
//  UIViewController+HDAdditions.h
//  HDCore
//
//  Created by zhangdadi on 2019/9/27.
//  Copyright © 2019 Reese. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^HDAdditionBlock)();

@interface UIViewController (HDCore)

/**
 *  自定义导航栏返回按钮，默认自带返回文字
 *
 *  @param targe  回调对象
 *  @param action 回调方法
 *
 *  @return 返回此对象
 */
- (UIBarButtonItem *)HDCustomBackButtonWithTarget:(id)targe action:(SEL)action; //默认自带返回文字
- (UIBarButtonItem *)HDCustomBackButtonWithTitle:(NSString *)title target:(id)targe action:(SEL)action;

/**
 *  自定义导航栏左边按钮
 *
 *  @param title  按钮标题
 *  @param targe  回调对象
 *  @param action 回调方法
 *
 *  @return 返回此对象
 */
- (UIBarButtonItem *)HDCustomLeftButtonWithTitle:(NSString *)title target:(id)targe action:(SEL)action;
- (UIBarButtonItem *)HDCustomLeftButtonWithImageName:(NSString *)imageName target:(id)targe action:(SEL)action;
- (UIBarButtonItem *)HDCustomLeftButtonWithTitle:(NSString *)title imageName:(NSString *)imageName target:(id)targe action:(SEL)action;

/**
 *  自定义导航栏右边按钮
 *
 *  @param title  按钮标题
 *  @param targe  回调对象
 *  @param action 回调方法
 *
 *  @return 此对象
 */
- (UIBarButtonItem *)HDCustomRightButtonWithTitle:(NSString *)title target:(id)targe action:(SEL)action;
- (UIBarButtonItem *)HDCustomRightButtonWithImageName:(NSString *)imageName target:(id)targe action:(SEL)action;
- (UIBarButtonItem *)HDCustomRightButtonWithTitle:(NSString *)title imageName:(NSString *)imageName target:(id)targe action:(SEL)action;

//自定义导航栏按钮
- (UIBarButtonItem *)HDCustomNavButtonWithTitle:(NSString *)title target:(id)targe action:(SEL)action;
- (UIBarButtonItem *)HDCustomNavButtonWithImageName:(NSString *)imageName target:(id)targe action:(SEL)action;
- (UIBarButtonItem *)HDCustomNavButtonWithTitle:(NSString *)title imageName:(NSString *)imageName target:(id)targe action:(SEL)action;

@end
