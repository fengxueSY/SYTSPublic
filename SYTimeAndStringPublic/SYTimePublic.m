//
//  SYTimePublic.m
//  SYTSPublic
//
//  Created by 666gps on 2017/8/22.
//  Copyright © 2017年 666gps. All rights reserved.
//

#import "SYTimePublic.h"

@implementation SYTimePublic
#pragma mark -  根据时间戳获取星期几
+ (long long)getWeekDayFordate:(long long)time
{
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    long long unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekdayCalendarUnit |
    NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    //    NSDate *now = [NSDate date];
    NSString * timeS = [NSString stringWithFormat:@"%lld",time];
    NSString * showT = [timeS substringToIndex:timeS.length - 3];
    NSDate *detaildate=[NSDate dateWithTimeIntervalSince1970:[showT longLongValue]];
    // 话说在真机上需要设置区域，才能正确获取本地日期，天朝代码:zh_CN
    
    
    calendar.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
    comps = [calendar components:unitFlags fromDate:detaildate];
    return [comps weekday] - 1;
}
#pragma mark -   计算某个时间点距离当前时间的时间差
+ (NSString *)CalculationTimeWith:(NSString *)stime
{
    NSDate *nowDate = [NSDate date];
    NSDateFormatter *dateFomatter = [[NSDateFormatter alloc] init];
    dateFomatter.dateFormat = @"yyyy-MM-dd HH:mm:ss.0";
    // 截止时间字符串格式
    NSString *expireDateStr = stime;
    // 当前时间字符串格式
    NSString *nowDateStr = [dateFomatter stringFromDate:nowDate];
    // 截止时间data格式
    NSDate *expireDate = [dateFomatter dateFromString:expireDateStr];
    // 当前时间data格式
    nowDate = [dateFomatter dateFromString:nowDateStr];
    // 当前日历
    NSCalendar *calendar = [NSCalendar currentCalendar];
    // 需要对比的时间数据
    NSCalendarUnit unit = NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    // 对比时间差
    NSDateComponents *dateCom = [calendar components:unit fromDate:nowDate toDate:expireDate options:0];
    NSString *timeStr = [NSString stringWithFormat:@"%ld天%ld小时%ld分",dateCom.day,dateCom.hour,dateCom.minute];
    
    return timeStr;
}

/**
 *  计算剩余时间
 *
 *  @param startTime 开始日期
 *
 *  @param endTime   结束日期
 *
 *  @return 剩余时间
 */
