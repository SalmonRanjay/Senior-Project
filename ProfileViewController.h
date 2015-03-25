//
//  ProfileViewController.h
//  SideBar
//
//  Created by Ranjay Salmon on 3/22/15.
//  Copyright (c) 2015 Ranjay Salmon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SWRevealViewController.h"

@interface ProfileViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>{
    
    IBOutlet UITableView *tableView;
}

@property (nonatomic) NSArray *userArray;
@property (nonatomic) NSArray *test;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;

@property (weak, nonatomic) IBOutlet UIImageView *imageButton;

- (IBAction)imageButtonPressed:(id)sender;

@end
