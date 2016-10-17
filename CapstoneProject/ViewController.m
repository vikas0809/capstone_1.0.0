//
//  ViewController.m
//  CapstoneProject
//
//  Created by Student on 2016-10-13.
//  Copyright © 2016 Student. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //obscure password field
    _passwordField.secureTextEntry = YES;
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
