//
//  SecondViewController.m
//  WestSchedule
//
//  Created by Adam Sanders on 9/27/13.
//  Copyright (c) 2013 Adam Sanders. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)Send:(id)sender {
    
    MFMailComposeViewController *mailController = [[MFMailComposeViewController alloc]init];
    [mailController setMailComposeDelegate:self];
    NSArray *address = [[NSArray alloc] initWithObjects: @"adamsanders@westminster.net", nil];
    NSString *message = [[self Message] text];
    [mailController setMessageBody:message isHTML:NO];
    [mailController setToRecipients:address];
    [mailController setSubject:@"Mail From WestSchedule"];
    [self presentViewController:mailController animated:YES completion:nil];
    
}

-(void)touchesBegan:(NSSet *) touches withEvent:(UIEvent *)event
{
    [[self Message] resignFirstResponder];
    
}


-(void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
@end
