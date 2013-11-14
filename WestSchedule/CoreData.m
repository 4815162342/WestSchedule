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
        
        _ClassNames = [[NSArray alloc] initWithObjects:
                       @"Geometry",
                       @"Geometry Honors",
                       @"Algebra",
                       @"Algebra Honors",
                       @"Pre-Calculus",
                       @"Honors Pre-Calculus",
                       @"Honors Calculus",
                       @"Calculus",
                       @"AP Calculus AB",
                       @"AP Calculus BC",
                       
                       @"Band",
                       @"Chorus",
                       @"Orchestra",
                       @"Ceramics",
                       @"2D Design",
                       @"3D Design",
                       @"Photography",
                       
                       
                       
                       @"Spanish III Honors",
                       @"English 9",
                       @"Physics Honors",
                       @"Bible OT",
                       @"Independent Study",
                       
                       
                       nil];
        

        
        
    }
    
    return self;
}

@end
