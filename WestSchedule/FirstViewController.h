//
//  FirstViewController.h
//  WestSchedule
//
//  Created by Adam Sanders on 9/27/13.
//  Copyright (c) 2013 Adam Sanders. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

{
    IBOutlet UIButton *Change1;
    IBOutlet UIButton *Change2;
    IBOutlet UIButton *Change3;
    IBOutlet UIButton *Change4;
    IBOutlet UIButton *Change5;
    IBOutlet UIButton *Change6;
    IBOutlet UIButton *Change7;
    IBOutlet UISwitch *lockClasses;
}

@property (strong, nonatomic) IBOutlet UITableView *tablePicker;



@property (strong, nonatomic) IBOutlet UILabel *Class1;
- (IBAction)Change1:(id)sender;


@property (weak, nonatomic) IBOutlet UILabel *Class2;
- (IBAction)Change2:(id)sender;


@property (weak, nonatomic) IBOutlet UILabel *Class3;
- (IBAction)Change3:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *Class4;
- (IBAction)Change4:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *Class5;
- (IBAction)Change5:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *Class6;
- (IBAction)Change6:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *Class7;
- (IBAction)Change7:(id)sender;


- (IBAction)lockClasses:(UISwitch *)sender;




@property (nonatomic, assign) int currentClass;

@end



