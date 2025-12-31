//
//  UITextView+HDCore.h
//  HDCore
//
//  Created by zhangdadi on 2019/10/15.
//  Copyright © 2019 HD. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UITextView (HDCore)
/**
 *  设置输入的最大长度，0为不限制
 */
@property (nonatomic, assign) IBInspectable NSInteger HDMaxLenght;

/**
 *  当前内容长度
 */
- (NSInteger)contentLenght;
/**
*  是否显示清除按钮，默认为NO，不显示
*/



@property (nonatomic, assign) IBInspectable BOOL HDIsShowCleanButton;
@property (nonatomic, assign) IBInspectable NSString *HDPlaceholder;

@property (nonatomic, assign) UIButton *HDClearButton; //清除按钮,外部只设置，不要初始化等操作
@property (nonatomic, assign) UILabel *HDPlaceholderLabel; //外部只设置，不要初始化等操作


@end


