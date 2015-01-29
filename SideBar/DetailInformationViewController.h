//
//  DetailInformationViewController.h
//  SideBar
//
//  Created by Ranjay Salmon on 12/4/14.
//  Copyright (c) 2014 Ranjay Salmon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import <EventKit/EventKit.h>


@interface DetailInformationViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *infoNameLabel;

@property (weak, nonatomic) IBOutlet UILabel *infoLocationLabel;


@property (weak, nonatomic) IBOutlet UILabel *infoCompanyLabel;

@property (nonatomic, strong) PFObject *infoObject;

@property (nonatomic, strong) NSDate *eventDate;

@property (weak, nonatomic) IBOutlet UILabel *infoDescriptionLabel;


@property (weak, nonatomic) IBOutlet UILabel *infoEventDate;

- (IBAction)addToCalendar:(id)sender;

@end
