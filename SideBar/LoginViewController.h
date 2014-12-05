//
//  LoginViewController.h
//  SideBar
//
//  Created by Ranjay Salmon on 12/2/14.
//  Copyright (c) 2014 Ranjay Salmon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *userIDTextfield;

@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

- (IBAction)loginButton:(id)sender;

@end
