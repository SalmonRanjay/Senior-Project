//
//  InformationSessionTableViewController.h
//  SideBar
//
//  Created by Ranjay Salmon on 11/30/14.
//  Copyright (c) 2014 Ranjay Salmon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "MSCellAccessory.h"
#import "InformationSession.h"

@interface InformationSessionTableViewController : PFQueryTableViewController

@property (weak, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;
@property(nonatomic,strong) NSArray *information;


@property (nonatomic, strong) NSMutableArray *Sessions;

- (IBAction)logout:(id)sender;


@end
