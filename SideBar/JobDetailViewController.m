//
//  JobDetailViewController.m
//  SideBar
//
//  Created by Ranjay Salmon on 2/19/15.
//  Copyright (c) 2015 Ranjay Salmon. All rights reserved.
//

#import "JobDetailViewController.h"
#import "InformationSessionTableViewCell.h"

@interface JobDetailViewController ()

@end

@implementation JobDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.infoDescriptionLabel.text = self.infoObject[@"description"];
    
    self.eventDate = [[NSDate alloc] init];
    self.eventDate = self.infoObject[@"date"];
    NSLog(@"Date: %@",self.eventDate);
    
    self.titleArray = @[@"Job Title",@"Salary",@"Company",@"Deadline Date"];
    self.descriptionArray = @[ self.infoObject[@"name"],self.infoObject[@"salary_txt"],
                               self.infoObject[@"company"],self.infoObject[@"date"]];
    self.photoArray =  @[@"event-icon",@"Location-Map-icon",@"business-building-icon-black",@"callendar icon",@"event-icon"];

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.titleArray.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
//    UITableViewCell *cell = [self->tableView dequeueReusableCellWithIdentifier:@"jobCell"];
//    
//    cell.textLabel.text = [self.titleArray objectAtIndex:indexPath.row];
//    cell.detailTextLabel.text = [self.descriptionArray objectAtIndex:indexPath.row];
//    cell.imageView.image = [UIImage imageNamed:[self.photoArray objectAtIndex:indexPath.row]];
    InformationSessionTableViewCell *cell = [self->tableView dequeueReusableCellWithIdentifier:@"jobDetailCell"];
    
    [cell configureTableCellEntry:[self.titleArray objectAtIndex:indexPath.row] : [self.descriptionArray objectAtIndex:indexPath.row] : [self.photoArray objectAtIndex:indexPath.row]];
    
    return cell;
    
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)addToCalendar:(id)sender {
}

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

@end
