//
//  EventManager.h
//  SideBar
//
//  Created by Ranjay Salmon on 2/25/15.
//  Copyright (c) 2015 Ranjay Salmon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <EventKit/EventKit.h>

@interface EventManager : NSObject

+(void)testMethod:(NSString *)stringOne secondString:(NSString *)stringTwo;

+(BOOL) checkIfEventExistAlready:(NSCalendar *)cal eStore:(EKEventStore *) eStore eventdate:(NSDate *) eventDate eTitle:(NSString *) eTitle;

+ (void)requestCalendarAccess:(EKEvent *)event eventStore:(EKEventStore *)eventStore;



@end
