//
//  JobOppTableViewController.m
//  SideBar
//
//  Created by Ranjay Salmon on 12/5/14.
//  Copyright (c) 2014 Ranjay Salmon. All rights reserved.
//

#import "JobOppTableViewController.h"
#import "SWRevealViewController.h"


@interface JobOppTableViewController ()

@end

@implementation JobOppTableViewController

- (id)initWithCoder:(NSCoder *)aCoder
{
    self = [super initWithCoder:aCoder];
    if (self) {
        // The className to query on
        self.parseClassName = @"Job";
        
        // The key of the PFObject to display in the label of the default cell style
        self.textKey = @"name";
        
        // Whether the built-in pull-to-refresh is enabled
        self.pullToRefreshEnabled = YES;
        
        // Whether the built-in pagination is enabled
        self.paginationEnabled = NO;
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Set the side bar button action. When it's tapped, it'll show up the sidebar.
    self.sidebarButton.target = self.revealViewController;
    self.sidebarButton.action = @selector(revealToggle:);
    
    // Set the gesture
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    
    
    // Parse Test Object

}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 1;
}

- (PFQuery *)queryForTable
{
    PFQuery *query = [PFQuery queryWithClassName:self.parseClassName];
    
    //[query whereKey:@"target_major" equalTo:@"Computer Science"];
    //query.cachePolicy = kPFCachePolicyCacheThenNetwork;
    
    return query;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
                        object:(PFObject *)object
{
    static NSString *cellIdentifier = @"Cell";
    
    PFTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[PFTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                      reuseIdentifier:cellIdentifier];
    }
    
    //self.information = self.objects;
    // Configure the cell to show todo item with a priority at the bottom
    cell.textLabel.text = object[@"name"];
    UIColor *disclosureColor =[UIColor colorWithRed:1 green:0 blue:51/255 alpha:1];
    cell.accessoryView = [MSCellAccessory accessoryWithType:FLAT_DISCLOSURE_INDICATOR color:disclosureColor];
    cell.imageView.image = [UIImage imageNamed:@"Letter-J-icon"];
    
    
    return cell;
}





#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    NSIndexPath *path =  [self.tableView indexPathForSelectedRow];
    if ([segue.identifier isEqualToString:@"showJobs"]) {
        
        JobDetailViewController *transferObject = (JobDetailViewController *)segue.destinationViewController;
        
        transferObject.infoObject = [self.objects objectAtIndex:path.row];
        
    }

}

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}



@end
