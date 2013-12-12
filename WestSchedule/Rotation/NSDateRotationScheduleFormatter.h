#import <Foundation/Foundation.h>

typedef enum {
    kRotationDayA = 1,
    kRotationDayB,
    kRotationDayC,
    kRotationDayD,
    kRotationDayE,
    kRotationDayF,
    kRotationDayG
} RotationDay;

@interface NSDate (RotationScheduleFormatter)

+ (BOOL)aDateFromString:(NSString*)dateString isBetweenDate:(NSDate*)beginDate andDate:(NSDate*)endDate;
+ (int)numberOfWeekdayBreakDaysBetweenSchoolYearBeginningDate:(NSDate *)beginningDate andEndDate:(NSDate *)endDate;

+ (RotationDay)JL_currentRotationDayWithSchoolYearBeginningOnDateString:(NSString *)firstDateString;
+ (RotationDay)JL_futureRotationDayWithSchoolYearBeginningOnDateString: (NSString *)firstDateString futureDate: (NSString *)futureDate;

@end