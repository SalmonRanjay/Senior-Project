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
#import "InformationSessionTableViewCell.h"


@interface DetailInformationViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>{
    
    IBOutlet UITableView *tableView;
}


@property (nonatomic, strong) PFObject *infoObject;

@property (nonatomic, strong) NSDate *eventDate;

@property (weak, nonatomic) IBOutlet UILabel *infoDescriptionLabel;

@property (nonatomic) NSArray *titleArray;
@property (nonatomic) NSArray *descriptionArray;
@property (nonatomic) NSArray *photoArray;


- (IBAction)addToCalendar:(id)sender;

@end
