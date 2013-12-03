//
//  ThirdViewController.h
//  WestSchedule
//
//  Created by Adam Sanders on 11/5/13.
//  Copyright (c) 2013 Adam Sanders. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ThirdViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate> {
    
    IBOutlet UILabel *Date;
    NSString *todaysDate;
    
}

@property (strong, nonatomic) NSMutableArray *tempClasses;
@property (weak, nonatomic) IBOutlet UICollectionView *Schedule;
//@property (weak, nonatomic) IBOutlet UICollectionView *ScheduleTimes;





@end
