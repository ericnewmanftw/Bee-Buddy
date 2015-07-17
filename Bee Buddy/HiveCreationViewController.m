//
//  HiveCreationViewController.m
//  Bee Buddy
//
//  Created by Eric Newman on 5/23/15.
//  Copyright (c) 2015 Eric Newman. All rights reserved.
//

#import "HiveCreationViewController.h"
#import "HiveController.h"
#import "ApiaryViewController.h"

@interface HiveCreationViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *locationField;
@property (nonatomic, strong) NSString *hiveName;


@end

@implementation HiveCreationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)saveButton:(id)sender {
    
    if ([self.nameField  isEqual: @""]) {
        NSLog(@"Error");
    }else{
        [[HiveController sharedInstance] addHiveWithData:self.nameField.text andLocation:self.locationField.text];
    }
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}
- (IBAction)cancelButton:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    
    return YES;
    
}

@end
