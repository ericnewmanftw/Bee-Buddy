//
//  HiveTableViewController.m
//  Bee Buddy
//
//  Created by Eric Newman on 5/13/15.
//  Copyright (c) 2015 Eric Newman. All rights reserved.
//

#import "HiveTableViewController.h"
#import "ViewController.h"
#import "InspectionTableViewCell.h"
#import "InspectionController.h"
#import "Stack.h"
#import "InspectionTableViewController.h"
#import "Inspection.h"




@interface HiveTableViewController () <UITableViewDataSource, UITableViewDelegate, UIGestureRecognizerDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation HiveTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILongPressGestureRecognizer *lpgr = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(handleLongPress:)];
    lpgr.minimumPressDuration = .5;
    lpgr.delegate = self;
    [self.tableView addGestureRecognizer:lpgr];
    
    // Do any additional setup after loading the view.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self.tableView reloadData];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    

    InspectionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"inspectionCell"];
    
    Inspection *inspection = self.hive.inspections[indexPath.row];
    NSDateFormatter *format = [NSDateFormatter new];
    [format setDateFormat:@"MMM-dd"];
    NSString *dateString = [format stringFromDate:inspection.date];
    
    if (inspection != nil) {
        cell.date.text = [NSString stringWithFormat:@"%@",dateString];
        cell.notes.text = inspection.note;
        if (inspection.image) {
            //cell.image.image =
        }
        
//        if (self.person.photo) {
//            profileImage = [UIImage imageWithContentsOfFile:[self documentsPathForFileName:self.person.photo]];
//            
//        } else {
//            [cell.button setTitle:@"Add Photo" forState:UIControlStateNormal];
//            profileImage = [UIImage imageWithData:self.photo];
//        }
//        
//        [cell.button setImage:profileImage forState:UIControlStateNormal];
        
        return cell;
    }else{
        return nil;
    }

}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
    
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    switch (section) {
        case 0:
            return self.hive.inspections.count;
            break;
            
        default:
            return 0;
            break;
    }

}
- (IBAction)cancelButton:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

        return [UIImage imageNamed:@"Hive"].size.height + 20.0;

}

-(void)handleLongPress:(UILongPressGestureRecognizer *)gestureRecognizer{
    if (gestureRecognizer.state != UIGestureRecognizerStateEnded) {
        return;
    }
    
    CGPoint p = [gestureRecognizer locationInView:self.tableView];
    NSIndexPath *indexPath = [self.tableView indexPathForRowAtPoint:p];
    
    if (indexPath == nil) {
        NSLog(@"Couldn't find Index Path");
        
    }else{
        
        [[InspectionController sharedInstance] removeInspection:[InspectionController sharedInstance].inspections[indexPath.item]];
    }
    
    [self.tableView reloadData];
    
}

#pragma mark - Navigation


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{

    if ([segue.identifier isEqualToString:@"addNew"]) {
        InspectionTableViewController *inspectionTableViewController = (InspectionTableViewController *)segue.destinationViewController;
        
        inspectionTableViewController.hive = self.hive;
        NSDateFormatter *format = [NSDateFormatter new];
        [format setDateFormat:@"MMM-dd"];
        NSString *dateString = [format stringFromDate:[NSDate date]];
        
        inspectionTableViewController.navigationItem.title = dateString;
    }
    if([segue.identifier isEqualToString:@"inspection"]){


        
        InspectionTableViewController *inspectionTableViewController = (InspectionTableViewController *)segue.destinationViewController;
        NSIndexPath *indexPath = [self.tableView indexPathForCell:(UITableViewCell *)sender];
        Inspection *inspection = [InspectionController sharedInstance].inspections[indexPath.row];
        
        inspectionTableViewController.inspection = inspection;
        
        NSDateFormatter *format = [NSDateFormatter new];
        [format setDateFormat:@"MMM-dd"];
        NSString *dateString = [format stringFromDate:inspection.date];
        
        inspectionTableViewController.navigationItem.title = dateString;
        
        inspectionTableViewController.queenSelected = inspection.queenSelected.boolValue;
        inspectionTableViewController.eggsSelected = inspection.eggsSelected.boolValue;
        inspectionTableViewController.oBroodSelected = inspection.openBSelected.boolValue;
        inspectionTableViewController.cBroodSelected = inspection.cappedBSelected.boolValue;
        inspectionTableViewController.cHoneySelected = inspection.cappedHoneySelected.boolValue;
        
        inspectionTableViewController.noteString = inspection.note;
        
        inspectionTableViewController.hive = self.hive;
    
        
    }
}


@end
