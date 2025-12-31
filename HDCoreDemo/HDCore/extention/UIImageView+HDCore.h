//
//  UIImageView+HDCore.h
//  HDCore
//
//  Created by zhangdadi on 2019/9/27.
//  Copyright © 2019 Reese. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (HDCore)

/**
 *  通过UIImage初始化UIImageView
 *
 *  @param image UIImage
 *
 */
+ (instancetype)HDImageViewWithImage:(UIImage *)image;

/**
 *  通过图片名字生成UIImageView
 *
 *  @param imageName 图片名字
 *
 *  @return UIImageView对象
 */
+ (instancetype)HDImageViewWithImageName:(NSString *)imageName;

+ (instancetype)HDFillImageView;
+ (instancetype)HDFitImageView;

@end
