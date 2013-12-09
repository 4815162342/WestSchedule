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
@property (nonatomic, strong) NSMutableArray *timeArray;

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


/*
@property (weak, nonatomic) IBOutlet UILabel *Class1;

@property (weak, nonatomic) IBOutlet UILabel *Class2;

@property (weak, nonatomic) IBOutlet UILabel *Class3;

@property (weak, nonatomic) IBOutlet UILabel *Class4;

@property (weak, nonatomic) IBOutlet UILabel *Class5;

@property (weak, nonatomic) IBOutlet UILabel *Class6;

@property (weak, nonatomic) IBOutlet UILabel *Class7;
*/



+(CoreData *) theData;


@end
