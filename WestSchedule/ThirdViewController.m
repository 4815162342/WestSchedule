//
//  ThirdViewController.m
//  WestSchedule
//
//  Created by Adam Sanders on 11/5/13.
//  Copyright (c) 2013 Adam Sanders. All rights reserved.
//

#import "ThirdViewController.h"
#import "CustomCell.h"
#import "CoreData.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    

    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"EEE, MMM d"];
    todaysDate = [formatter stringFromDate:[NSDate date]];
    Date.text = todaysDate;
    
    
    [[self Schedule]setDataSource:self];
    [[self Schedule]setDelegate:self];
    
    
    _tempClasses = [[NSMutableArray alloc] initWithObjects:@"Class 1", @"Class 2", @"Class 3", @"Class 4", @"Assembly",nil];
    
    /*
    [[self ScheduleTimes]setDataSource:self];
    [[self ScheduleTimes]setDelegate:self];
     */

    
    
}


-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.Schedule reloadData];
    
    [_tempClasses removeAllObjects];
    
    _tempClasses = [self dateParse:1];
    
    if ([Date.text hasPrefix:@"Mon"] || [Date.text hasPrefix:@"Tues"])
        [_tempClasses insertObject:@"PL/Arts" atIndex:3];
    
    else if ([Date.text hasPrefix:@"Wed"])
        [_tempClasses insertObject:@"Late Arrival" atIndex:0];

    else if ([Date.text hasPrefix:@"Thurs"])
        [_tempClasses insertObject:@"Assembly" atIndex:1];

    else if ([Date.text hasPrefix:@"Fri"])
        [_tempClasses insertObject:@"Early Dismissal" atIndex:4];

}



-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
    
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    return 5;
}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    //Method is run every time cell is loaded.
        
    static NSString *CellIdentifier = @"Cell";
    CustomCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    [[cell ScheduleClass1] setText: [_tempClasses objectAtIndex:indexPath.item]];
    //for all items:    indexPath.item
    return cell;
    
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSMutableArray *) dateParse:(int)day
{
    static NSMutableArray *tempClasses;
    
    switch (day)
    {
        case 0:
            tempClasses = [[NSMutableArray alloc] initWithObjects:[[[CoreData theData] all7Classes] subarrayWithRange:NSMakeRange(0, 3)], nil];
            break;
            
        case 1:
            
            tempClasses = [[NSMutableArray alloc] initWithObjects:[[[CoreData theData] all7Classes] subarrayWithRange:NSMakeRange(4, 6)], [[[CoreData theData] all7Classes] objectAtIndex: 0], nil];
            break;
            
        case 2:
            tempClasses = [[NSMutableArray alloc] initWithObjects:[[[CoreData theData] all7Classes] subarrayWithRange:NSMakeRange(1, 4)],nil];
            break;
            
        case 3:
            tempClasses = [[NSMutableArray alloc] initWithObjects:[[[CoreData theData] all7Classes] subarrayWithRange:NSMakeRange(5, 6)], [[[CoreData theData] all7Classes] subarrayWithRange:NSMakeRange(0, 1)],nil];
            break;
            
        case 4:
            tempClasses = [[NSMutableArray alloc] initWithObjects:[[[CoreData theData] all7Classes] subarrayWithRange:NSMakeRange(2, 5)], nil];
            break;
            
        case 5:
            tempClasses = [[NSMutableArray alloc] initWithObjects:[[[CoreData theData] all7Classes] objectAtIndex:6], [[[CoreData theData] all7Classes] subarrayWithRange:NSMakeRange(0, 2)], nil];
            break;
            
        case 6:
            tempClasses = [[NSMutableArray alloc] initWithObjects:[[[CoreData theData] all7Classes] subarrayWithRange:NSMakeRange(3, 6)], nil];
            break;
            
            
        default:
            tempClasses = [[NSMutableArray alloc] initWithObjects:[[[CoreData theData] all7Classes] subarrayWithRange:NSMakeRange(0, 3)], nil];
            break;
            
    }
    
    return tempClasses;
}



@end
