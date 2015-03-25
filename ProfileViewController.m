//
//  ProfileViewController.m
//  SideBar
//
//  Created by Ranjay Salmon on 3/22/15.
//  Copyright (c) 2015 Ranjay Salmon. All rights reserved.
//

#import "ProfileViewController.h"
#import <Parse/Parse.h>
#import <QuartzCore/QuartzCore.h>

@interface ProfileViewController ()<UIActionSheetDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate>


@property (nonatomic, strong) UIImage *pickedImage;

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // Set the side bar button action. When it's tapped, it'll show up the sidebar.
    self.sidebarButton.target = self.revealViewController;
    self.sidebarButton.action = @selector(revealToggle:);
    
    // Set the gesture
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    
    
    // Do any additional setup after loading the view.
    PFUser *currentUser = [PFUser currentUser];
    
    self.test = @[@"First Name: ",@"Last Name: ",@"Major: ",@"Gpa:",@"Classification:"];
    NSString *gpa = [currentUser[@"gpa"] stringValue];
    self.userArray = @[currentUser[@"first_name"],currentUser[@"last_name"],currentUser[@"major"],gpa,currentUser[@"classification"]];
    
    if([[self.userArray objectAtIndex:3] isKindOfClass:[NSNumber class]]){
        NSLog(@"is a number");
    }else{
        NSLog(@"not a string");
    }
    
    //self.imageButton.layer.cornerRadius = CGRectGetWidth(self.imageButton.frame) / 6.0f;
    self.imageButton.layer.cornerRadius = 8.0f;

    
    self.imageButton.layer.borderWidth = 3.0f;
    self.imageButton.layer.borderColor = [UIColor whiteColor].CGColor;
    

    
    
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                         NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString* path = [documentsDirectory stringByAppendingPathComponent:
                      @"test.png" ];
    UIImage* image = [UIImage imageWithContentsOfFile:path];
    self.imageButton.image = image;
    //[self.view addSubview:imageView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.test.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

        UITableViewCell *cell = [self->tableView dequeueReusableCellWithIdentifier:@"pCell"];
    
        cell.textLabel.text = [self.test objectAtIndex:indexPath.row];
        cell.detailTextLabel.text = [self.userArray objectAtIndex:indexPath.row];
    
    
    return cell;
    
    
}

- (void) actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if (buttonIndex != actionSheet.cancelButtonIndex) {
        
        if (buttonIndex != actionSheet.firstOtherButtonIndex) {
            [self promptForPhotoRoll];
        }else{
            [self promptforCamera];
        }
    }
}

// override setter for pickedImage

-(void) setPickedImage:(UIImage *)pickedImage{
    _pickedImage = pickedImage;
    
    if (pickedImage == nil) {
        //[self.imageButton setImage:[UIImage imageNamed:@"User"] forState:UIControlStateNormal];
        [self.imageButton setImage:[UIImage imageNamed:@"User"]];
    }else{
        //[self.imageButton setImage:pickedImage forState:UIControlStateNormal];
        [self.imageButton setImage:pickedImage];
    }
}

// handles after the user selsects an image
-(void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    
    picker.allowsEditing = YES;
    
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    self.pickedImage = image;
    
    // save image to disk
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                         NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString* path = [documentsDirectory stringByAppendingPathComponent:
                      @"test.png" ];
    //NSData* data = UIImagePNGRepresentation(image);
    NSData *data = UIImageJPEGRepresentation(image, 1.0);
    [data writeToFile:path atomically:YES];
    //self.imageButton.transform = CGAffineTransformMakeRotation(M_PI_2);
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

// handles if the user cancelled the image picker
- (void) imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    
    [self dismissViewControllerAnimated:YES completion:nil];
}




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)imageButtonPressed:(id)sender {
    
    // check if the camera is available
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        // prompt user for source
        [self promptForSource];
    }else{
        // prompt for photo roll image
        [self promptForPhotoRoll];
    }
}

#pragma Helper Methods

-(void) promptForSource{
    
    // crate action sheet with options to select source for camera
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Image Source" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Camera",@"Photo Roll", nil];
    
    [actionSheet showInView:self.view];
    
}

-(void) promptForPhotoRoll{
    
    // image picker to select from Photolibrary
    UIImagePickerController *controller = [[UIImagePickerController alloc] init];
    controller.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    controller.delegate = self;
    
    [self presentViewController:controller animated:YES completion:nil];
    
}

- (void) promptforCamera{
    
    // image picker to select from camera
    UIImagePickerController *controller = [[UIImagePickerController alloc] init];
    controller.sourceType = UIImagePickerControllerSourceTypeCamera;
    controller.delegate = self;
    
    [self presentViewController:controller animated:YES completion:nil];
}
@end
