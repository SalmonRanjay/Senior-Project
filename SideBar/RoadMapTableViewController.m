//
//  RoadMapTableViewController.m
//  SideBar
//
//  Created by Ranjay Salmon on 11/30/14.
//  Copyright (c) 2014 Ranjay Salmon. All rights reserved.
//

#import "RoadMapTableViewController.h"
#import "RoadMapTableViewCell.h"
#import <Parse/Parse.h>

@interface RoadMapTableViewController ()

@end

@implementation RoadMapTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // Set the side bar button action. When it's tapped, it'll show up the sidebar.
    self.sidebarButton.target = self.revealViewController;
    self.sidebarButton.action = @selector(revealToggle:);
    
    // Set the gesture
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    
    self.informationDescription = [[NSMutableArray alloc] init];
    self.informationTitle = [[NSMutableArray alloc] init];
    self.informationTime = [[NSMutableArray alloc] init];
    
    self.workshopDescription = [[NSMutableArray alloc] init];
    self.workshopTime = [[NSMutableArray alloc] init];
    self.workshopTitle = [[NSMutableArray alloc] init];
    
    self.jobTitle = [[NSMutableArray alloc] init];
    self.jobTime = [[NSMutableArray alloc] init];
    self.jobDescription = [[NSMutableArray alloc] init];
    
    
    // Request WorkShop Data
    
    
    // Request Job Data
    
//    self.arrayOne = @[@"Bob",@"tom",@"mary"];
//    self.arrayTwo = @[@"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis tincidunt leo id metus blandit, eget pulvinar felis efficitur. Fusce at magna ex. Etiam quis tincidunt tortor, ac malesuada sem. Maecenas ",@"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis tincidunt leo id metus blandit, eget pulvinar felis efficitur. Fusce at magna ex. Etiam quis tincidunt tortor, ac malesuada sem. Maecenas ",@"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis tincidunt leo id metus blandit, eget pulvinar felis efficitur. Fusce at magna ex. Etiam quis tincidunt tortor, ac malesuada sem. Maecenas "];
//    self.arrayThree = @[@"Pen",@"Book",@"Folder"];
    self.sectionTitle = @[@"Information Sessons",@"WorkShops",@"Jobs"];

}

- (void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    // Request Information session data
    
    PFQuery *query = [PFQuery queryWithClassName:@"Information_Sessions"];
    [query setLimit: 3];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // The find succeeded. The first 100 objects are available in objects
            for (PFObject *obj in objects) {
                NSLog(@"%@",obj[@"name"]);
                NSLog(@"%@",obj[@"description"]);
                NSLog(@"%@",obj[@"date"]);
                
                NSString *title = obj[@"name"];
                NSString *description = obj[@"description"];
                NSString *date = obj[@"date"];
                
                [self.informationTitle addObject:title];
                [self.informationDescription addObject: description];
                [self.informationTime addObject: date];
                [self.tableView reloadData];
            }
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
    
    PFQuery *wquery = [PFQuery queryWithClassName:@"Workshops"];
    [wquery setLimit: 3];
    [wquery findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // The find succeeded. The first 100 objects are available in objects
            for (PFObject *obj in objects) {
                
                NSString *title = obj[@"name"];
                NSString *description = obj[@"description"];
                NSString *date = obj[@"date"];
                
                [self.workshopTitle addObject:title];
                [self.workshopDescription addObject: description];
                [self.workshopTime addObject: date];
                [self.tableView reloadData];
            }
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
    
    
    PFQuery *jquery = [PFQuery queryWithClassName:@"Job"];
    [jquery setLimit: 3];
    [jquery findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // The find succeeded. The first 100 objects are available in objects
            for (PFObject *obj in objects) {
                NSLog(@"%@",obj[@"name"]);
                NSLog(@"%@",obj[@"description"]);
                NSLog(@"%@",obj[@"date"]);
                
                NSString *title = obj[@"name"];
                NSString *description = obj[@"description"];
                //NSString *date = obj[@"date"];
                
                [self.jobTitle addObject:title];
                [self.jobDescription addObject: description];
                //[self.jobTime addObject: date];
                [self.tableView reloadData];
            }
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];


    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return self.sectionTitle.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    
//    if (section == 0) {
//        return self.arrayOne.count;
//    }else if (section == 1){
//        return self.arrayTwo.count;
//    }else{
//        return self.arrayThree.count;
//    }
    return self.informationTitle.count;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return [self.sectionTitle objectAtIndexedSubscript:section];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"rMapCell" forIndexPath:indexPath];
    RoadMapTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"rMapCell" forIndexPath:indexPath];
    
    // Configure the cell...
    if (indexPath.section == 0) {
        //cell.textLabel.text = [self.arrayOne objectAtIndex:indexPath.row];
        [cell configureTableCellEntry:[self.informationTitle objectAtIndex:indexPath.row] :[self.informationDescription objectAtIndex:indexPath.row] :@"Letter-I-icon" : [self.informationTime objectAtIndex:indexPath.row]];
    }else if (indexPath.section == 1){
        //cell.textLabel.text = [self.arrayTwo objectAtIndex:indexPath.row];
        [cell configureTableCellEntry:[self.workshopTitle objectAtIndex:indexPath.row] :[self.workshopDescription objectAtIndex:indexPath.row] :@"Letter-W-icon" : [self.workshopTime objectAtIndex:indexPath.row]];
        
    }else{
      
       // cell.textLabel.text = [self.arrayThree objectAtIndex:indexPath.row];
        [cell configureTableCellEntry:[self.jobTitle objectAtIndex:indexPath.row] :[self.jobDescription objectAtIndex:indexPath.row] :@"Letter-J-icon" : @"N/A"];
    }
    
    return cell;
    
    
}

//-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
//    if(section == 1 )
//        return 0.000001f;
//    else return 44.0f; // put 22 in case of plain one..
//}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
