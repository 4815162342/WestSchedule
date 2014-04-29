//
//  MasterTableViewController.h
//  WMS Schedule
//
//  Created by Adam Sanders on 4/28/14.
//  Copyright (c) 2014 Adam Sanders. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MasterTableViewController : UITableViewController <UISearchBarDelegate>

@property (nonatomic, strong) NSMutableArray *results;

@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;

@end
