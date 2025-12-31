//
//  HDSingle.h
//  shiku_im
//
//  Created by 欢乐果 on 2019/11/25.
//  Copyright © 2019 Reese. All rights reserved.
//

#import <Foundation/Foundation.h>


/// 可继承单例
@interface HDSingle : NSObject

+ (instancetype)sharedInstance;

@end
