//
//  CoreData.m
//  WestSchedule
//
//  Created by Adam Sanders on 11/12/13.
//  Copyright (c) 2013 Adam Sanders. All rights reserved.
//

#import "CoreData.h"

@implementation CoreData

+(CoreData *) theData
{
    
    static CoreData *theData = nil;
    if (!theData)
    {
        theData = [[super allocWithZone:nil] init];
    }
    
    return theData;
}

+(NSString *)pickerToString
{
    
    return @"";
}



+(id) allocWithZone:(NSZone *)zone
{
    return [self theData];
}


-(id) init
{
    self = [super init];
    if (self)
    {
        //set up instance variables
        _all7Classes = [[NSMutableArray alloc] initWithObjects:
                        @"Period 1",
                        @"Period 2",
                        @"Period 3",
                        @"Period 4",
                        @"Period 5",
                        @"Period 6",
                        @"Period 7",
                        nil];
        _timeArray = [[NSArray alloc] initWithObjects:
                      
                      @"8:30-9:40",
                      @"9:55-11:05",
                      @"11:05-1:10",
                      @"1:10-1:45",
                      @"1:50-3:00",
                      
                      nil];

        _wednesdayArray = [[NSArray alloc] initWithObjects:
                      
                      @"8:30-9:00",
                      @"9:00-10:10",
                      @"10:25-11:35",
                      @"11:35-1:40",
                      @"1:50-3:00",
                      
                      nil];
        

        _thursdayArray = [[NSArray alloc] initWithObjects:
                           
                        @"8:30-9:40",
                        @"9:40-10:25",
                        @"10:25-11:35",
                        @"11:35-1:40",
                        @"1:50-3:00",
                        
                        nil];
        
        _fridayArray = [[NSArray alloc] initWithObjects:
                           
                        @"8:30-9:40",
                        @"9:55-11:05",
                        @"11:05-1:10",
                        @"11:35-1:40",
                        @"1:20-2:30",
                           
                        nil];
        
        
        _mathCourses = [[NSArray alloc] initWithObjects:
                        @"Geometry",
                        @"Geometry Honors",
                        @"Algebra II",
                        @"Algebra II Honors",
                        @"Pre-Calculus",
                        @"Honors Pre-Calculus",
                        @"Honors Calculus",
                        @"Calculus",
                        @"AP Calculus AB",
                        @"AP Calculus BC",
                        @"Statistics",
                        @"Statistics AP",
                        @"Multivariable Calculus",
                        nil];
        
        _scienceCourses = [[NSArray alloc] initWithObjects:
                           
                        @"Physics",
                        @"Physics Honors",
                        @"Chemistry",
                        @"Chemistry Honors",
                        @"Chemistry AP",
                        @"Biology",
                        @"Biology Honors",
                        @"Biology AP",
                        @"Physics AP: C",
                        @"Physics AP: E&M",
                        @"Environmental Science AP",
                        @"Neuropsychology",
                        @"Anatomy",
                        nil];
        
        _englishCourses = [[NSArray alloc] initWithObjects:
                           
                        @"English 9",
                        @"English 10",
                        @"English 11",
                        @"English 12",
                           nil];
        
        _spanishCourses = [[NSArray alloc] initWithObjects:
                            
                        @"Spanish I",
                        @"Spanish II",
                        @"Spanish II Honors",
                        @"Spanish III",
                        @"Spanish III Honors",
                        @"Spanish IV",
                        @"Spanish V",
                        @"Spanish VI",
                        @"Spanish VI Honors",
                        @"Spanish AP Language",
                        @"Spanish AP Literature",
                        nil];
        
        _frenchCourses = [[NSArray alloc] initWithObjects:
                          
                        @"French I",
                        @"French II",
                        @"French III",
                        @"French III Honors",
                        @"French IV",
                        @"French IV Honors",
                        @"French V",
                        @"French VI",
                        @"French VI Honors",
                        @"French VI Honors A",
                        @"French VI Honors B",
                        @"French AP Language",
                        nil];
        
        _latinCourses = [[NSArray alloc] initWithObjects:
                         
                         @"Latin I",
                         @"Latin II",
                         @"Latin III",
                         @"Latin III Honors",
                         @"Latin IV",
                         @"Latin IV Honors",
                         @"Latin V",
                         @"Latin AP",
                         nil];
        
        _chineseCourses = [[NSArray alloc] initWithObjects:
                           
                           @"Chinese I",
                           @"Chinese II",
                           @"Chinese III",
                           @"Chinese III Honors",
                           @"Chinese IV",
                           @"Chinese IV Honors",
                           @"Chinese V",
                           @"Chinese AP",
                           nil];
        
        _historyCourses = [[NSArray alloc] initWithObjects:
                           
                    @"Intro to History",
                    @"History of the Ancient World",
                    @"History of the Modern World",
                    @"European History AP",
                    @"American History",
                    @"American History AP",
                    nil];
        
        _artCourses = [[NSArray alloc] initWithObjects:
                       
                       @"Chorus",
                       @"Band",
                       @"Orchestra",
                       @"Theatre Arts",
                       @"Music Theory AP",
                       @"Dance",
                       @"Ceramics I",
                       @"Ceramics II",
                       @"Drawing and Painting I",
                       @"Drawing and Painting II",
                       @"Sculpture I",
                       @"Sculpture II",
                       @"Portfolio",
                       @"Portfolio 3D",
                       @"Photography I",
                       @"Photography II",
                       @"AP Studio Art: Drawing",
                       @"AP Studio Art: 2D Design",
                       @"AP Studio Art: 3D Design",
                       nil];
        
        _otherCourses = [[NSArray alloc] initWithObjects:
                         
                        @"Free Period",
                        @"Bible",
                        @"Coding Design",
                        @"Honors Computer Programming",
                        @"Creative Programming",
                        @"AP Computer Science",
                        @"Independent Study",
                        @"P.E.",
                        @"Peer Leadership",
                        nil];

        
        
    }
    
    return self;
}

@end
