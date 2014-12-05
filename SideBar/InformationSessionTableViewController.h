//
//  InformationSessionTableViewController.h
//  SideBar
//
//  Created by Ranjay Salmon on 11/30/14.
//  Copyright (c) 2014 Ranjay Salmon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface InformationSessionTableViewController : PFQueryTableViewController

@property (weak, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;
@property(nonatomic,strong) NSArray *information;


- (IBAction)logout:(id)sender;


@end
