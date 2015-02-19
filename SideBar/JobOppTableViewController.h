//
//  JobOppTableViewController.h
//  SideBar
//
//  Created by Ranjay Salmon on 12/5/14.
//  Copyright (c) 2014 Ranjay Salmon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "MSCellAccessory.h"
#import "JobDetailViewController.h"

@interface JobOppTableViewController : PFQueryTableViewController


@property (weak, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;

@end
