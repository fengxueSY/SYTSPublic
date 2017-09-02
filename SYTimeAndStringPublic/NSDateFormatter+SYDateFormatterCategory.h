//
//  NSDateFormatter+SYDateFormatterCategory.h
//  SYTSPublic
//
//  Created by 666gps on 2017/9/2.
//  Copyright © 2017年 666gps. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDateFormatter (SYDateFormatterCategory)

+ (id)dateFormatter;
+ (id)dateFormatterWithFormat:(NSString *)dateFormat;

+ (id)defaultDateFormatter;/*yyyy-MM-dd HH:mm:ss*/

@end
