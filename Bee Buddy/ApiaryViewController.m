//
//  ApiaryViewController.m
//  Bee Buddy
//
//  Created by Eric Newman on 5/21/15.
//  Copyright (c) 2015 Eric Newman. All rights reserved.
//

#import "ApiaryViewController.h"
#import "HiveCollectionViewCell.h"
#import "Hive.h"
#import "NewHiveInApiaryViewController.h"
#import "HiveController.h"
#import "ApiaryController.h"
#import "HiveTableViewController.h"

@interface ApiaryViewController () <UICollectionViewDataSource, UICollectionViewDelegate, UIGestureRecognizerDelegate>
@property (nonatomic, strong) NSArray *hiveArray;
@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation ApiaryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = self.apiary.name;
    self.hiveArray = self.apiary.hives.array;
    
    UILongPressGestureRecognizer *lpgr = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(handleLongPress:)];
    lpgr.minimumPressDuration = .5;
    lpgr.delegate = self;
    [self.collectionView addGestureRecognizer:lpgr];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.collectionView reloadData];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    

    if (indexPath.section == 0) {
    
    HiveCollectionViewCell *hiveCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"reuseHiveCell" forIndexPath:indexPath];
    Hive *hive = self.apiary.hives[indexPath.row];
    
        if (hive.apiary == self.apiary) {
            hiveCell.hiveLabel.text = hive.name;
            return hiveCell;
            
        }else{
            
        return nil;
        }
    
    }else{
        
    return nil;
    }

}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.hiveArray.count;
    
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
    
}

- (IBAction)addHive:(id)sender {
 
}

-(void)handleLongPress:(UILongPressGestureRecognizer *)gestureRecognizer{
    if (gestureRecognizer.state != UIGestureRecognizerStateEnded) {
        return;
    }
        CGPoint p = [gestureRecognizer locationInView:self.collectionView];
        
        NSIndexPath *indexPath = [self.collectionView indexPathForItemAtPoint:p];
        
        if (indexPath == nil) {
            NSLog(@"couldn't find index path");
        }else if (indexPath.section ==0){
            
            UIAlertController *hiveDeleteAlertController = [UIAlertController alertControllerWithTitle:nil message:@"Are you sure you would like to delete this hive?" preferredStyle:UIAlertControllerStyleAlert];
            
            [hiveDeleteAlertController addAction:[UIAlertAction actionWithTitle:@"Cancel" style:(UIAlertActionStyleCancel) handler:^(UIAlertAction *action) {
                nil;
            }]];
            
            [hiveDeleteAlertController addAction:[UIAlertAction actionWithTitle:@"Yes" style:(UIAlertActionStyleDestructive) handler:^(UIAlertAction *action) {
                [[HiveController sharedInstance] removeHive:self.apiary.hives[indexPath.item]];
                [self.collectionView reloadData];
            }]];
            
            [self presentViewController:hiveDeleteAlertController animated:YES completion:nil];
        }

    
    [self.collectionView reloadData];

}
- (IBAction)cancelButton:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
    
}

#pragma mark - Navigation


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

    if ([segue.identifier isEqualToString:@"presentNewHive"]) {
        NewHiveInApiaryViewController *newHive = segue.destinationViewController;
        
        newHive.apiary = self.apiary;

    }
    
    if([segue.identifier isEqualToString:@"apiaryHive"]){
 
        HiveTableViewController *hiveTableViewController = (HiveTableViewController *)segue.destinationViewController;
        NSIndexPath *indexPath = [self.collectionView indexPathForCell:(UICollectionViewCell *)sender];
        Hive *hive = self.apiary.hives[indexPath.row];
        
        hiveTableViewController.hive = hive;
        hiveTableViewController.navigationItem.title = hive.name;
        hiveTableViewController.inspectionsSet = hive.inspections;
        
        
    }
}

@end
