//
//  RoadMapTableViewController.h
//  SideBar
//
//  Created by Ranjay Salmon on 11/30/14.
//  Copyright (c) 2014 Ranjay Salmon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SWRevealViewController.h"

@interface RoadMapTableViewController : UITableViewController

@property (weak, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;

@property (nonatomic, strong) NSMutableArray *informationTitle;
@property (nonatomic, strong) NSMutableArray *informationDescription;
@property (nonatomic, strong) NSMutableArray *informationTime;

@property (nonatomic, strong) NSMutableArray *workshopTitle;
@property (nonatomic, strong) NSMutableArray *workshopDescription;
@property (nonatomic, strong) NSMutableArray *workshopTime;

@property (nonatomic, strong) NSMutableArray *jobTitle;
@property (nonatomic, strong) NSMutableArray *jobDescription;
@property (nonatomic, strong) NSMutableArray *jobTime;


@property (nonatomic) NSArray *sectionTitle;


@end
