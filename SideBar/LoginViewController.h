//
//  LoginViewController.h
//  SideBar
//
//  Created by Ranjay Salmon on 12/2/14.
//  Copyright (c) 2014 Ranjay Salmon. All rights reserved.
//

#import <UIKit/UIKit.h>

// To dismiss the keyboard when the return key is pressed
// let the class implement the <UITextFieldDelegate>
@interface LoginViewController : UIViewController 
@property (weak, nonatomic) IBOutlet UITextField *userIDTextfield;

@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

- (IBAction)loginButton:(id)sender;


@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;

@end
