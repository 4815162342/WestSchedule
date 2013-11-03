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


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
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
    
    self.Class1.text = [self.ClassNames objectAtIndex:row];
        
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [self.ClassNames objectAtIndex:row];
    
    
}





@end
