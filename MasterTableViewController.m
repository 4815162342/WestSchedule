//
//  MasterTableViewController.m
//  WMS Schedule
//
//  Created by Adam Sanders on 4/28/14.
//  Copyright (c) 2014 Adam Sanders. All rights reserved.
//

#import "MasterTableViewController.h"
#import "CoreData.h"

@interface MasterTableViewController ()

@end

@implementation MasterTableViewController

- (NSMutableArray *)results
{
    if(!_results)
        _results = [[NSMutableArray alloc]init];
    return _results;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) searchThroughData
{
    self.results = nil;
    NSPredicate *resultsPredicate = [NSPredicate predicateWithFormat:@"SELF contains [search] %@", self.searchBar.text];
    
    self.results = [[[[CoreData theData]all7Classes] filteredArrayUsingPredicate:resultsPredicate] mutableCopy];
    
}

-(void) searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    [self searchThroughData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 10;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(tableView == self.tableView)
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
    
    else
    {
        [self searchThroughData];
        return self.results.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"allClasses"];
    
    
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"allClasses"];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    if(tableView == self.tableView)
    {
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
        
    }
    
    else{
        
        cell.textLabel.text = self.results[indexPath.row];
    }
    
    
    return cell;
}


-(void) tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(self.searchDisplayController.isActive)
    {
        [self performSegueWithIdentifier:@"showFirst" sender:self];
    }
    
}



/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showFirst"])
    {
        NSString *object = nil;
        NSIndexPath *indexPath = nil;
        
        
        if (self.searchDisplayController.isActive)
        {
            indexPath = [[self.searchDisplayController searchResultsTableView] indexPathForSelectedRow];
            object = self.results[indexPath.row];
        }
        
        else
        {
            indexPath = [self.tableView indexPathForSelectedRow];
        }
    }
}




@end
