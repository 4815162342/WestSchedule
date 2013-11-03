//
//  FirstViewController.h
//  WestSchedule
//
//  Created by Adam Sanders on 9/27/13.
//  Copyright (c) 2013 Adam Sanders. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController <UIPickerViewDataSource,UIPickerViewDelegate>


@property (strong, nonatomic) IBOutlet UILabel *Class1;

@property (strong, nonatomic) IBOutlet UIPickerView *Picker;




@property (strong, nonatomic) NSArray *ClassNames;


@end



