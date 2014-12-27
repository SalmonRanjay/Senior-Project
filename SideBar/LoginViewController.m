//
//  LoginViewController.m
//  SideBar
//
//  Created by Ranjay Salmon on 12/2/14.
//  Copyright (c) 2014 Ranjay Salmon. All rights reserved.
//

#import "LoginViewController.h"
#import <Parse/Parse.h>

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //[self.navigationItem setHidesBackButton:YES];
    
    // Adjusting the background imageView in code
//    if ([UIScreen mainScreen].bounds.size.height == 568) {
//        self.backgroundImageView.image = [UIImage imageNamed:@"loginBG"];
//    }
    
    
    // setting the textfield's to be their own delegate
//    self.userIDTextfield.delegate = self;
//    self.passwordTextField.delegate = self;
}

- (void) viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    // Hide the navigation bar
    [self.navigationController.navigationBar setHidden:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)loginButton:(id)sender {
    
    NSString *userId = [[self.userIDTextfield.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] lowercaseString];
    
    NSString *password = [[self.passwordTextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] lowercaseString];
    
    if ([userId length ] == 0 || [password length] == 0) {
        
        UIAlertView *alerview = [[UIAlertView alloc] initWithTitle:@"Ooops" message:@"Please make sure you enter a User ID and password" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [alerview show];
    }else{
        
        // login in user
        [PFUser logInWithUsernameInBackground:userId password:password block:^(PFUser *user, NSError *error) {
            //
            if (!error) {
                // Login the user
                [self.navigationController popToRootViewControllerAnimated:YES];
                
            }else{
                
                // display error message
                UIAlertView *alertview = [[UIAlertView alloc] initWithTitle:@"Sorry" message:[error.userInfo objectForKey:@"error"] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                
                [alertview show];
                
            }
        }];

    }
    
   
    
    
}

# pragma mark - UITextFieldDelegates

// When a text field is pressed and the return key is hit it is dismissed
//- (BOOL) textFieldShouldReturn:(UITextField *)textField{
//    
//    [textField resignFirstResponder];
//    return YES;
//}
@end
