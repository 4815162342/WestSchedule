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

+(CoreData *) theData;


@end
