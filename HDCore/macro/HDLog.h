//
//  HDLog.h
//  HDCore
//
//  Created by zhangdadi on 2019/9/27.
//  Copyright © 2019 Reese. All rights reserved.
//



/**
 *  调戏版本才打印,发布版本不打印
 */
#ifndef HDLog_h
#define HDLog_h


#if TARGET_IPHONE_SIMULATOR  //模拟器
#define HDLog(FORMAT, ...) fprintf(stderr,"\n%s:%d\t%s\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#define NSLog(FORMAT, ...) fprintf(stderr,"\n%s:%d\t%s\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);

#elif TARGET_OS_IPHONE //手机
#ifdef DEBUG  //DEBUG编译
#define HDLog(FORMAT, ...) fprintf(stderr,"\n%s:%d\t%s\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#define NSLog(FORMAT, ...) fprintf(stderr,"\n%s:%d\t%s\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
#define HDLog(FORMAT, ...)
#define NSLog(FORMAT, ...)

#endif
#else //非手机非模拟器
#define HDLog(FORMAT, ...) fprintf(stderr,"\n%s:%d\t%s\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#define NSLog(FORMAT, ...) fprintf(stderr,"\n%s:%d\t%s\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#endif


#endif /* HDLog_h */
