//
//  ViewController.m
//  Bee Buddy
//
//  Created by Eric Newman on 4/29/15.
//  Copyright (c) 2015 Eric Newman. All rights reserved.
//

#import "ViewController.h"
#import "ApiaryCell.h"
#import "HiveCell.h"
#import "Stack.h"
#import "HiveController.h"
#import "ApiaryController.h"
#import "ApiaryViewController.h"
#import "HiveTableViewController.h"
#import "HiveViewController.h"


@interface ViewController () <UICollectionViewDelegate, UICollectionViewDataSource, UIGestureRecognizerDelegate>

@property (nonatomic, strong) NSArray *apiaryArray;
@property (nonatomic, strong) NSArray *hiveArray;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic, strong) Apiary *selectedApiary;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    UILongPressGestureRecognizer *lpgr = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(handleLongPress:)];
    lpgr.minimumPressDuration = .5;
    lpgr.delegate = self;
    [self.collectionView addGestureRecognizer:lpgr];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {


    if (indexPath.section == 0) {
        
        ApiaryCell *apiaryCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"apiaryID" forIndexPath:indexPath];
        
        Apiary *apiary = [ApiaryController sharedInstance].apiaries[indexPath.row];
        apiaryCell.apiaryLabel.text = apiary.name;
        
        if (apiaryCell !=nil) {
            return apiaryCell;
        }else{
            UICollectionViewCell *createNew = [collectionView dequeueReusableCellWithReuseIdentifier:@"createNew" forIndexPath:indexPath];
            return createNew;
        }
        

        
    }else if (indexPath.section ==1){
               HiveCell *hiveCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"hiveID" forIndexPath:indexPath];
        
                Hive *hive = [HiveController sharedInstance].hives[indexPath.row];
                //hiveCell.hiveLabel.text = hive.name;
        if (hive.apiary == NULL) {
            hiveCell.hiveLabel.text = hive.name;
            return hiveCell;
        }else{
            return nil;
        }
    
    
    }else{
        UICollectionViewCell *createNew = [collectionView dequeueReusableCellWithReuseIdentifier:@"createNew" forIndexPath:indexPath];
        
        return createNew;
    }

}



-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    if (section == 0) {
        return [ApiaryController sharedInstance].apiaries.count;
    }else if (section == 1){
        return [HiveController sharedInstance].hives.count;
    }else{
        return 1;
    }

}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 3;
    
}


-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self.collectionView reloadData];
}

-(void)handleLongPress:(UILongPressGestureRecognizer *)gestureRecognizer
{
    if (gestureRecognizer.state != UIGestureRecognizerStateEnded) {
        return;
    }
    
    CGPoint p = [gestureRecognizer locationInView:self.collectionView];
    
    NSIndexPath *indexPath = [self.collectionView indexPathForItemAtPoint:p];
    
    if (indexPath == nil){
        NSLog(@"couldn't find index path");
    } else if (indexPath.section == 0){
        //[[ApiaryController sharedInstance] removeApiary:[ApiaryController sharedInstance].apiaries[indexPath.item]];
        
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:@"Are you sure you would like to delete this apiary?" preferredStyle:UIAlertControllerStyleAlert];
        
        [alertController addAction:[UIAlertAction actionWithTitle:@"Cancel" style:(UIAlertActionStyleCancel) handler:^(UIAlertAction *action) {
            NSLog(@"Canceled");
        }]];
        
        [alertController addAction:[UIAlertAction actionWithTitle:@"Yes" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
            [[ApiaryController sharedInstance] removeApiary:[ApiaryController sharedInstance].apiaries[indexPath.item]];
            [self.collectionView reloadData];
        }]];
        [self presentViewController:alertController animated:YES completion:nil];
    }else if (indexPath.section == 1){

        //[[HiveController sharedInstance] removeHive:[HiveController sharedInstance].hives[indexPath.item]];
        UIAlertController *hiveDeleteAlertController = [UIAlertController alertControllerWithTitle:nil message:@"Are you sure you would like to delete this hive?" preferredStyle:UIAlertControllerStyleAlert];
        
        [hiveDeleteAlertController addAction:[UIAlertAction actionWithTitle:@"Cancel" style:(UIAlertActionStyleCancel) handler:^(UIAlertAction *action) {
            nil;
        }]];
        
        [hiveDeleteAlertController addAction:[UIAlertAction actionWithTitle:@"Yes" style:(UIAlertActionStyleDestructive) handler:^(UIAlertAction *action) {
            [[HiveController sharedInstance] removeHive:[HiveController sharedInstance].hives[indexPath.item]];
            [self.collectionView reloadData];
        }]];
        
        [self presentViewController:hiveDeleteAlertController animated:YES completion:nil];

    }
    [self.collectionView reloadData];
}

//UIAlertController *alertController = [UIAlertController alertControllerWithTitle:[self randomTitle] message:@"You only have 2 options:" preferredStyle:UIAlertControllerStyleAlert];
//
//[alertController addAction:[UIAlertAction actionWithTitle:@"Never again!" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
//    NSLog(@"I'll never show the alert again.");
//}]];
//
//[alertController addAction:[UIAlertAction actionWithTitle:@"Hit me baby" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
//    [self presentAlertViewController];
//}]];
//
//[self presentViewController:alertController animated:YES completion:nil];

//-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
//    NSLog(@"Working");
//}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if ([segue.identifier isEqualToString:@"apiary"]) {
        ApiaryViewController *apiaryViewController = (ApiaryViewController *)segue.destinationViewController;
        NSIndexPath *indexPath = [self.collectionView indexPathForCell:(UICollectionViewCell *)sender];
        Apiary *apiary = [ApiaryController sharedInstance].apiaries[indexPath.row];
        
        apiaryViewController.apiary = apiary;
        
    }
    
    if([segue.identifier isEqualToString:@"hive"]){
        
//        HiveViewController *hiveViewController = (HiveViewController *)segue.destinationViewController;
//        NSIndexPath *indexPath = [self.collectionView indexPathForCell:(UICollectionViewCell *)sender];
//        Hive *hive = [HiveController sharedInstance].hives[indexPath.row];
//        
        //hiveViewController.hive = hive;

        HiveTableViewController *hiveTableViewController = (HiveTableViewController *)segue.destinationViewController;
        NSIndexPath *indexPath = [self.collectionView indexPathForCell:(UICollectionViewCell *)sender];
        Hive *hive = [HiveController sharedInstance].hives[indexPath.row];
        
        hiveTableViewController.hive = hive;
        hiveTableViewController.navigationItem.title = hive.name;
        hiveTableViewController.inspectionsSet = hive.inspections;
        
        
        
        
        
    }
}

//-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
//    if ([segue.identifier isEqualToString:@"hive"]) {
//        HiveTableViewController *hiveViewController = (HiveTableViewController *)segue.destinationViewController;
//        NSIndexPath *indexPath = [self.collectionView indexPathForCell:(UICollectionViewCell *)sender];
//        Hive *hive = [HiveController sharedInstance].hives[indexPath.row];
//        
//        hiveViewController = hive;
//    }
//}


@end
