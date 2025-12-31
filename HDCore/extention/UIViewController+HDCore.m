//
//  UIViewController+HDAdditions.m
//  HDCore
//
//  Created by zhangdadi on 2019/9/27.
//  Copyright © 2019 Reese. All rights reserved.
//

#import "UIViewController+HDCore.h"

@implementation UIViewController (HDCore)

//自定义导航栏返回按钮
- (UIBarButtonItem *)HDCustomBackButtonWithTarget:(id)targe action:(SEL)action {
    return [self HDCustomLeftButtonWithImageName:@"返回按钮-默认" target:targe action:action];
}

- (UIBarButtonItem *)HDCustomBackButtonWithTitle:(NSString *)title target:(id)targe action:(SEL)action {
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.delegate = nil;
    }
    return [self HDCustomLeftButtonWithTitle:title imageName:@"返回按钮-默认" target:targe action:action];
}

//自定义导航栏左边按钮
- (UIBarButtonItem *)HDCustomLeftButtonWithTitle:(NSString *)title target:(id)targe action:(SEL)action {
    return [self HDCustomLeftButtonWithTitle:title imageName:nil target:targe action:action];
}
- (UIBarButtonItem *)HDCustomLeftButtonWithImageName:(NSString *)imageName target:(id)targe action:(SEL)action {
    return [self HDCustomLeftButtonWithTitle:nil imageName:imageName target:targe action:action];
}
- (UIBarButtonItem *)HDCustomLeftButtonWithTitle:(NSString *)title imageName:(NSString *)imageName target:(id)targe action:(SEL)action {
//    [self.navigationItem setHidesBackButton:YES]; //解决右滑小点问题
    UIBarButtonItem *barButtonItem = [self HDCustomNavButtonWithTitle:title imageName:imageName target:targe action:action];
    [self.navigationItem setLeftBarButtonItem:barButtonItem];
    return barButtonItem;
}

//自定义导航栏右边按钮
- (UIBarButtonItem *)HDCustomRightButtonWithTitle:(NSString *)title target:(id)targe action:(SEL)action {
    return [self HDCustomRightButtonWithTitle:title imageName:nil target:targe action:action];
}
- (UIBarButtonItem *)HDCustomRightButtonWithImageName:(NSString *)imageName target:(id)targe action:(SEL)action {
    return [self HDCustomRightButtonWithTitle:nil imageName:imageName target:targe action:action];
}
- (UIBarButtonItem *)HDCustomRightButtonWithTitle:(NSString *)title imageName:(NSString *)imageName target:(id)targe action:(SEL)action {
    UIBarButtonItem *barButtonItem = [self HDCustomNavButtonWithTitle:title imageName:imageName target:targe action:action];
    ((UIButton *)barButtonItem.customView).contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    [self.navigationItem setRightBarButtonItem:barButtonItem];
    return barButtonItem;
}


//自定义导航栏按钮
- (UIBarButtonItem *)HDCustomNavButtonWithTitle:(NSString *)title target:(id)targe action:(SEL)action {
    return [self HDCustomNavButtonWithTitle:title imageName:nil target:targe action:action];
}
- (UIBarButtonItem *)HDCustomNavButtonWithImageName:(NSString *)imageName target:(id)targe action:(SEL)action {
    return [self HDCustomNavButtonWithTitle:nil imageName:imageName target:targe action:action];
    
}

- (UIBarButtonItem *)HDCustomNavButtonWithTitle:(NSString *)title imageName:(NSString *)imageName target:(id)targe action:(SEL)action {
    UIButton *itemButtom = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *image = [UIImage imageNamed:imageName];
    [itemButtom setImage:image forState:UIControlStateNormal];
    itemButtom.titleLabel.font = [UIFont fontWithName:@"PingFang SC" size: 16];
    [itemButtom setTitle:title forState:UIControlStateNormal];
    [itemButtom setTitleEdgeInsets:UIEdgeInsetsMake(0, 5, 0, -5)];
    UIColor *color = [UINavigationBar appearance].titleTextAttributes[NSForegroundColorAttributeName];
    if (color == nil) {
        color = [UIColor colorWithRed:48/255.0 green:50/255.0 blue:50/255.0 alpha:1.0];
    }
    [itemButtom setTitleColor:color forState:UIControlStateNormal];
    itemButtom.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [itemButtom addTarget:targe action:action
         forControlEvents:UIControlEventTouchUpInside];
    if (title == nil && imageName != nil) {
        [itemButtom setFrame:CGRectMake(0, 0, image.size.width, image.size.height)];
    } else {
        [itemButtom setFrame:CGRectMake(0, 0, 80, 40)];
    }
    
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc]
                                      initWithCustomView:itemButtom];
    return barButtonItem;
}


@end
