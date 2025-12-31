//
//  NSString+HDAdditions.h
//  HDCore
//
//  Created by zhangdadi on 2019/9/27.
//  Copyright © 2019 Reese. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface NSString (HDCore)

/**
 *  获取uuid
 *
 *  @return uuid
 */
+ (NSString *)HDUuid;

//编码
+(NSString*)encodeString:(NSString*)uncodeString;
//解码
+(NSString*)decodeString:(NSString*)decodeString;
/**
 *  判断字符串是否为空,NO表示为空,否则为不空.
 *
 *  @return NO表示为空,否则为不空.
 */
- (BOOL)HDIsNoNull;

/**
 *  把null等空字符转化成@""
 *
 *  @return 如果为空则返回@"",否则返回原字符
 */
- (NSString *)HDNullToEmpty;

/**
 *  提取字符串里的数字和小数点
 *
 *  @return 只包含数字和小数点的字符
 */
- (NSString *)HDFloatValue;



@end

@interface NSString (HDFilePath)

/**
 *  获取获取临时目录
 *
 *  @return 临时目录
 */
+ (NSString *)HDTemporaryPath;

/**
 *  获取缓存目录
 *
 *  @return 缓存目录
 */
+ (NSString *)HDCachePath;

+ (NSString *)HDDirectoryPath;

@end

@interface NSString (URL)

- (NSString*)HDStringByURLEncodingStringParameter;

@end

@interface NSString (call)

/**
 *  打电话
 */
- (void)HDCall;

@end

@interface NSString (Date)


/// 将某个时间戳转化成时间
/// @param timestamp 时间戳
/// @param format 时间格式 : YYYY年MM月dd日 hh:mm:ss ,hh与HH的区别:分别表示12小时制,24小时制
+ (NSString *)timestampSwitchTime:(long)timestamp andFormatter:(NSString *)format;

///通过秒获取  NSArray *rows = @[@"关闭", @"即可焚烧", @"10秒", @"5分钟", @"1小时", @"24小时"];
+ (NSString *)HDTimeStrForInterval:(int)interval;

///统一获取@[@"关闭", @"即可焚烧", @"10秒", @"5分钟", @"1小时", @"24小时"]; ,方便维护
+ (NSArray *)HDReadDestroy;
/// 通过@"关闭", @"即可焚烧", @"10秒", @"5分钟", @"1小时", @"24小时"获取秒,方便维护
- (int)HDTimeReadDestroy;




@end

@interface NSString (Array)


/// 将字符串用多个分隔符切割成数组
/// @param setSep 分隔符
- (NSArray *)componentsSeparatedBySetCharacters:(NSString *)setSep;


/// 将数组用多个分隔符切割成字符串
/// @param setSep 分隔符
/// @param array 数组
+ (NSString *)componentsStringBySetCharacters:(NSString *)setSep array:(NSArray *)array;

///json转dict
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;
@end

