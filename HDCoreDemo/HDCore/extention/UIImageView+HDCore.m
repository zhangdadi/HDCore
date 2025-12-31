//
//  UIImageView+HDCore.m
//  HDCore
//
//  Created by zhangdadi on 2019/9/27.
//  Copyright © 2019 Reese. All rights reserved.
//

#import "UIImageView+HDCore.h"

@implementation UIImageView (HDCore)

/**
 *  通过UIImage初始化UIImageView
 *
 *  @param image UIImage
 *
 */
+ (instancetype)HDImageViewWithImage:(UIImage *)image {
    return [[self alloc] initWithImage:image];
}

/**
 *  通过图片名字生成UIImageView
 *
 *  @param imageName 图片名字
 *
 *  @return UIImageView对象
 */
+ (instancetype)HDImageViewWithImageName:(NSString *)imageName {
    return [self HDImageViewWithImage:[UIImage imageNamed:imageName]];
}

+ (instancetype)HDFillImageView {
    UIImageView *imgView = [[UIImageView alloc] init];
    imgView.contentMode = UIViewContentModeScaleAspectFill;
    imgView.clipsToBounds = YES;
    return imgView;
}
+ (instancetype)HDFitImageView {
    UIImageView *imgView = [[UIImageView alloc] init];
    imgView.contentMode = UIViewContentModeScaleAspectFit;
    imgView.clipsToBounds = YES;
    return imgView;
}


@end
