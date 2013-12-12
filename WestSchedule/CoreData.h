//
//  CoreData.h
//  WestSchedule
//
//  Created by Adam Sanders on 11/12/13.
//  Copyright (c) 2013 Adam Sanders. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CoreData : NSObject


@property (nonatomic, strong) NSMutableArray *all7Classes;
@property (nonatomic, strong) NSArray *timeArray;
@property (nonatomic, strong) NSArray *wednesdayArray;
@property (nonatomic, strong) NSArray *thursdayArray;
@property (nonatomic, strong) NSArray *fridayArray;



@property (strong, nonatomic) NSArray *mathCourses;
@property (strong, nonatomic) NSArray *scienceCourses;
@property (strong, nonatomic) NSArray *englishCourses;
@property (strong, nonatomic) NSArray *spanishCourses;
@property (strong, nonatomic) NSArray *frenchCourses;
@property (strong, nonatomic) NSArray *latinCourses;
@property (strong, nonatomic) NSArray *chineseCourses;
@property (strong, nonatomic) NSArray *historyCourses;
@property (strong, nonatomic) NSArray *artCourses;
@property (strong, nonatomic) NSArray *otherCourses;


+(CoreData *) theData;

+(NSString *) pickerToString;


@end
