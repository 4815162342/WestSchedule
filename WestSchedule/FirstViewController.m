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
    self.tablePicker.hidden = YES;
        
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
    
    self.tablePicker.hidden = NO;
    self.currentClass = 0;
}


- (IBAction)Change2:(id)sender {
    
    self.tablePicker.hidden = NO;
    self.currentClass = 1;
}

- (IBAction)Change3:(id)sender {
    
    self.tablePicker.hidden = NO;
    self.currentClass = 2;
}

- (IBAction)Change4:(id)sender {
    
    self.tablePicker.hidden = NO;
    self.currentClass = 3;
}

- (IBAction)Change5:(id)sender {
    
    self.tablePicker.hidden = NO;
    self.currentClass = 4;
}

- (IBAction)Change6:(id)sender {
    
    self.tablePicker.hidden = NO;
    self.currentClass = 5;
}

- (IBAction)Change7:(id)sender {
    
    self.tablePicker.hidden = NO;
    self.currentClass = 6;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:  (NSInteger)section
{
    switch (section){
        case 0:
            return [[[CoreData theData] mathCourses] count];
            break;
        case 1:
            return [[[CoreData theData] scienceCourses] count];
            break;
        case 2:
            return [[[CoreData theData] englishCourses] count];
            break;
        case 3:
            return [[[CoreData theData] spanishCourses] count];
            break;
        case 4:
            return [[[CoreData theData] frenchCourses] count];
            break;
        case 5:
            return [[[CoreData theData] latinCourses] count];
            break;
        case 6:
            return [[[CoreData theData] chineseCourses] count];
            break;
        case 7:
            return [[[CoreData theData] historyCourses] count];
            break;
        case 8:
            return [[[CoreData theData] artCourses] count];
            break;
        case 9:
            return [[[CoreData theData] otherCourses] count];
            break;
        default:
            return 0;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 10;
}



- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:   (NSInteger)section
{
    switch (section){
        case 0:
            return @"Math Courses";
            break;
        case 1:
            return @"Science Courses";
            break;
        case 2:
            return @"English Courses";
            break;
        case 3:
            return @"Spanish Courses";
            break;
        case 4:
            return @"French Courses";
            break;
        case 5:
            return @"Latin Courses";
            break;
        case 6:
            return @"Chinese Courses";
            break;
        case 7:
            return @"History Courses";
            break;
        case 8:
            return @"Art Courses";
            break;
        case 9:
            return @"Other Courses";
            break;

        default:
            return 0;
    }
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:  (NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"allClasses"];
    
    switch (indexPath.section)
    {
            
        case 0:
            cell.textLabel.text = [[[CoreData theData] mathCourses] objectAtIndex:indexPath.row];
            break;
        case 1:
            cell.textLabel.text = [[[CoreData theData] scienceCourses] objectAtIndex:indexPath.row];
            break;
        case 2:
            cell.textLabel.text = [[[CoreData theData] englishCourses] objectAtIndex:indexPath.row];
            break;
        case 3:
            cell.textLabel.text = [[[CoreData theData] spanishCourses] objectAtIndex:indexPath.row];
            break;
        case 4:
            cell.textLabel.text = [[[CoreData theData] frenchCourses] objectAtIndex:indexPath.row];
            break;
        case 5:
            cell.textLabel.text = [[[CoreData theData] latinCourses] objectAtIndex:indexPath.row];
            break;
        case 6:
            cell.textLabel.text = [[[CoreData theData] chineseCourses] objectAtIndex:indexPath.row];
            break;
        case 7:
            cell.textLabel.text = [[[CoreData theData] historyCourses] objectAtIndex:indexPath.row];
            break;
        case 8:
            cell.textLabel.text = [[[CoreData theData] artCourses] objectAtIndex:indexPath.row];
            break;
        case 9:
            cell.textLabel.text = [[[CoreData theData] otherCourses] objectAtIndex:indexPath.row];
            break;

        default:
            cell.textLabel.text = @"Not Found";
            
    }
    
    return cell;
}


@end