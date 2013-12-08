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
    
    
    _tempClasses = [[NSMutableArray alloc] initWithObjects: @"Class 1", @"Class 2", @"Class 3", @"Class 4", @"Assembly",nil];
    
    /*
    [[self ScheduleTimes]setDataSource:self];
    [[self ScheduleTimes]setDelegate:self];
     */

    
    
}


-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.Schedule reloadData];

    /*
    if ([_tempClasses count] > 5)
        [_tempClasses removeObjectsAtIndexes:[NSIndexSet indexSetWithIndexesInRange: NSMakeRange(5, [_tempClasses count]-1)]];
    */
    
    
    [_tempClasses replaceObjectsInRange: NSMakeRange(0, 4) withObjectsFromArray:[self dateParse:6]];
    
    
        
    if ([Date.text hasPrefix:@"Wed"])
        [_tempClasses insertObject:@"Late Arrival" atIndex:0];

    else if ([Date.text hasPrefix:@"Thu"])
        [_tempClasses insertObject:@"Assembly" atIndex:1];

    else if ([Date.text hasPrefix:@"Fri"])
        [_tempClasses addObject:@"Early Dismissal"];
    
    else
        [_tempClasses insertObject:@"PL/Arts" atIndex:3];
    
    NSLog(@"%@", _tempClasses);

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
    NSMutableArray *tempClasses = [[NSMutableArray alloc] initWithObjects:@"Test1", @"Test2", @"Test3", @"Test4", nil];
    
    switch (day)
    {
        case 0:
            [tempClasses replaceObjectsInRange:NSMakeRange(0, 4) withObjectsFromArray:[[[CoreData theData] all7Classes] subarrayWithRange:NSMakeRange(0, 4)]];
            break;
            
        case 1:
            [tempClasses replaceObjectsInRange:NSMakeRange(0, 3) withObjectsFromArray:[[[CoreData theData] all7Classes] subarrayWithRange:NSMakeRange(4, 3)]];
            [tempClasses replaceObjectAtIndex:3 withObject: [[[CoreData theData] all7Classes] objectAtIndex: 0]];
            break;
            
        case 2:
            [tempClasses replaceObjectsInRange:NSMakeRange(0, 4) withObjectsFromArray:[[[CoreData theData] all7Classes] subarrayWithRange:NSMakeRange(1, 4)]];
            break;
            
        case 3:
            [tempClasses replaceObjectsInRange:NSMakeRange(0, 2) withObjectsFromArray:[[[CoreData theData] all7Classes] subarrayWithRange:NSMakeRange(5, 2)]];
            [tempClasses replaceObjectsInRange:NSMakeRange(2, 2) withObjectsFromArray:[[[CoreData theData] all7Classes] subarrayWithRange:NSMakeRange(0, 2)]];
            break;
            
        case 4:
            [tempClasses replaceObjectsInRange:NSMakeRange(0, 4) withObjectsFromArray:[[[CoreData theData] all7Classes] subarrayWithRange:NSMakeRange(2, 4)]];
            break;
            
        case 5:
            [tempClasses replaceObjectAtIndex:0 withObject: [[[CoreData theData] all7Classes] objectAtIndex: 6]];
            [tempClasses replaceObjectsInRange:NSMakeRange(1, 3) withObjectsFromArray:[[[CoreData theData] all7Classes] subarrayWithRange:NSMakeRange(0, 3)]];
            break;
            
        case 6:
            [tempClasses replaceObjectsInRange:NSMakeRange(0, 4) withObjectsFromArray:[[[CoreData theData] all7Classes] subarrayWithRange:NSMakeRange(3, 4)]];
            break;
            
            
        default:
            [tempClasses replaceObjectsInRange:NSMakeRange(0, 4) withObjectsFromArray:[[[CoreData theData] all7Classes] subarrayWithRange:NSMakeRange(0, 4)]];
            break;
            
    }
    return tempClasses;
}


@end