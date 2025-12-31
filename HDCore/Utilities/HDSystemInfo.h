//
//  HDSystemInfo.h
//  HDCore
//
//  Created by zhangdadi on 15/6/12.
//  Copyright (c) 2015年 HD. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  系统属性类
 */
@interface HDSystemInfo : NSObject

/**
 *  获取app名称
 *
 *  @return app名称
 */
+ (NSString*)getAppName;

/**
 *  获取内部版本标识
 *
 *  @return 内部版本标识
 */
+ (NSString*)getAppVersionBuild;

/**
 *  获取发布版本号
 *
 *  @return 发布版本号
 */
+ (NSString*)getAppVersionName;

/**
 *  获取设备名称
 *
 *  @return 设备名称
 */
+ (NSString*)getDeviceName;

/**
 *  获取系统名称
 *
 *  @return 系统名称
 */
+ (NSString*)getSystemName;

/**
 *  获取系统版本
 *
 *  @return 系统版本
 */
+ (float)getSystemVersion;

/**
 *  获取手机型号
 *
 *  @return 手机型号
 */
+ (NSString*)getDeviceModel;


@end
