//
//  UIAlertView+HDCore.h
//  HDCore
//
//  Created by zhangdadi on 2019/9/27.
//  Copyright © 2019 Reese. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  UIAlertView按钮点击时回调block
 *
 *  @param buttonIndex 按钮索引
 */
typedef void(^HDAlertViewBlock)(NSInteger buttonIndex);

/**
 *  UIAlertView的block回调
 */
@interface UIAlertView (HDCore)

/**
 *  创建UIAlertView对象
 *
 *  @param title             标题
 *  @param message           内容
 *  @param clickBlock        点击按钮回调
 *  @param cancelButtonTitle 取消按钮标题
 *  @param otherButtonTitles 其它按钮标题
 *
 *  @return <#return value description#>
 */
+ (instancetype)HDCreatWithTitle:(NSString *)title
                         message:(NSString *)message
                      clickBlock:(HDAlertViewBlock)clickBlock
               cancelButtonTitle:(NSString *)cancelButtonTitle
               otherButtonTitles:(NSString *)otherButtonTitles, ...;

@end
