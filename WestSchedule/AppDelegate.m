//
//  AppDelegate.m
//  WestSchedule
//
//  Created by Adam Sanders on 9/27/13.
//  Copyright (c) 2013 Adam Sanders. All rights reserved.
//

#import "AppDelegate.h"
#import "CoreData.h"


@implementation AppDelegate
@synthesize all7Classes;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    /*
    self.all7Classes = [[NSMutableArray alloc] initWithObjects:
                        @"Period 1",
                        @"Period 2",
                        @"Period 3",
                        @"Period 4",
                        @"Period 5",
                        @"Period 6",
                        @"Period 7",
                        nil];
    */
    
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSArray *loadArray = [defaults objectForKey:@"savedArray"];

    if ([loadArray objectAtIndex:0 ] != nil)
        [[[CoreData theData] all7Classes] setArray: loadArray ];
    
    UITabBar *tabBar = [UITabBar appearance];
    [tabBar setBackgroundImage:[UIImage imageNamed:@"Tab bar.png"]];
    
    
    
    UITabBarController *tabBarController = (UITabBarController *)self.window.rootViewController;
    tabBar = tabBarController.tabBar;
    UITabBarItem *tabBarItem0 = [tabBar.items objectAtIndex:0];
    UITabBarItem *tabBarItem1 = [tabBar.items objectAtIndex:1];
    UITabBarItem *tabBarItem2 = [tabBar.items objectAtIndex:2];
    
    [tabBarItem0 setImage:nil];
    [tabBarItem1 setImage:nil];
    [tabBarItem2 setImage:nil];

    
    
    
    // Override point for customization after application launch.
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    
    //SAVE THE CLASSES
    
    
    NSArray *saveArray = [[CoreData theData] all7Classes];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:saveArray forKey:@"savedArray"];
    [defaults synchronize];
    
    
    
}

@end
