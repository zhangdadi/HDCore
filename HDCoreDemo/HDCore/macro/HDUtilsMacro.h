//
//  HDUtilsMacro.h
//  HDCore
//
//  Created by zhangdadi on 2019/9/27.
//  Copyright © 2019 Reese. All rights reserved.
//
//
//方便使用的宏定义

#ifndef HDUtilsMacro_h
#define HDUtilsMacro_h

// 注册通知
#define HDNotifiAdd(_noParamsFunc, _notifyName)  [[NSNotificationCenter defaultCenter] \
addObserver:self \
selector:@selector(_noParamsFunc) \
name:_notifyName \
object:nil];

// 发送通知
#define HDNotifiPost(_notifyName)   [[NSNotificationCenter defaultCenter]postNotificationName:_notifyName object:nil];

// 移除通知
#define HDNotifiRemove(_notifyName) [[NSNotificationCenter defaultCenter] removeObserver:self name:_notifyName object:nil];

//移除所有通知
#define HDNotifiAllRemove [[NSNotificationCenter defaultCenter] removeObserver:self];

//FRAME操作
#define HDScreenWidth           [UIScreen mainScreen].bounds.size.width
#define HDScreenHeight          [UIScreen mainScreen].bounds.size.height
#define HDRectMake              ([UIScreen mainScreen].bounds)
#define HDMainBundle  [NSBundle mainBundle]
#define HDUserDefaults [NSUserDefaults standardUserDefaults]
#define HDWindow ([UIApplication sharedApplication].keyWindow)
//根视图控制器
#define HDRootVC (UITabBarController *)[[UIApplication sharedApplication].delegate window].rootViewController

// 判断是否为iPhone x 或者 xs
#define HDIsIPhoneX [[UIScreen mainScreen] bounds].size.width == 375.0f && [[UIScreen mainScreen] bounds].size.height == 812.0f
// 判断是否为iPhone xr 或者 xs max
#define HDIsIPhoneXR [[UIScreen mainScreen] bounds].size.width == 414.0f && [[UIScreen mainScreen] bounds].size.height == 896.0f
// 是全面屏手机
#define HDIsFullScreen (HDIsIPhoneX || HDIsIPhoneXR)

// 状态栏高度
#define HDIsFullScreenY(_y) (HDIsFullScreen ? (24.0 + _y) : (0 + _y))

// 全面屏适配 适配
// 状态栏高度
#define HDStateBarHeight (HDIsFullScreen ? 44.0 : 20.0)
// 导航栏高度
#define HDNavigationBarHeight (HDStateBarHeight + 44.0)
// 底部tabbar高度
#define HDTabBarHeight (HDIsFullScreen ? (49.0+34.0) : 49.0)

// 颜色16进制转换
#define HDColorFromHexadecimalRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define HDColorFromHexadecimalRGBA(rgbValue, alphaValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:alphaValue]

#define HDColorFromRGB(r, g, b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
#define HDColorFromRGBA(r, g, b, a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define kBackgroundColor UIColorMakeWithHex(@"#F5F7FA")
#define HDWeakSelf __weak typeof(self) weakSelf = self;


#endif /* HDUtilsMacro_h */
