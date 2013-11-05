//
//  FirstViewController.m
//  WestSchedule
//
//  Created by Adam Sanders on 9/27/13.
//  Copyright (c) 2013 Adam Sanders. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController
@synthesize ClassNames;
//@synthesize Change1;


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.Picker.hidden = YES;
    
    self.ClassNames = [[NSArray alloc] initWithObjects:
                       @"Geometry",
                       @"Geometry Honors",
                       @"Algebra",
                       @"Algebra Honors",
                       @"Pre-Calculus",
                       @"Honors Pre-Calculus",
                       @"Honors Calculus",
                       @"Calculus",
                       @"AP Calculus AB",
                       @"AP Calculus BC",
                       
                       @"Band",
                       @"Chorus",
                       @"Orchestra",
                       @"Ceramics",
                       @"2D Design",
                       @"3D Design",
                       @"Photography",
                       
                       
                       
                       @"Spanish III Honors",
                       @"English 9",
                       @"Physics Honors",
                       @"Bible OT",
                       @"Independent Study",
                       

                       nil];
    
    self.currentClass = 1;
    
    
    
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


// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    
    return [self.ClassNames count];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    NSLog(@"Selected Row %d", row);
    
    if (self.currentClass == 1)
    {
        self.Class1.text = [self.ClassNames objectAtIndex:row];
        pickerView.hidden = YES;
        return;
    }
    
    if (self.currentClass == 2)
    {
        self.Class2.text = [self.ClassNames objectAtIndex:row];
        pickerView.hidden = YES;
        return;
    }
    
    if (self.currentClass == 3)
    {
        self.Class3.text = [self.ClassNames objectAtIndex:row];
        pickerView.hidden = YES;
        return;
    }
    
    if (self.currentClass == 4)
    {
        self.Class4.text = [self.ClassNames objectAtIndex:row];
        pickerView.hidden = YES;
        return;
    }
    
    if (self.currentClass == 5)
    {
        self.Class5.text = [self.ClassNames objectAtIndex:row];
        pickerView.hidden = YES;
        return;
    }
    
    if (self.currentClass == 6)
    {
        self.Class6.text = [self.ClassNames objectAtIndex:row];
        pickerView.hidden = YES;
        return;
    }
    
    if (self.currentClass == 7)
    {
        self.Class7.text = [self.ClassNames objectAtIndex:row];
        pickerView.hidden = YES;
        return;
    }
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [self.ClassNames objectAtIndex:row];
    
}


- (IBAction)Change1:(id)sender {
    
    self.Picker.hidden = NO;
    self.currentClass = 1;
}


- (IBAction)Change2:(id)sender {
    
    self.Picker.hidden = NO;
    self.currentClass = 2;
}

- (IBAction)Change3:(id)sender {
    
    self.Picker.hidden = NO;
    self.currentClass = 3;
}

- (IBAction)Change4:(id)sender {
    
    self.Picker.hidden = NO;
    self.currentClass = 4;
}

- (IBAction)Change5:(id)sender {
    
    self.Picker.hidden = NO;
    self.currentClass = 5;
}

- (IBAction)Change6:(id)sender {
    
    self.Picker.hidden = NO;
    self.currentClass = 6;
}

- (IBAction)Change7:(id)sender {
    
    self.Picker.hidden = NO;
    self.currentClass = 7;
}

- (IBAction)ClearAll:(id)sender {

    self.Class1.text = @"Class 1";
    self.Class2.text = @"Class 2";
    self.Class3.text = @"Class 3";
    self.Class4.text = @"Class 4";
    self.Class5.text = @"Class 5";
    self.Class6.text = @"Class 6";
    self.Class7.text = @"Class 7";
    
}


@end
