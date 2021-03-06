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
#import "TimeView.h"
#import "NSDateRotationScheduleFormatter.h"

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
    
    [[self Schedule]setDataSource:self];
    [[self Schedule]setDelegate:self];
    
    [[self timeView] setDataSource:self];
    [[self timeView]setDelegate:self];
    
    _tempClasses = [[NSMutableArray alloc] initWithObjects: @"Class 1", @"Class 2", @"Class 3", @"Class 4", @"Assembly",nil];
    _tempTimes = [[NSArray alloc] initWithObjects:@"8:30-9:40", @"9:55-11:05", @"11:05-1:10", @"1:10-1:40", @"#ERROR", nil];

    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"EEE, MMM d"];
    todaysDate = [formatter stringFromDate:[NSDate date]];
    Date.text = todaysDate;

    _datePicker.hidden=YES;
    _doneBar.hidden=YES;
    
    _datePicker.backgroundColor = [UIColor grayColor];
    
    [self updateScheduleDate: [NSDate JL_currentRotationDayWithSchoolYearBeginningOnDateString:@"2014-01-06"]];
    
    
    [self updateExtraPeriods];
}


-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.Schedule reloadData];
    [self.timeView reloadData];
    
    NSDateFormatter *futureDate = [[NSDateFormatter alloc] init];
    [futureDate setDateFormat:@"yyyy-MM-d"];

    [self updateScheduleDate: [NSDate JL_futureRotationDayWithSchoolYearBeginningOnDateString:@"2014-01-06" futureDate:[futureDate stringFromDate:_datePicker.date]]];
    
    [self updateExtraPeriods];
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
    
     if (collectionView == self.Schedule)
     {
         static NSString *CellIdentifier = @"Cell";
         CustomCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
         [[cell ScheduleClass1] setText: [_tempClasses objectAtIndex:indexPath.item]];
         return cell;
     }
    else
    {
        TimeView *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"TimeCell" forIndexPath:indexPath];
        [[cell timeCell] setText: [_tempTimes objectAtIndex:indexPath.item]];
        return cell;
    }
    //for all items:    indexPath.item
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


- (IBAction)changeButton:(id)sender {

    _datePicker.hidden=NO;
    _doneBar.hidden=NO;


}

- (IBAction)doneButton:(id)sender {
    
    _doneBar.hidden = YES;
    _datePicker.hidden = YES;
    
    NSDateFormatter *futureDate = [[NSDateFormatter alloc] init];
    [futureDate setDateFormat:@"EEE, MMM d"];
    Date.text=[futureDate stringFromDate:_datePicker.date];
    [self.Schedule reloadData];
    [self.timeView reloadData];
    
    [futureDate setDateFormat:@"yyyy-MM-d"];
    
    [self updateScheduleDate: [NSDate JL_futureRotationDayWithSchoolYearBeginningOnDateString:@"2014-01-06" futureDate:[futureDate stringFromDate:_datePicker.date]]];
    [self updateExtraPeriods];
    
}

- (IBAction)todayButton:(id)sender {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"EEE, MMM d"];
    todaysDate = [formatter stringFromDate:[NSDate date]];
    Date.text = todaysDate;
    
    [self.Schedule reloadData];
    [self.timeView reloadData];
    
    
    [self updateScheduleDate: [NSDate JL_currentRotationDayWithSchoolYearBeginningOnDateString:@"2014-01-06"]];
    [self updateExtraPeriods];
    
    _doneBar.hidden = YES;
    _datePicker.hidden = YES;
}

- (void) updateScheduleDate: (RotationDay) tempDayInt;
{
    if (tempDayInt == kRotationDayA) {
        scheduleDate.text = @"A day";
        [_tempClasses replaceObjectsInRange: NSMakeRange(0, 4) withObjectsFromArray:[self dateParse:0]];
    }
    else if (tempDayInt == kRotationDayB) {
        scheduleDate.text = @"B day";
        [_tempClasses replaceObjectsInRange: NSMakeRange(0, 4) withObjectsFromArray:[self dateParse:1]];
    }
    else if (tempDayInt == kRotationDayC) {
        scheduleDate.text = @"C day";
        [_tempClasses replaceObjectsInRange: NSMakeRange(0, 4) withObjectsFromArray:[self dateParse:2]];
    }
    else if (tempDayInt == kRotationDayD) {
        scheduleDate.text = @"D day";
        [_tempClasses replaceObjectsInRange: NSMakeRange(0, 4) withObjectsFromArray:[self dateParse:3]];
    }
    else if (tempDayInt == kRotationDayE) {
        scheduleDate.text = @"E day";
        [_tempClasses replaceObjectsInRange: NSMakeRange(0, 4) withObjectsFromArray:[self dateParse:4]];
    }
    else if (tempDayInt == kRotationDayF) {
        scheduleDate.text = @"F day";
        [_tempClasses replaceObjectsInRange: NSMakeRange(0, 4) withObjectsFromArray:[self dateParse:5]];
    }
    else {
        scheduleDate.text = @"G day";
        [_tempClasses replaceObjectsInRange: NSMakeRange(0, 4) withObjectsFromArray:[self dateParse:6]];
    }
    
    
}

- (void) updateExtraPeriods
{
    if ([Date.text hasPrefix:@"Wed"])
    {
        [_tempClasses insertObject:@"Late Arrival" atIndex:0];
        _tempTimes = [[CoreData theData] wednesdayArray];
    }
    
    else if ([Date.text hasPrefix:@"Thu"])
    {
        [_tempClasses insertObject:@"Assembly" atIndex:1];
        _tempTimes = [[CoreData theData] thursdayArray];
    }
    
    else if ([Date.text hasPrefix:@"Fri"] || [Date.text hasPrefix:@"Sat"] || [Date.text hasPrefix:@"Sun"])
    {
        [_tempClasses insertObject:@"Early Dismissal" atIndex:4];
        _tempTimes = [[CoreData theData] fridayArray];
    }

    else
    {
        [_tempClasses insertObject:@"PL/Arts" atIndex:3];
        _tempTimes = [[CoreData theData] timeArray];
    }
    
}
@end