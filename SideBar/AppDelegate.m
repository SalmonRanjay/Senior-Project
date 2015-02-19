//
//  AppDelegate.m
//  SideBar
//
//  Created by Ranjay Salmon on 11/29/14.
//  Copyright (c) 2014 Ranjay Salmon. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
//    UIImage *navBackgroundImage = [UIImage imageNamed:@"nav_bg"];
//    [[UINavigationBar appearance] setBackgroundImage:navBackgroundImage forBarMetrics:UIBarMetricsDefault];
//    
//    [[UINavigationBar appearance] setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys:
//                                                           [UIColor colorWithRed:10.0/255.0 green:10.0/255.0 blue:10.0/255.0 alpha:1.0], UITextAttributeTextColor,
//                                                           [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.8],UITextAttributeTextShadowColor,
//                                                           [NSValue valueWithUIOffset:UIOffsetMake(0, 0)],
//                                                           UITextAttributeTextShadowOffset,
//                                                           [UIFont fontWithName:@"Helvetica-Light" size:20.0], UITextAttributeFont, nil]];
    
    // Customize nav bar
    [self customizeUserInterface];
    
    // Parse SDK Info
    [Parse setApplicationId:@"tvUQBsqRrTFS6ozB4SljcJsj5vNci3uFdkqpEc5B"
                  clientKey:@"gwyvAG08S3hsIre4YXDFRzKVFzgK1j6P1wJ2Ku4C"];
    [PFAnalytics trackAppOpenedWithLaunchOptions:launchOptions];
    
    // Request permission to use local notifications
    UIUserNotificationSettings *notificationSettings = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeBadge | UIUserNotificationTypeAlert | UIUserNotificationTypeSound categories:nil];
    
    // Register the local notifications
    [[UIApplication sharedApplication] registerUserNotificationSettings:notificationSettings];
    
    
    return YES;
}

// Method called once the app recieves a local notificaion
-(void) application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification{
    
    // check if the state of the application to see if the user is inside the app or in the lock screen or else
    if (application.applicationState == UIApplicationStateActive) {
        
        // user is inside the app
        
        // create an alert controller to display the notification body
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Notification" message:notification.alertBody preferredStyle:UIAlertControllerStyleAlert];
        
        // creating Uialert action for ignore button
        
        UIAlertAction *ignoreAction =[UIAlertAction actionWithTitle:@"Ignore" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
            
            NSLog(@"Ignored notification");
        }];
        
        // create a view action object to view the notification
        
        UIAlertAction *viewAction = [UIAlertAction actionWithTitle:@"View" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            
            [self takeActionWithLocalNotification:notification];
        }];
        
        
        // adding the actions to the alert controller
        [alertController addAction:ignoreAction];
        [alertController addAction:viewAction];
        
        // present the alert controller
        [self.window.rootViewController presentViewController:alertController animated:YES completion:^{
            
        }];
        
    }else{
        
        // user is outside the app
        [self takeActionWithLocalNotification:notification];
        
    }
}


- (void) takeActionWithLocalNotification:(UILocalNotification *) localNotification{
    
    //NSNumber *notification_id = localNotification.userInfo[@"id"];
    
    // create an alert view controller to display the message
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Reminder" message:@"You have a upcoming event" preferredStyle:UIAlertControllerStyleAlert];
    
    // addint an "OK" action to the alert controller
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        
        NSLog(@"OK");
        
    }];
    
    [alertController addAction:okAction];
    
    // present the view controller
    [self.window.rootViewController presentViewController:alertController animated:YES completion:^{
        
    }];
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

#pragma mark - Helper Methods


-(void) customizeUserInterface{
    
    // Customize navigation bar
//    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:1 green:0.4314 blue:0.1569 alpha:1]];
    
//     [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:1 green:0/255 blue:51/255 alpha:1]]; red nav bar
    
    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:0.0157 green:0.102 blue:0.3843 alpha:1]];
    
    // Setting the color of the text in the navigation bar
    [[UINavigationBar appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],UITextAttributeTextColor, nil]];
    
    // Set the color of the navigation bar buttons
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    
    
    
}

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}
@end
