//
//  CreationViewController.m
//  Bee Buddy
//
//  Created by Eric Newman on 5/22/15.
//  Copyright (c) 2015 Eric Newman. All rights reserved.
//

#import "CreationViewController.h"
#import "ApiaryController.h"

@interface CreationViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *locationField;
@property (weak, nonatomic) IBOutlet UITextField *numberField;
@property (strong, nonatomic) IBOutlet UILabel *numberLabel;


@end

@implementation CreationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveButton:(id)sender {
    if ([self.nameField isEqual:@""]) {
        NSLog(@"Error!");
    }else{
        [[ApiaryController sharedInstance] addApiaryWithData:self.nameField.text andLocation:self.locationField.text andNumberOfHives:nil];
    }
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (IBAction)cancelButton:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    
    return YES;
}


@end
