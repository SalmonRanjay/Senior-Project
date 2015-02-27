//
//  EventManager.m
//  SideBar
//
//  Created by Ranjay Salmon on 2/25/15.
//  Copyright (c) 2015 Ranjay Salmon. All rights reserved.
//

#import "EventManager.h"

@implementation EventManager

+(void)testMethod:(NSString *)stringOne secondString:(NSString *)stringTwo{
    
    NSLog(@"String One: %@, String Two: %@",stringOne,stringTwo);
}

+(BOOL)checkIfEventExistAlready:(NSCalendar *)cal eStore:(id)eStore eventdate:(NSDate *)eventDate eTitle:(NSString *)eTitle{
    
    NSPredicate *predicateForEvents = [eStore predicateForEventsWithStartDate:eventDate endDate:[[NSDate alloc] initWithTimeInterval:600 sinceDate:eventDate] calendars:[eStore calendarsForEntityType:EKEntityTypeEvent]];
    //set predicate to search for an event of the calendar(you can set the startdate, enddate and check in the calendars other than the default Calendar)
    NSArray *events_Array = [eStore eventsMatchingPredicate: predicateForEvents];
    //get array of events from the eventStore
    
    for (EKEvent *eventToCheck in events_Array)
    {
        if( [eventToCheck.title isEqualToString:eTitle])
        {
            
            NSLog(@"Event found: %@",eTitle);
            return true;
            break;
            
        }
    }
    return false;

}

+ (void)requestCalendarAccess:(EKEvent *)event eventStore:(EKEventStore *)eventStore {
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
