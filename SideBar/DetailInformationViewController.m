//
//  DetailInformationViewController.m
//  SideBar
//
//  Created by Ranjay Salmon on 12/4/14.
//  Copyright (c) 2014 Ranjay Salmon. All rights reserved.
//

#import "DetailInformationViewController.h"

@interface DetailInformationViewController ()

@end

@implementation DetailInformationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.infoNameLabel.text = self.infoObject[@"name"];
    self.infoLocationLabel.text = self.infoObject[@"location"];
    //self.infoTimeLabel.text = self.infoObject[@"time"];
    self.infoCompanyLabel.text = self.infoObject[@"company"];
    self.infoEventDate.text = self.infoObject[@"date"];
    self.infoDescriptionLabel.text = self.infoObject[@"description"];
    //self.infoDescriptionLabel.lineBreakMode = NSLineBreakByWordWrapping;
    //self.infoDescriptionLabel.numberOfLines = 0;
    
    self.eventDate = [[NSDate alloc] init];
    self.eventDate = self.infoObject[@"date"];
    NSLog(@"Date: %@",self.eventDate);
    
       
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)addToCalendar:(id)sender {
    
    // Set the Date and Time for the Event
    //NSDateComponents *comps = [[NSDateComponents alloc] init];
//    [comps setYear:2015];
//    [comps setMonth:01];
//    [comps setDay:29];
//    [comps setHour:5];
//    [comps setMinute:36];
//    [comps setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"EST"]];
    //NSCalendar *cal = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
//    NSDateFormatter  *dateformatter= [[NSDateFormatter alloc] init];
//    NSLocale *posix = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
//    [dateformatter setLocale:posix];
//    [dateformatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"EST"]];
//    [dateformatter setDateFormat:@"yyyy-MM-dd HH:mm "];
//    NSDate *date = [dateformatter dateFromString:self.infoObject[@"date"]];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    [dateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"]];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"EST"]];
    [dateFormatter setDateFormat:@"yyyy-MM-dd hh:mm a"];
    
    NSDate *date = [dateFormatter dateFromString:self.infoObject[@"date"]];
    
   
    
    NSLog(@"Date: %@",date);
    
    NSCalendar *cal = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    [cal setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"EST"]];
    [cal setLocale:[NSLocale currentLocale]];
    NSDateComponents *comps = [cal components:NSCalendarUnitDay | NSCalendarUnitYear |NSCalendarUnitMonth| NSCalendarUnitHour | NSCalendarUnitMinute fromDate:date];
    
    NSDate *eventDateAndTime = [cal dateFromComponents:comps];
    
    NSLog(@"Date from Date Comps: %@",eventDateAndTime);
    NSLog(@"Comps year: %ld",(long)comps.year);
    NSLog(@"Comps Month: %ld",(long)comps.month);
    NSLog(@"Comps Day00: %ld",(long)comps.day);
    NSLog(@"Comps hour: %ld",(long)comps.hour);
    NSLog(@"Comps minute: %ld",(long)comps.minute);
    
    
    // Set iCal Event
    EKEventStore *eventStore = [[EKEventStore alloc] init];
    
    EKEvent *event = [EKEvent eventWithEventStore:eventStore];
    event.title = self.infoObject[@"name"];
    
    event.startDate = eventDateAndTime;
    event.endDate = [[NSDate alloc] initWithTimeInterval:600 sinceDate:event.startDate];
    
    // Create a new alarm.
    //EKAlarm *alarm = [EKAlarm alarmWithAbsoluteDate:eventDateAndTime];
    // Add the alarm to the event.
    //[event addAlarm:alarm];
    
    
    [self createNotification:eventDateAndTime];
    
    
    
    // Check if App has Permission to Post to the Calendar
    [eventStore requestAccessToEntityType:EKEntityTypeEvent completion:^(BOOL granted, NSError *error) {
        if (granted){
            //---- code here when user allows your app to access their calendar.
            [event setCalendar:[eventStore defaultCalendarForNewEvents]];
            NSError *err;
            [eventStore saveEvent:event span:EKSpanThisEvent error:&err];
        }else
        {
            //----- code here when user does NOT allow your app to access their calendar.
            [event setCalendar:[eventStore defaultCalendarForNewEvents]];
            NSError *err;
            [eventStore saveEvent:event span:EKSpanThisEvent error:&err];
        }
    }];
    
    
    UIAlertView *alerview = [[UIAlertView alloc] initWithTitle:@"Event Synced" message:[NSString stringWithFormat:@"%@, Has been synced with your calendar",self.infoObject[@"name"]] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    
    [alerview show];
}

- (void)createNotification:(NSDate *)eventDateAndTime {
    // create the Local notification
    // Creating the local notificatin object
    UILocalNotification *localNotification = [[UILocalNotification alloc] init];
    
    // creating the fire date
    localNotification.fireDate = eventDateAndTime;
    
    // text displayed when the user is outside of the app
    localNotification.alertBody = [NSString stringWithFormat:@"%@, Reminder",self.infoObject[@"name"]];
    
    
    //    // badge app icon when notification is fired
    //    localNotification.applicationIconBadgeNumber = 3;
    
    // Setting the sound of the notification to the standard notification sound
    localNotification.soundName = UILocalNotificationDefaultSoundName;
    
    // Setting the sound with a custom sound
    //localNotification.soundName = @"Soundname.ext";
    
    
    // Adding information or data to the localnotification
    localNotification.userInfo = @{@"id":@42};
    
    // schedule the local notification with the app
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
}


@end
