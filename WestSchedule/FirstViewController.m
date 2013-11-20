//
//  FirstViewController.m
//  WestSchedule
//
//  Created by Adam Sanders on 9/27/13.
//  Copyright (c) 2013 Adam Sanders. All rights reserved.
//

#import "FirstViewController.h"
#import "CoreData.h"

@interface FirstViewController ()

@end

@implementation FirstViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.Picker.hidden = YES;
        
    self.currentClass = 0;
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
    
}


// returns the # of rows in each component
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    
    return [[[CoreData theData] ClassNames] count];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    NSLog(@"Selected Row %d", row);
    pickerView.hidden = YES;
   
    if (self.currentClass == 0)
    {
        self.Class1.text = [[[CoreData theData] ClassNames] objectAtIndex:row];        
    }
    
    else if (self.currentClass == 1)
    {
        self.Class2.text = [[[CoreData theData] ClassNames] objectAtIndex:row];
    }
    
    else if (self.currentClass == 2)
    {
        self.Class3.text = [[[CoreData theData] ClassNames] objectAtIndex:row];
    }
    
    else if (self.currentClass == 3)
    {
        self.Class4.text = [[[CoreData theData] ClassNames] objectAtIndex:row];   
    }
    
    else if (self.currentClass == 4)
    {
        self.Class5.text = [[[CoreData theData] ClassNames] objectAtIndex:row];  
    }
    
    else if (self.currentClass == 5)
    {
        self.Class6.text = [[[CoreData theData] ClassNames] objectAtIndex:row];   
    }
    
    else if (self.currentClass == 6)
    {
        
        self.Class7.text = [[[CoreData theData] ClassNames] objectAtIndex:row];
        
    }
    
    
    [[[CoreData theData] all7Classes] replaceObjectAtIndex:self.currentClass withObject:[[[CoreData theData] ClassNames] objectAtIndex:row ]];
    
    return;
    
    
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [[[CoreData theData] ClassNames] objectAtIndex:row];
    
}


- (IBAction)Change1:(id)sender {
    
    self.Picker.hidden = NO;
    self.currentClass = 0;
}


- (IBAction)Change2:(id)sender {
    
    self.Picker.hidden = NO;
    self.currentClass = 1;
}

- (IBAction)Change3:(id)sender {
    
    self.Picker.hidden = NO;
    self.currentClass = 2;
}

- (IBAction)Change4:(id)sender {
    
    self.Picker.hidden = NO;
    self.currentClass = 3;
}

- (IBAction)Change5:(id)sender {
    
    self.Picker.hidden = NO;
    self.currentClass = 4;
}

- (IBAction)Change6:(id)sender {
    
    self.Picker.hidden = NO;
    self.currentClass = 5;
}

- (IBAction)Change7:(id)sender {
    
    self.Picker.hidden = NO;
    self.currentClass = 6;
}

/*
 - (IBAction)ClearAll:(id)sender {

    self.Class1.text = @"Class 1";
    self.Class2.text = @"Class 2";
    self.Class3.text = @"Class 3";
    self.Class4.text = @"Class 4";
    self.Class5.text = @"Class 5";
    self.Class6.text = @"Class 6";
    self.Class7.text = @"Class 7";
}
  */



@end
