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
@property (nonatomic, strong) NSArray *sections;
@property (nonatomic, strong) NSArray *dates;




@end

@implementation HiveTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILongPressGestureRecognizer *lpgr = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(handleLongPress:)];
    lpgr.minimumPressDuration = .5;
    lpgr.delegate = self;
    [self.tableView addGestureRecognizer:lpgr];
    // Do any additional setup after loading the view.

   
//    //This will need to show which year an inspection has occurred in.
//    self.sections = @[@"2014", @"2015"];
//    
//    //This will show when an appointment is logged.
//    self.dates = @[@"April 25th", @"May 6th"];

    //self.inspectionsSet = self.hive.inspections;
    
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
    
//    //NSString *date = self.dates[indexPath.row];
//    if ([InspectionController sharedInstance].inspections.count == 0) {
//        return 0;
//    }else{

    InspectionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"inspectionCell"];
    
    Inspection *inspection = [InspectionController sharedInstance].inspections[indexPath.row];
    NSDateFormatter *format = [NSDateFormatter new];
    [format setDateFormat:@"MMM-dd"];
    NSString *dateString = [format stringFromDate:inspection.date];
    
    if (inspection != nil) {
        cell.date.text = [NSString stringWithFormat:@"%@",dateString];
        cell.notes.text = inspection.note;
        
        return cell;
    }else{
        return nil;
    }
//    cell.date.text = [NSString stringWithFormat:@"%@",dateString];
//    cell.notes.text = inspection.note;
//    
//    return cell;
//    
  
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    

    //return self.sections.count;
    return 2;
    
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return self.sections[section];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    switch (section) {
        case 0:
            return 0;
            break;
        case 1:
            return [InspectionController sharedInstance].inspections.count;
            break;
            
        default:
            return 0;
            break;
    }

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

// In a storyboard-based application, you will often want to do a little preparation before navigation
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
////     Get the new view controller using [segue destinationViewController].
//    if ([segue.identifier isEqualToString:@"addEntry"]) {
//        InspectionTableViewController *inspectionVC = [segue destinationViewController];
//    }
////     Pass the selected object to the new view controller.

    
//}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{

    
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
