//
//  ViewController.m
//  CapstoneProject
//
//  Created by Student on 2016-10-13.
//  Copyright © 2016 Student. All rights reserved.
//

#import "ViewController.h"
#import "documentTabControllerViewController.h"


// facebook login headers
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>


FBSDKLoginManager *login;

@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //obscure password field
    _passwordField.secureTextEntry = YES;
    
    
}

-(void) getUserDetails
{
    FBSDKAccessToken* access_token =[FBSDKAccessToken currentAccessToken];
    NSLog(@"Access Token, %@",access_token);
    
    if ([FBSDKAccessToken currentAccessToken]) {
        [[[FBSDKGraphRequest alloc] initWithGraphPath:@"me" parameters:nil]
         startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
             if (!error) {
                 NSLog(@"fetched user:%@", result);
             }
         }];
    }
}

- (IBAction)facebookLoginButton:(UIButton *)sender {
    
    [self loginButtonClicked];
}


// Once the button is clicked, show the login dialog
-(void)loginButtonClicked
{
    if (![FBSDKAccessToken currentAccessToken]) {
    login = [[FBSDKLoginManager alloc] init];
    
    [login
     logInWithReadPermissions: @[@"public_profile", @"email", @"user_friends"]
     fromViewController:self
     handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
         if (error) {
             NSLog(@"%@",[error localizedDescription]);
             NSLog(@"Process error");
         } else if (result.isCancelled) {
             NSLog(@"Cancelled");
         } else {
             NSLog(@"Logged in");
             [self loggedIn];
         }
     }];
    }
    else
    {
        [self loggedIn];
    }
}

-(void)loggedIn
{
    UITabBarController *tbc = [self.storyboard instantiateViewControllerWithIdentifier:@"tabControllers"];
    tbc.selectedIndex=0;
    [self presentViewController:tbc animated:YES completion:nil];
}

- (IBAction)login:(id)sender {
    if([_emailField.text isEqualToString:@""] || [_passwordField.text isEqualToString:@""])
    {
        UIAlertView *error = [[UIAlertView alloc] initWithTitle:@"Validation Error" message:@"Please enter a valid username and password." delegate:self cancelButtonTitle: @"OK"otherButtonTitles: nil];
        
        [error show];
    }
    else
    {
       
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
