//
//  newViewController.m
//  Bee Buddy
//
//  Created by Eric Newman on 6/4/15.
//  Copyright (c) 2015 Eric Newman. All rights reserved.
//

#import "NewHiveInApiaryViewController.h"
#import "HiveController.h"

@interface NewHiveInApiaryViewController ()
@property (strong, nonatomic) IBOutlet UITextField *nameField;

@end

@implementation NewHiveInApiaryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveButton:(id)sender {
    if ([self.nameField isEqual: @""]) {
        NSLog(@"Error!");
        
    }else{
        [[HiveController sharedInstance] addHiveWithData:self.nameField.text andApiary:self.apiary];
    }
    
    [self.navigationController popViewControllerAnimated:YES];
}

@end
