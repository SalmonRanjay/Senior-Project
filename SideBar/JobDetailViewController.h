//
//  JobDetailViewController.h
//  SideBar
//
//  Created by Ranjay Salmon on 2/19/15.
//  Copyright (c) 2015 Ranjay Salmon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import <EventKit/EventKit.h>

@interface JobDetailViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>{
    
    IBOutlet UITableView *tableView;
}



@property (nonatomic, strong) PFObject *infoObject;
@property (nonatomic, strong) NSDate *eventDate;


@property (nonatomic) NSArray *titleArray;
@property (nonatomic) NSArray *descriptionArray;
@property (nonatomic) NSArray *photoArray;


@end
