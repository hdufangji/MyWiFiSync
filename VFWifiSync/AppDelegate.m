//
//  AppDelegate.m
//  VFWifiSync
//
//  Created by victor on 31/3/15.
//  Copyright (c) 2015 VF. All rights reserved.
//

#import "AppDelegate.h"
#import <Reachability.h>

@interface AppDelegate ()
{
    Reachability *wifiReachability;
}

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    /* UI Appearance Configuration */
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    [[UINavigationBar appearance] setTintColor:[UIColor blueColor]];
    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:0.0/255.0 green:204.0/255.0 blue:204.0/255.0 alpha:1.0]];
    
    UIColor *titleColor = [UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:1.0];
    UIFont *titleFont = [UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:21.0];
    
    [[UINavigationBar appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:titleColor, NSForegroundColorAttributeName, titleFont, NSFontAttributeName, nil]];
    
    /* MediaHome Wifi Sync Configuration */
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reachabilityChanged:) name:kReachabilityChangedNotification object:nil];
    wifiReachability = [Reachability reachabilityForLocalWiFi];
    [wifiReachability startNotifier];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void) reachabilityChanged: (NSNotification *)note
{
    Reachability *curReach = [note object];
    NSParameterAssert([curReach isKindOfClass:[Reachability class]]);
    
    NetworkStatus status = [curReach currentReachabilityStatus];
    
    switch (status) {
        case NotReachable:
            NSLog(@"wifi is not reachable.");
            break;
        case ReachableViaWiFi:
            NSLog(@"reachableViaWiFi");
            break;
        case ReachableViaWWAN:
            NSLog(@"ReachableViaWWAN");
            break;
        default:
            break;
    }
}

@end
