//
//  NSString+HDAdditions.m
//  HDCore
//
//  Created by zhangdadi on 2019/9/27.
//  Copyright © 2019 Reese. All rights reserved.
//

#import "NSString+HDCore.h"

#pragma mark - NSString(HDCore)

@implementation NSString (HDCore)

+ (NSString *)HDUuid{
    CFUUIDRef uuid = CFUUIDCreate(kCFAllocatorDefault);
    CFStringRef strUuid = CFUUIDCreateString(kCFAllocatorDefault,uuid);
    NSString * str = [NSString stringWithString:(__bridge NSString *)strUuid];
    CFRelease(strUuid);
    CFRelease(uuid);
    return  str;
}

- (BOOL)HDIsNoNull {
    
    if (self.length == 0 || [self isEqual:[NSNull null]] || [self isEqualToString:@"null"] || [self isEqualToString:@"(null)"]) {
        return NO;
    }
    
    //判断是否全为空格
    NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    NSString *trimedString = [self stringByTrimmingCharactersInSet:set];
    if ([trimedString length] == 0) {
        return NO;
    }
    
    return YES;
}

- (NSString *)nullToEmpty {
    if (![self HDIsNoNull]) {
        return @"";
    }
    
    return self;
}

- (NSString *)HDFloatValue {
    return [[self componentsSeparatedByCharactersInSet:[[NSCharacterSet characterSetWithCharactersInString:@"0123456789."] invertedSet]] componentsJoinedByString:@""];
}


@end

#pragma mark - NSString(HDFilePath)

@implementation NSString (HDFilePath)

+ (NSString *)HDTemporaryPath
{
    return NSTemporaryDirectory();
}

+ (NSString *)HDCachePath
{
    NSArray *CachePaths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString  *directory = [CachePaths objectAtIndex:0];
    
    return directory;
}

+ (NSString *)HDDirectoryPath {
    NSString *directory = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    return directory;
}

@end

#pragma mark - NSString(URL)

@implementation NSString (URL)

- (NSString*)HDStringByURLEncodingStringParameter
{
    NSString *resultStr = self;
    
    CFStringRef originalString = (__bridge CFStringRef) self;
    CFStringRef leaveUnescaped = CFSTR(" ");
    CFStringRef forceEscaped = CFSTR("!*'();:@&=+$,/?%#[]");
    
    CFStringRef escapedStr;
    escapedStr = CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                         originalString,
                                                         leaveUnescaped,
                                                         forceEscaped,
                                                         kCFStringEncodingUTF8);
    
    if( escapedStr )
    {
        NSMutableString *mutableStr = [NSMutableString stringWithString:(__bridge NSString *)escapedStr];
        CFRelease(escapedStr);
        
        // replace spaces with plusses
        [mutableStr replaceOccurrencesOfString:@" "
                                    withString:@"%20"
                                       options:0
                                         range:NSMakeRange(0, [mutableStr length])];
        resultStr = mutableStr;
    }
    return resultStr;
}


@end


@implementation NSString (call)

- (void)HDCall {
    NSString *urlStr = [NSString stringWithFormat:@"tel:%@", self];
    UIWebView *callWebView = [[UIWebView alloc] init];
    [callWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:urlStr]]];
    [[UIApplication sharedApplication].keyWindow addSubview:callWebView];
}

@end

@implementation NSString (Date)

+ (NSString *)timestampSwitchTime:(long)timestamp andFormatter:(NSString *)format {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:format];
    NSTimeZone *timeZone = [NSTimeZone timeZoneWithName:@"Asia/Beijing"];
    [formatter setTimeZone:timeZone];
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:timestamp];
    NSString *confromTimespStr = [formatter stringFromDate:confromTimesp];
    return confromTimespStr;
}

+ (NSDictionary *)HDGetReadDestroyDict {
    NSDictionary *dict = @{@-1: @"关闭",
                           @0: @"即可焚烧",
                           @10: @"10秒",
                           @300: @"5分钟",
                           @3600: @"1小时",
                           @86400: @"24小时",
    };
    return dict;
}

+ (NSString *)HDTimeStrForInterval:(int)interval {
    NSDictionary *dict = [NSString HDGetReadDestroyDict];
   
    return dict[@(interval)];
}

+ (NSArray *)HDReadDestroy {
//    return @[@"关闭", @"即可焚烧", @"10秒", @"5分钟", @"1小时", @"24小时"];
    return @[@"关闭", @"即可焚烧"];
}

- (int)HDTimeReadDestroy {
    NSDictionary *dict = [NSString HDGetReadDestroyDict];
    NSArray *allKeys = dict.allKeys;
    for (NSNumber *key in allKeys) {
        NSString *val = dict[key];
        if ([val isEqualToString:self]) {
            return key.intValue;
        }
    }
    
    return -1;
}

@end


@implementation NSString (Array)

- (NSArray *)componentsSeparatedBySetCharacters:(NSString *)setSep
{
    NSMutableArray *tempArray = [NSMutableArray arrayWithArray:[self componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:setSep]]];
    [tempArray removeObject:@""];
    return [NSArray arrayWithArray:tempArray];
}

+ (NSString *)componentsStringBySetCharacters:(NSString *)setSep array:(NSArray *)array {
    
    NSMutableString *tempStr = [NSMutableString string];
    for (int i = 0; i < array.count; i++) {
        NSString *str = array[i];
        if (![str isKindOfClass:[NSString class]]) {
            continue;
        }
        if (tempStr.length > 0) {
            [tempStr appendString:setSep];
        }
        [tempStr appendString:str];
    }
        
    return tempStr;
}

//编码
+(NSString*)encodeString:(NSString*)uncodeString
{
    uncodeString = [uncodeString stringByReplacingOccurrencesOfString:@"" withString:@"&quot;"];
    uncodeString = [uncodeString stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"];
    uncodeString = [uncodeString stringByReplacingOccurrencesOfString:@"<" withString:@"&lt;"];
    uncodeString = [uncodeString stringByReplacingOccurrencesOfString:@">" withString:@"&gt;"];
    uncodeString = [uncodeString stringByReplacingOccurrencesOfString:@"'" withString:@"&acute;"];
    uncodeString = [uncodeString stringByReplacingOccurrencesOfString:@"©" withString:@"&copy;"];
    uncodeString = [uncodeString stringByReplacingOccurrencesOfString:@"®" withString:@"&reg;"];
    return uncodeString;

}
//解码
+(NSString*)decodeString:(NSString*)decodeString
{
    decodeString = [decodeString stringByReplacingOccurrencesOfString:@"&quot;" withString:@""];
    decodeString = [decodeString stringByReplacingOccurrencesOfString:@"&amp;" withString:@"&"];
    decodeString = [decodeString stringByReplacingOccurrencesOfString:@"&lt;" withString:@"<"];
    decodeString = [decodeString stringByReplacingOccurrencesOfString:@"&gt;" withString:@">"];
    decodeString = [decodeString stringByReplacingOccurrencesOfString:@"&acute;" withString:@"'"];
    decodeString = [decodeString stringByReplacingOccurrencesOfString:@"&copy;" withString:@"©"];
    decodeString = [decodeString stringByReplacingOccurrencesOfString:@"&reg;" withString:@"®"];
    return decodeString;

}

+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString
{
    if (jsonString == nil) {
        return nil;
    }

    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err)
    {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}

@end
