//
//  WorkshopTableViewController.h
//  SideBar
//
//  Created by Ranjay Salmon on 11/30/14.
//  Copyright (c) 2014 Ranjay Salmon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SWRevealViewController.h"
#import "MSCellAccessory.h"
#import <Parse/Parse.h>

@interface WorkshopTableViewController : PFQueryTableViewController

@property (weak, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;

@end
