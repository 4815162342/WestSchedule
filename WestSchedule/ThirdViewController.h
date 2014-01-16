//
//  ThirdViewController.h
//  WestSchedule
//
//  Created by Adam Sanders on 11/5/13.
//  Copyright (c) 2013 Adam Sanders. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSDateRotationScheduleFormatter.h"

@interface ThirdViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate> {

    IBOutlet UILabel *Date;
    IBOutlet UILabel *scheduleDate;
    NSString *todaysDate;
    RotationDay *rotationDayInt;
}

@property (strong, nonatomic) NSMutableArray *tempClasses;
@property (strong, nonatomic) NSArray *tempTimes;
@property (weak, nonatomic) IBOutlet UICollectionView *Schedule;
@property (weak, nonatomic) IBOutlet UICollectionView *timeView;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (weak, nonatomic) IBOutlet UIToolbar *doneBar;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneButton;
@property (weak, nonatomic) IBOutlet UIButton *changeButton;



- (IBAction)changeButton:(id)sender;
- (IBAction)doneButton:(id)sender;
- (IBAction)todayButton:(id)sender;




//@property (weak, nonatomic) IBOutlet UICollectionView *ScheduleTimes;

- (NSMutableArray *) dateParse:(int)day;
- (void) updateScheduleDate: (RotationDay) rotationDayInt;
- (void) updateExtraPeriods;




@end
