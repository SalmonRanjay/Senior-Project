//
//  PhotoViewController.h
//  SideBar
//
//  Created by Ranjay Salmon on 11/29/14.
//  Copyright (c) 2014 Ranjay Salmon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;

@property (weak, nonatomic) IBOutlet UIImageView *photoImageView;

@property (nonatomic, strong) NSString *photoFilename;



@end