+ (NSTimeInterval)getCountDownStringWithStartTime:(NSString *)startTime andEndTime:(NSString *)endTime {
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *startDate = [dateFormatter dateFromString:startTime];
    NSDate *endDate = [dateFormatter dateFromString:endTime];
    NSTimeInterval voteCountTime = [endDate timeIntervalSinceDate:startDate];
    return voteCountTime;
}
#pragma mark -   获取当前时间
+ (NSString *)getCurrentTime {
    NSDate *now = [NSDate date];
    NSDateFormatter *dateformatter = [[NSDateFormatter alloc] init];
    [dateformatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    return [dateformatter stringFromDate:now];
}
#pragma mark -   秒数转具体本地日期
+ (NSString *)timeFormatted:(long long)totalSeconds{
    NSDate  *localeDate = [NSDate dateWithTimeIntervalSince1970:totalSeconds];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    [dateFormatter setTimeZone:[NSTimeZone localTimeZone]];
    NSString *strDate = [dateFormatter stringFromDate:localeDate];
    return strDate;
}
#pragma mark -   获取时间戳
+ (NSString *)getTimeInterval {
    return [NSString stringWithFormat:@"%.f", [[NSDate date] timeIntervalSince1970] * 1000];
    
}
#pragma mark -   获取时间戳(10位)
+ (NSString *)getTimeIntervalTen {
    return [NSString stringWithFormat:@"%.f", [[NSDate date] timeIntervalSince1970]];
    
}

#pragma mark -   根据时间日期获取时间戳
+ (NSTimeInterval)getSecondsWithDate:(NSDate *)date
{
    //    // 设置系统时区为本地时区
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    //    // 计算本地时区与 GMT 时区的时间差
    long long interval = [zone secondsFromGMT];
    //    // 在 GMT 时间基础上追加时间差值，得到本地时间
    date = [date dateByAddingTimeInterval:-interval];
    NSTimeInterval timeStamp= [date timeIntervalSince1970];
    return timeStamp;
}

#pragma mark -   获取当前年份
+ (long long)getCurrentYear {
    
    NSDate *now = [NSDate date];
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSDateComponents *dateComponent = [calendar components:unitFlags fromDate:now];
    
    return [dateComponent year];
    
}

#pragma mark -   获取当前月份
+ (long long)getCurrentMonth {
    
    NSDate *now = [NSDate date];
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSDateComponents *dateComponent = [calendar components:unitFlags fromDate:now];
    return [dateComponent month];
    
}
#pragma mark -   获取毫秒数
+ (NSTimeInterval)getCurrentMillisecond{
    NSString *recordTime = [NSString stringWithFormat:@"%.0f000", [[NSDate date] timeIntervalSince1970]];
    return [recordTime doubleValue];
}

#pragma mark -   日期转换为日期字符串
+ (NSString *)dateToDateString:(NSDate *)date {
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    return [dateFormatter stringFromDate:date];
}
#pragma mark -   获取本地当前时间
+ (NSDate *)getLocalCurrentDate {
    // 设置系统时区为本地时区
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    // 计算本地时区与 GMT 时区的时间差
    long long interval = [zone secondsFromGMT];
    // 在 GMT 时间基础上追加时间差值，得到本地时间
    NSDate *currentDate = [[NSDate date] dateByAddingTimeInterval:interval];
    return currentDate;
}
#pragma mark -  根据时间字符串和格式转换成日期
+ (NSDate *)dateWithString:(NSString *)time format:(NSString *)format {
    NSDateFormatter *inputFormatter = [[NSDateFormatter alloc] init];
    [inputFormatter setDateFormat:format];
    // 设置系统时区为本地时区
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    // 计算本地时区与 GMT 时区的时间差
    long long interval = [zone secondsFromGMT];
    NSDate *date = [inputFormatter dateFromString:time];
    // 在 GMT 时间基础上追加时间差值，得到本地时间
    date = [date dateByAddingTimeInterval:interval];
    return date;
}
#pragma mark -  获取day天后的日期(若day为负数,则为|day|天前的日期)
+ (NSDate *)dateAfterDay:(int)day {
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setDay:day];
    
    return [calendar dateByAddingComponents:components toDate:[NSDate date] options:0];
}
#pragma mark -  13位的时间戳转标准时间
+(NSString *)getTimeString_13:(NSString *)timeS{
    if (timeS.length <= 13) {
        NSString *timeStrStart = [NSString stringWithFormat:@"%@",timeS];
        timeStrStart = [timeStrStart substringToIndex:[timeStrStart length] - 3];
        NSDate  *localeDate = [NSDate dateWithTimeIntervalSince1970:[timeStrStart doubleValue]];
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        [dateFormatter setTimeZone:[NSTimeZone localTimeZone]];
        NSString *startDate = [dateFormatter stringFromDate:localeDate];
        return startDate;
    }else{
        return @"暂无";
    }
}
#pragma mark - 13位的时间戳转标准时间,只取日期部分
+(NSString *)getTimeStyle_YYYY_MM_DD_String_13:(NSString *)timeS{
    if (timeS.length <= 13) {
        NSString *timeStrStart;
        if (timeS.length <= 13 && timeS.length > 10) {
            timeStrStart = [NSString stringWithFormat:@"%@",timeS];
        }else{
            timeStrStart = [NSString stringWithFormat:@"%@000",timeS];
        }
        timeStrStart = [timeStrStart substringToIndex:[timeStrStart length] - 3];
        NSDate  *localeDate = [NSDate dateWithTimeIntervalSince1970:[timeStrStart doubleValue]];
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        [dateFormatter setTimeZone:[NSTimeZone localTimeZone]];
        NSString *startDate = [dateFormatter stringFromDate:localeDate];
        NSArray * arr = [startDate componentsSeparatedByString:@" "];
        return arr[0];
    }else{
        return @"暂无";
    }
}
#pragma mark - 13位的时间戳转标准时间,只取月和日
+(NSString *)getTimeStyle_MM_DD_String_13:(NSString *)timeS {
    if (timeS.length <= 13) {
        NSString *timeStrStart;
        if (timeS.length <= 13 && timeS.length > 10) {
            timeStrStart = [NSString stringWithFormat:@"%@",timeS];
        }else{
            timeStrStart = [NSString stringWithFormat:@"%@000",timeS];
        }
        timeStrStart = [timeStrStart substringToIndex:[timeStrStart length] - 3];
        NSDate  *localeDate = [NSDate dateWithTimeIntervalSince1970:[timeStrStart doubleValue]];
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        [dateFormatter setTimeZone:[NSTimeZone localTimeZone]];
        NSString *startDate = [dateFormatter stringFromDate:localeDate];
        NSArray * arr = [startDate componentsSeparatedByString:@" "];
        NSString *str = arr[0];
        return [str substringFromIndex:5];
    }else{
        return @"暂无";
    }
}

