#import "NSDateRotationScheduleFormatter.h"

@implementation NSDate (RotationScheduleFormatter)

+ (BOOL)aDateFromString:(NSString*)dateString isBetweenDate:(NSDate*)beginDate andDate:(NSDate*)endDate
{
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"yyyy-MM-dd"];
    NSDate *date = [df dateFromString:dateString];
    
    if ([date compare:beginDate] == NSOrderedAscending)
        return NO;
    
    if ([date compare:endDate] == NSOrderedDescending) 
        return NO;
    
    return YES;
}

+ (int)numberOfWeekdayBreakDaysBetweenSchoolYearBeginningDate:(NSDate *)beginningDate andEndDate:(NSDate *)endDate
{
    int numDays = 0;
    NSArray *weekdayBreakArray = [NSArray arrayWithObjects:@"2014-01-20", @"2014-03-10",@"2014-03-11",@"2014-03-12",@"2014-03-13",@"2014-03-14",@"2014-04-18",@"2014-04-21",nil];
    for (NSString *dateString in weekdayBreakArray)
    {
        if ([NSDate aDateFromString:dateString isBetweenDate:beginningDate andDate:endDate]) {
            numDays ++;
        }
    }
    return numDays;
}

+ (RotationDay)JL_currentRotationDayWithSchoolYearBeginningOnDateString:(NSString *)firstDateString
{
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"yyyy-MM-dd"];
    NSDate *firstDate = [df dateFromString:firstDateString];
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    
    // Get the current date
    NSDate *secondDate = [NSDate date];
    
    // Determine the day of the week for each date
    NSDateComponents *firstComponents = [calendar components:NSWeekdayCalendarUnit fromDate:firstDate];
    int weekday1 = [firstComponents weekday];
    NSDateComponents *secondComponents = [calendar components:NSWeekdayCalendarUnit fromDate:secondDate];
    int weekday2 = [secondComponents weekday];
    
    // Convert NSDates to integers we can perform math on
    int day1 = [firstDate timeIntervalSince1970]/(24*60*60);
    int day2 = [secondDate timeIntervalSince1970]/(24*60*60);
    
    // Do a bunch of math to handle when the days are on weekends etc
    int weekdays = 5 * (((day2 - weekday2) - (day1 - weekday1)) / 7);
    if(weekday1 == 1){ weekday1 = 2; }
    if(weekday2 == 7){ weekday2 = 6; }
    int finalCount = weekdays + weekday2 - weekday1 + 1;
    
    // Subtract holidays
    finalCount -= [NSDate numberOfWeekdayBreakDaysBetweenSchoolYearBeginningDate:firstDate andEndDate:secondDate];
    
    RotationDay currentRotationDay = (RotationDay)(finalCount % 7);
    
    return currentRotationDay;
}

+ (RotationDay)JL_futureRotationDayWithSchoolYearBeginningOnDateString: (NSString *)firstDateString futureDate: (NSString *)futureDate
{
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"yyyy-MM-dd"];
    NSDate *firstDate = [df dateFromString:firstDateString];
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    
    // Get the future date
    NSDate *secondDate = [df dateFromString:futureDate];
    
    // Determine the day of the week for each date
    NSDateComponents *firstComponents = [calendar components:NSWeekdayCalendarUnit fromDate:firstDate];
    int weekday1 = [firstComponents weekday];
    NSDateComponents *secondComponents = [calendar components:NSWeekdayCalendarUnit fromDate:secondDate];
    int weekday2 = [secondComponents weekday];
    
    // Convert NSDates to integers we can perform math on
    int day1 = [firstDate timeIntervalSince1970]/(24*60*60);
    int day2 = [secondDate timeIntervalSince1970]/(24*60*60);
    
    // Do a bunch of math to handle when the days are on weekends etc
    int weekdays = 5 * (((day2 - weekday2) - (day1 - weekday1)) / 7);
    if(weekday1 == 1){ weekday1 = 2; }
    if(weekday2 == 7){ weekday2 = 6; }
    int finalCount = weekdays + weekday2 - weekday1 + 1;
    
    // Subtract holidays
    finalCount -= [NSDate numberOfWeekdayBreakDaysBetweenSchoolYearBeginningDate:firstDate andEndDate:secondDate];
    
    RotationDay currentRotationDay = (RotationDay)(finalCount % 7);
    
    return currentRotationDay;
}

@end