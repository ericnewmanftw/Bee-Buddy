//
//  NotesViewController.m
//  Bee Buddy
//
//  Created by Eric Newman on 5/20/15.
//  Copyright (c) 2015 Eric Newman. All rights reserved.
//

#import "NotesViewController.h"

@interface NotesViewController ()

@end

@implementation NotesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.notesText.text = self.noteString;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)saveButton:(id)sender {
    
    InspectionTableViewController *inspectionTableViewController = [InspectionTableViewController new];
    
    inspectionTableViewController.noteString = self.notesText.text;
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (IBAction)cancelButton:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
