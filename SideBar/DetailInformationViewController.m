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
    self.infoTimeLabel.text = self.infoObject[@"time"];
    self.infoCompanyLabel.text = self.infoObject[@"company"];
    self.infoEventDate.text = self.infoObject[@"date"];
    self.infoDescriptionLabel.text = self.infoObject[@"description"];
    self.infoDescriptionLabel.lineBreakMode = NSLineBreakByWordWrapping;
    self.infoDescriptionLabel.numberOfLines = 0;
    
    self.eventDate = [[NSDate alloc] init];
    self.eventDate = self.infoObject[@"date"];
    NSLog(@"Date: %@",self.eventDate);
    
    NSLog(@"Time: %@",self.infoTimeLabel);

    NSLog(@"Company: %@",self.infoCompanyLabel);
    
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
//    NSDateComponents *comps = [[NSDateComponents alloc] init];
//    [comps setYear:2014];
//    [comps setMonth:12];
//    [comps setDay:5];
//    [comps setHour:9];
//    [comps setMinute:0];
//    [comps setTimeZone:[NSTimeZone systemTimeZone]];
//    NSCalendar *cal = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSDateFormatter  *dateformatter= [[NSDateFormatter alloc] init];
    //[dateformatter setTimeZone:[NSTimeZone systemTimeZone]];
    [dateformatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"GMT"]];
    [dateformatter setDateFormat:@"yyyy-MM-dd HH:mm "];
    NSDate *date = [dateformatter dateFromString:self.infoObject[@"date"]];
    
    NSLog(@"Date: %@",date);
    
    NSCalendar *cal = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *comps = [cal components:NSCalendarUnitDay | NSCalendarUnitYear |NSCalendarUnitMonth fromDate:date];
    
    NSDate *eventDateAndTime = [cal dateFromComponents:comps];
    
    // Set iCal Event
    EKEventStore *eventStore = [[EKEventStore alloc] init];
    
    EKEvent *event = [EKEvent eventWithEventStore:eventStore];
    event.title = self.infoObject[@"name"];
    
    event.startDate = eventDateAndTime;
    event.endDate = [[NSDate alloc] initWithTimeInterval:600 sinceDate:event.startDate];
    
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
}
@end
