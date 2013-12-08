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
@property (strong, nonatomic) NSArray *ClassNames;



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