#pragma mark - 13位的时间戳转标准时间,只取时间部分
+(NSString *)getTimeStyle_HH_MM_SS_String_13:(NSString *)timeS{
    if (timeS.length <= 13) {
        NSString *timeStrStart = [NSString stringWithFormat:@"%@",timeS];
        timeStrStart = [timeStrStart substringToIndex:[timeStrStart length] - 3];
        NSDate  *localeDate = [NSDate dateWithTimeIntervalSince1970:[timeStrStart doubleValue]];
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        [dateFormatter setTimeZone:[NSTimeZone localTimeZone]];
        NSString *startDate = [dateFormatter stringFromDate:localeDate];
        NSArray * arr = [startDate componentsSeparatedByString:@" "];
        return arr[1];
    }else{
        return @"暂无";
    }
}

#pragma mark -  格林尼治时间时间转本地时间
+ (NSDate *)convertGMTDatetoLocalDate:(NSDate *)GMTDate {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    NSString *gmtDateStr = [dateFormatter stringFromDate:GMTDate];
    NSTimeZone *gmt = [NSTimeZone systemTimeZone];
    
    [dateFormatter setTimeZone:gmt];
    
    NSDate *GMTTime = [dateFormatter dateFromString:gmtDateStr];
    NSTimeZone *tz = [NSTimeZone localTimeZone];
    long long seconds = [tz secondsFromGMTForDate: GMTTime];
    return [NSDate dateWithTimeInterval: seconds sinceDate: GMTTime];
}

#pragma mark -  字符串日期的毫秒数
+ (long long)getMillisecondFromTime:(NSString*)time{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *date1=[dateFormatter dateFromString:time];
    return [date1 timeIntervalSince1970]*1000;
}
#pragma mark - 获取指定月的开始和结束日期
+ (NSString *)getMonthBeginAndEndWith:(NSString *)dateStr{
    
    NSDateFormatter *format=[[NSDateFormatter alloc] init];
    [format setDateFormat:@"yyyy-MM"];
    NSDate *newDate=[format dateFromString:dateStr];
    double interval = 0;
    NSDate *beginDate = nil;
    NSDate *endDate = nil;
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    [calendar setFirstWeekday:2];//设定周一为周首日
    BOOL ok = [calendar rangeOfUnit:NSCalendarUnitMonth startDate:&beginDate interval:&interval forDate:newDate];
    //分别修改为 NSDayCalendarUnit NSWeekCalendarUnit NSYearCalendarUnit
    if (ok) {
        endDate = [beginDate dateByAddingTimeInterval:interval-1];
    }else {
        return @"";
    }
    NSDateFormatter *myDateFormatter = [[NSDateFormatter alloc] init];
    [myDateFormatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    NSString *beginString = [myDateFormatter stringFromDate:beginDate];
    NSString *endString = [myDateFormatter stringFromDate:endDate];
    NSString *s = [NSString stringWithFormat:@"%@-%@",beginString,endString];
    return s;
}

#pragma mark - 根据时间获取时间戳,要传入时间格式
+(long long)timeSwitchTimestamp:(NSString *)formatTime Formatter:(NSString *)matter{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:matter];
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Beijing"];
    [formatter setTimeZone:timeZone];
    NSDate* date = [formatter dateFromString:formatTime]; //------------将字符串按formatter转成nsdate
    long long timeSp = [[NSNumber numberWithDouble:[date timeIntervalSince1970]] integerValue];
    return timeSp;
}
#pragma mark - 根据传入的秒数，获取是多长时间
+(NSString *)getTimeStrWithSecond:(long long)times{
    long long hour = times/3600;
    times = times%3600;
    long long minute = times/60;
    times = times%60;
    
    NSString *hourStr;
    NSString *minuteStr;
    NSString *secondStr;
    
    if(hour<10){
        hourStr = [NSString stringWithFormat:@"0%lld",hour];
    }else{
        hourStr = [NSString stringWithFormat:@"%lld",hour];
    }
    
    if(minute<10){
        minuteStr = [NSString stringWithFormat:@"0%lld",minute];
    }else{
        minuteStr = [NSString stringWithFormat:@"%lld",minute];
    }
    if(times<10){
        secondStr = [NSString stringWithFormat:@"0%lld",times];
    }else{
        secondStr = [NSString stringWithFormat:@"%lld",times];
    }
    NSString *time = [NSString stringWithFormat:@"%@:%@:%@",hourStr,minuteStr,secondStr];
    
    return time;
}

@end
