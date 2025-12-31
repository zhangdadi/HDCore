//
//  UIImage+HDAdditions.m
//  HDCore
//
//  Created by zhangdadi on 2019/9/27.
//  Copyright © 2019 Reese. All rights reserved.
//

#import "UIImage+HDCore.h"

@implementation UIImage (HDCore)

//有损缩放图片
- (UIImage *)HDScaleToSize:(CGSize)size {
    UIGraphicsBeginImageContext(size);
    [self drawInRect:CGRectMake(0,0, size.width, size.height)];
    UIImage* scaledImage =UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaledImage;
}

+ (UIImage*)HDImageWithColor:(UIColor*)color {
    CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

- (NSData *)HDDataTurn {
    NSData *data;
    if (UIImagePNGRepresentation(self) == nil) {
            data = UIImageJPEGRepresentation(self, 1.0);
        } else {
            data = UIImagePNGRepresentation(self);
        }
    return data;
}

+ (UIImage *)imageWithText:(NSString *)text textColor:(UIColor *)textColor backgroundColor:(UIColor *)backgroundColor {;  //获取随机颜色
    CGRect rect = CGRectMake(0.0f, 0.0f, 128, 128);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [backgroundColor CGColor]);
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    NSString *headerName = nil;
    if (text.length < 3) {
        headerName = text;
    }else{
        headerName = [text substringFromIndex:text.length-2];
    }
    UIImage *headerimg = [self imageToAddText:img withText:headerName textColor:textColor];
    return headerimg;

}

//把文字绘制到图片上
+ (UIImage *)imageToAddText:(UIImage *)img withText:(NSString *)text textColor:(UIColor *)textColor
{
    //1.获取上下文
    UIGraphicsBeginImageContext(img.size);
    //2.绘制图片
    [img drawInRect:CGRectMake(0, 0, img.size.width, img.size.height)];
    //3.绘制文字
    CGRect rect = CGRectMake(0,(img.size.height-45)/2, img.size.width, 25);
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle defaultParagraphStyle] mutableCopy];
    style.alignment = NSTextAlignmentCenter;
    //文字的属性
    NSDictionary *dic = @{NSFontAttributeName:[UIFont systemFontOfSize:12],NSParagraphStyleAttributeName:style,NSForegroundColorAttributeName:[UIColor whiteColor]};
    //将文字绘制上去
    [text drawInRect:rect withAttributes:dic];
    //4.获取绘制到得图片
    UIImage *watermarkImg = UIGraphicsGetImageFromCurrentImageContext();
    //5.结束图片的绘制
    UIGraphicsEndImageContext();

    return watermarkImg;
}


@end
