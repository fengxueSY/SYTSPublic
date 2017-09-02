//
//  NSDate+SYDateCategory.h
//  SYTSPublic
//
//  Created by 666gps on 2017/9/2.
//  Copyright © 2017年 666gps. All rights reserved.
//

#import <Foundation/Foundation.h>

#define D_MINUTE	60
#define D_HOUR		3600
#define D_DAY		86400
#define D_WEEK		604800
#define D_YEAR		31556926

@interface NSDate (SYDateCategory)

/**
 距离当前的时间间隔描述
 */
- (NSString *)timeIntervalDescription;

/**
 精确到分钟的日期描述
 */
- (NSString *)minuteDescription;

/**
 标准时间日期描述
 */
- (NSString *)formattedTime;

/**
 格式化日期描述
 */
- (NSString *)formattedDateDescription;

/**
 返回毫秒数
 */
- (double)timeIntervalSince1970InMilliSecond;

/**
 毫秒转成秒

 @param timeIntervalInMilliSecond 传入的毫秒数
 */
+ (NSDate *)dateWithTimeIntervalInMilliSecondSince1970:(double)timeIntervalInMilliSecond;

/**
 时间转为标准时间格式

 @param time 时间，不区分秒还是毫秒
 */
+ (NSString *)formattedTimeFromTimeInterval:(long long)time;

/**
 明天的时间NSDate
 */
+ (NSDate *) dateTomorrow;

/**
 昨天的时间NSDate
 */
+ (NSDate *) dateYesterday;

/**
 几天后的时间NSDate

 @param days 几天
 */
+ (NSDate *) dateWithDaysFromNow: (long long) days;

/**
 几天前的时间NSDate
 
 @param days 几天
 */
+ (NSDate *) dateWithDaysBeforeNow: (long long) days;

/**
 几小时前的时间NSDate
 
 @param dHours 几小时
 */
+ (NSDate *) dateWithHoursFromNow: (long long) dHours;

/**
 几小时后的时间NSDate
 
 @param dHours 几小时
 */
+ (NSDate *) dateWithHoursBeforeNow: (long long) dHours;

/**
 几分钟前的时间NSDate
 
 @param dMinutes 几分钟
 */
+ (NSDate *) dateWithMinutesFromNow: (long long) dMinutes;

/**
 几分钟后的时间NSDate
 
 @param dMinutes 几分钟
 */
+ (NSDate *) dateWithMinutesBeforeNow: (long long) dMinutes;

/**
 忽略时分秒，判断传入的时间是否和当前时间相等

 @param aDate 要判断的时间
 */
- (BOOL) isEqualToDateIgnoringTime: (NSDate *) aDate;

/**
 是否是今天
 */
- (BOOL) isToday;

/**
 是否是明天
 */
- (BOOL) isTomorrow;

/**
 是否是昨天
 */
- (BOOL) isYesterday;

/**
  判断传入时间的周几是否跟今天一样

 @param aDate 传入的时间
 */
- (BOOL) isSameWeekAsDate: (NSDate *) aDate;

/**
 是否是这周
 */
- (BOOL) isThisWeek;

/**
 是否是下周
 */
- (BOOL) isNextWeek;

/**
 是否是上周
 */
- (BOOL) isLastWeek;

/**
 判断传入的时间跟当前时间是否是同一月份

 @param aDate 传入的时间
 */
- (BOOL) isSameMonthAsDate: (NSDate *) aDate;

/**
 当前月
 */
- (BOOL) isThisMonth;

/**
 判断传入的时间是否是当前年

 @param aDate 传入的时间
 */
- (BOOL) isSameYearAsDate: (NSDate *) aDate;

/**
 当前年
 */
- (BOOL) isThisYear;

/**
 下一年
 */
- (BOOL) isNextYear;

/**
 上一年
 */
- (BOOL) isLastYear;

/**
 判断传入的时间是否比当前时间早

 @param aDate 传入的时间
 */
- (BOOL) isEarlierThanDate: (NSDate *) aDate;

/**
 判断传入的时间是否比当前时间晚
 
 @param aDate 传入的时间
 */
- (BOOL) isLaterThanDate: (NSDate *) aDate;

/**
 将来
 */
- (BOOL) isInFuture;

/**
 过去
 */
- (BOOL) isInPast;

/**
 是否在三个小时以内

 */
- (BOOL) threeHoursRange;

/**
 是否是工作日，（周一到周五）
 */
- (BOOL) isTypicallyWorkday;

/**
 是否是周末，（周六，周日）
 */
- (BOOL) isTypicallyWeekend;

/**
 当前时间加上几天以后的时间

 @param dDays 加上的天数
 */
- (NSDate *) dateByAddingDays: (long long) dDays;

/**
 当前时间减去几天以后的时间
 
 @param dDays 加上的天数
 */
- (NSDate *) dateBySubtractingDays: (long long) dDays;

/**
 当前时间加上几小时以后的时间
 
 @param dHours 加上的小时
 */
- (NSDate *) dateByAddingHours: (long long) dHours;

/**
 当前时间减去几小时以后的时间
 
 @param dHours 减去的小时
 */
- (NSDate *) dateBySubtractingHours: (long long) dHours;

/**
 当前时间加上几分钟以后的时间
 
 @param dMinutes 加上的分钟
 */
- (NSDate *) dateByAddingMinutes: (long long) dMinutes;

/**
 当前时间减去几分钟以后的时间
 
 @param dMinutes 减去的分钟
 */
- (NSDate *) dateBySubtractingMinutes: (long long) dMinutes;
- (NSDate *) dateAtStartOfDay;

// Retrieving intervals
- (long long) minutesAfterDate: (NSDate *) aDate;
- (long long) minutesBeforeDate: (NSDate *) aDate;
- (long long) hoursAfterDate: (NSDate *) aDate;
- (long long) hoursBeforeDate: (NSDate *) aDate;
- (long long) daysAfterDate: (NSDate *) aDate;
- (long long) daysBeforeDate: (NSDate *) aDate;
- (long long)distanceInDaysToDate:(NSDate *)anotherDate;

// Decomposing dates

/**
 当前最近的小时
 */
@property (readonly) long long nearestHour;

/**
 当前小时
 */
@property (readonly) long long hour;

/**
 当前分钟
 */
@property (readonly) long long minute;

/**
 当前秒
 */
@property (readonly) long long seconds;

/**
 当前日期
 */
@property (readonly) long long day;

/**
 当前月
 */
@property (readonly) long long month;

/**
 当前第几周
 */
@property (readonly) long long week;

/**
 当前周几
 */
@property (readonly) long long weekday;

/**
 当前月的第几个周
 */
@property (readonly) long long nthWeekday; // e.g. 2nd Tuesday of the month == 2

/**
 当前年
 */
@property (readonly) long long year;

@end
