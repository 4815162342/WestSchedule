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
    
    [[self ScheduleTimes]setDataSource:self];
    [[self ScheduleTimes]setDelegate:self];
    
}


-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
    
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    return 7;
}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"Cell";
    CustomCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    [[cell ScheduleClass1] setText:[[[CoreData theData] all7Classes]objectAtIndex:indexPath.item]];
    return cell;
    
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
