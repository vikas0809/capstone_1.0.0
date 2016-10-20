//
//  ProfileViewController.m
//  CapstoneProject
//
//  Created by Student on 2016-10-18.
//  Copyright © 2016 Student. All rights reserved.
//

#import "ProfileViewController.h"
#import "ViewController.h"
// facebook login headers
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

@interface ProfileViewController ()

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)doLogout:(UIButton *)sender {
    FBSDKLoginManager *loginManager = [[FBSDKLoginManager alloc] init];
    [loginManager logOut];
    
    
    if (![FBSDKAccessToken currentAccessToken]) {
        UIViewController *tbc = [self.storyboard instantiateViewControllerWithIdentifier:@"loginMain"];
        
        [self presentViewController:tbc animated:YES completion:nil];
    }

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
