//
//  UIImage+HDAdditions.h
//  HDCore
//
//  Created by zhangdadi on 2019/9/27.
//  Copyright © 2019 Reese. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (HDCore)

/**
 *  有损缩放图片
 *
 *  @param size 缩放后的大小
 *
 *  @return 缩放后的图片
 */
- (UIImage *)HDScaleToSize:(CGSize)size;

/**
 *  通过颜色值创建图片
 *
 *  @param color 颜色值
 *
 *  @return 图片
 */
+ (UIImage*)HDImageWithColor:(UIColor*)color;

/**
 *  把图片转成data
 *
 *  @return 图片的data数据
 */
- (NSData *)HDDataTurn;


/// 生成颜色带文字的图片
/// @param text 文字
/// @param textColor 文字颜色
/// @param backgroundColor 背景颜色
+ (UIImage *)imageWithText:(NSString *)text textColor:(UIColor *)textColor backgroundColor:(UIColor *)backgroundColor;

@end
