//
//  DetailInformationViewController.m
//  SideBar
//
//  Created by Ranjay Salmon on 12/4/14.
//  Copyright (c) 2014 Ranjay Salmon. All rights reserved.
//

#import "DetailInformationViewController.h"
#import "InformationSessionTableViewCell.h"
#import "EventManager.h"

@interface DetailInformationViewController ()

@end

@implementation DetailInformationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.infoDescriptionLabel.text = self.infoObject[@"description"];
    //self.infoDescriptionLabel.lineBreakMode = NSLineBreakByWordWrapping;
    //self.infoDescriptionLabel.numberOfLines = 0;
    
    self.eventDate = [[NSDate alloc] init];
    self.eventDate = self.infoObject[@"date"];
    NSLog(@"Date: %@",self.eventDate);
    
    self.titleArray = @[@"Event Name",@"Location",@"Company",@"Event Date"];
    self.descriptionArray = @[ self.infoObject[@"name"],self.infoObject[@"location"],
                               self.infoObject[@"company"],self.infoObject[@"date"]];
    self.photoArray =  @[@"event-icon",@"Location-Map-icon",@"business-building-icon-black",@"callendar icon",@"event-icon"];
    
    // Initialize Calendar, Event and Date properties
    
    self.eventStore = [[EKEventStore alloc] init];
    
    self.event = [EKEvent eventWithEventStore:self.eventStore];
    
    self.cal = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    [self.cal setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"EST"]];
    [self.cal setLocale:[NSLocale currentLocale]];


    self.dateFormatter = [[NSDateFormatter alloc] init];
    
    [self.dateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"]];
    [self.dateFormatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"EST"]];
    [self.dateFormatter setDateFormat:@"yyyy-MM-dd hh:mm a"];
    
           
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.titleArray.count;
}


-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    InformationSessionTableViewCell *cell = [self->tableView dequeueReusableCellWithIdentifier:@"infoCell"];
    
    [cell configureTableCellEntry:[self.titleArray objectAtIndex:indexPath.row] : [self.descriptionArray objectAtIndex:indexPath.row] : [self.photoArray objectAtIndex:indexPath.row]];
    
    return cell;
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
    
    // Create date object from string
    NSDate *date = [self.dateFormatter dateFromString:self.infoObject[@"date"]];
    
    // create date componenets for calendar
    NSDateComponents *comps = [self.cal components:NSCalendarUnitDay | NSCalendarUnitYear |NSCalendarUnitMonth| NSCalendarUnitHour | NSCalendarUnitMinute fromDate:date];
    
    // create date object for event from the date comps
    NSDate *eventDateAndTime = [self.cal dateFromComponents:comps];
    
     NSLog(@"Date: %@",eventDateAndTime);
//    
    if ([EventManager checkIfEventExistAlready:self.cal eStore:self.eventStore eventdate:eventDateAndTime eTitle:self.infoObject[@"name"]]) {
        NSLog(@"YURIKA!!!");
        
        UIAlertView *alert =[[UIAlertView alloc] initWithTitle:@"Caution!!" message:@"Event Already Added to calendar" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [alert show];
    }else{
    
        // Set iCal Event
        self.event.title = self.infoObject[@"name"];
        self.event.notes = self.infoObject[@"description"];
        self.event.startDate = eventDateAndTime;
        self.event.endDate = [[NSDate alloc] initWithTimeInterval:600 sinceDate:self.event.startDate];
        
        // Create a new alarm.
        //EKAlarm *alarm = [EKAlarm alarmWithAbsoluteDate:eventDateAndTime];
        // Add the alarm to the event.
        //[event addAlarm:alarm];
        
        
        [EventManager requestCalendarAccess:self.event eventStore:self.eventStore];
        [self createNotification:eventDateAndTime withBodyText:self.infoObject[@"name"]];
        
        // Show alert that event has synced
        UIAlertView *alerview = [[UIAlertView alloc] initWithTitle:@"Event Synced" message:[NSString stringWithFormat:@"%@, Has been synced with your calendar",self.infoObject[@"name"]] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [alerview show];
    }
    
    
   
}


- (void)createNotification:(NSDate *)eventDateAndTime withBodyText:(NSString *) bodytext {
    // create the Local notification
    // Creating the local notificatin object
    UILocalNotification *localNotification = [[UILocalNotification alloc] init];
    
    // creating the fire date
    localNotification.fireDate = eventDateAndTime;
    
    // text displayed when the user is outside of the app
    localNotification.alertBody = [NSString stringWithFormat:@"%@, Reminder",bodytext];
    
    
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

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}


@end
