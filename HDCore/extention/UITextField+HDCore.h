//
//  UITextField+HDCore.h
//  HDCore
//
//  Created by zhangdadi on 2019/9/27.
//  Copyright © 2019 Reese. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (HDCore)

/**
 *  设置输入的最大长度，0为不限制
 */
@property (nonatomic, assign)IBInspectable NSInteger HDMaxLenght;

- (NSInteger)contentLenght;

@end
