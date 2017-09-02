//
//  NSDateFormatter+SYDateFormatterCategory.m
//  SYTSPublic
//
//  Created by 666gps on 2017/9/2.
//  Copyright © 2017年 666gps. All rights reserved.
//

#import "NSDateFormatter+SYDateFormatterCategory.h"

@implementation NSDateFormatter (SYDateFormatterCategory)
+ (id)dateFormatter
{
    return [[self alloc] init];
}

+ (id)dateFormatterWithFormat:(NSString *)dateFormat
{
    NSDateFormatter *dateFormatter = [[self alloc] init];
    dateFormatter.dateFormat = dateFormat;
    return dateFormatter;
}

+ (id)defaultDateFormatter
{
    return [self dateFormatterWithFormat:@"yyyy-MM-dd HH:mm:ss"];
}

@end
