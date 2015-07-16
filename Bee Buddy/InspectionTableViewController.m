//
//  InspectionTableViewController.m
//  Bee Buddy
//
//  Created by Eric Newman on 5/19/15.
//  Copyright (c) 2015 Eric Newman. All rights reserved.
//

#import "InspectionTableViewController.h"
#import "ImageTableViewCell.h"
#import "InspectionController.h"
#import "NotesViewController.h"


@interface InspectionTableViewController () <photoCellDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>


@property (nonatomic, strong) NSArray *inspectionItems;


@end

@implementation InspectionTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    

    self.inspectionItems = @[@"Queen", @"Eggs", @"Open Brood", @"Capped Brood", @"Capped Honey"];
    



}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    [self.tableView reloadData];
}

#pragma mark - Table view data source



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    
    [tableView reloadData];
    
    UITableViewCell *cell = (UITableViewCell*)[tableView cellForRowAtIndexPath:indexPath];
    
    switch (indexPath.row) {
        case 0:
            if (self.queenSelected == NO) {
                [cell setBackgroundColor:[UIColor greenColor]];
                self.queenSelected = YES;
            }else{
                [cell setBackgroundColor:[UIColor whiteColor]];
                 self.queenSelected = NO;
            }
            break;
        case 1:
            if (self.eggsSelected == NO) {
                [cell setBackgroundColor:[UIColor greenColor]];
                self.eggsSelected = YES;
            }else{
                [cell setBackgroundColor:[UIColor whiteColor]];
                self.eggsSelected = NO;
            }
            break;
        case 2:
            if (self.oBroodSelected == NO) {
                [cell setBackgroundColor:[UIColor greenColor]];
                self.oBroodSelected = YES;
            }else{
                [cell setBackgroundColor:[UIColor whiteColor]];
                self.oBroodSelected = NO;
            }
            break;
        case 3:
            if (self.cBroodSelected == NO) {
                [cell setBackgroundColor:[UIColor greenColor]];
                self.cBroodSelected = YES;
            }else{
                [cell setBackgroundColor:[UIColor whiteColor]];
                self.cBroodSelected = NO;
            }
            break;
        case 4:
            if (self.cHoneySelected == NO){
                [cell setBackgroundColor:[UIColor greenColor]];
                self.cHoneySelected = YES;
            }else{
                [cell setBackgroundColor:[UIColor whiteColor]];
                self.cHoneySelected = NO;
            }
            break;
        

            
        default:
            break;
    }
    


}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.inspectionItems.count + 3;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    if (indexPath.row == 0) {
        UITableViewCell *basicCell = [tableView dequeueReusableCellWithIdentifier:@"basicCell"];
        basicCell.textLabel.text = self.inspectionItems[indexPath.row];
        if (self.queenSelected == NO) {
            [basicCell setBackgroundColor:[UIColor whiteColor]];
        }else{
            [basicCell setBackgroundColor:[UIColor greenColor]];
        }
        return basicCell;
        
    }else if (indexPath.row == 1){
        UITableViewCell *basicCell = [tableView dequeueReusableCellWithIdentifier:@"basicCell"];
        basicCell.textLabel.text = self.inspectionItems[indexPath.row];
        if (self.eggsSelected == NO) {
            [basicCell setBackgroundColor:[UIColor whiteColor]];
        }else{
            [basicCell setBackgroundColor:[UIColor greenColor]];
        }
        return basicCell;
        
    }else if (indexPath.row == 2){
        UITableViewCell *basicCell = [tableView dequeueReusableCellWithIdentifier:@"basicCell"];
        basicCell.textLabel.text = self.inspectionItems[indexPath.row];
        if (self.oBroodSelected == NO) {
            [basicCell setBackgroundColor:[UIColor whiteColor]];
        }else{
            [basicCell setBackgroundColor:[UIColor greenColor]];
        }
        return basicCell;
        
    }else if (indexPath.row == 3){
        UITableViewCell *basicCell = [tableView dequeueReusableCellWithIdentifier:@"basicCell"];
        basicCell.textLabel.text = self.inspectionItems[indexPath.row];
        if (self.cBroodSelected == NO) {
            [basicCell setBackgroundColor:[UIColor whiteColor]];
        }else{
            [basicCell setBackgroundColor:[UIColor greenColor]];
        }
        return basicCell;
        
    }else if (indexPath.row == 4){
        UITableViewCell *basicCell = [tableView dequeueReusableCellWithIdentifier:@"basicCell"];
        basicCell.textLabel.text = self.inspectionItems[indexPath.row];
        if (self.cHoneySelected == NO) {
            [basicCell setBackgroundColor:[UIColor whiteColor]];
        }else{
            [basicCell setBackgroundColor:[UIColor greenColor]];
        }
        return basicCell;
        
    }
    else if (indexPath.row == 5){
        UITableViewCell *notesCell = [tableView dequeueReusableCellWithIdentifier:@"notesCell"];
        notesCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        return notesCell;
        
    }else if (indexPath.row == 6){
        
        ImageTableViewCell *imageCell = [tableView dequeueReusableCellWithIdentifier:@"imageCell"];
        imageCell.delegate = self;
        UIImage *inspectionImage;
        
        if (self.dateString) {
            inspectionImage = [UIImage imageWithContentsOfFile:[self documentsPathForFileName:self.dateString]];
        }
        
        [imageCell.button setImage:inspectionImage forState:UIControlStateNormal];
        
        //    if (self.person.photo) {
        //        profileImage = [UIImage imageWithContentsOfFile:[self documentsPathForFileName:self.person.photo]];
        //
        //    } else {
        //        [cell.button setTitle:@"Add Photo" forState:UIControlStateNormal];
        //        profileImage = [UIImage imageWithData:self.photo];
        //    }
        //
        //    [cell.button setImage:profileImage forState:UIControlStateNormal];
        
        return imageCell;
        
    }else{
        UITableViewCell *deleteCell = [tableView dequeueReusableCellWithIdentifier:@"deleteCell"];
        return deleteCell;
    }

}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 6) {
        return [UIImage imageNamed:@"queen"].size.height + 20.0;
    } else {
        return 44;
    }
}

- (IBAction)cancelButton:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)imageTapped{

    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    [self presentViewController:picker animated:YES completion:NULL];
    
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    NSData *chosenImage = info[UIImagePickerControllerEditedImage];
    UIImage *chosenImageWithData = [UIImage imageWithData:chosenImage];

    ImageTableViewCell *buttonCell = [ImageTableViewCell new];

    [buttonCell.button setImage:chosenImageWithData forState:UIControlStateNormal];
    
    NSDate *currentDate = [NSDate date];
    
    NSString *dateString = [NSString stringWithFormat:@"%@", currentDate];
    
    [chosenImage writeToFile:[self documentsPathForFileName:dateString] atomically:YES];
    
    self.noteString = dateString;
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}

-(NSString *)documentsPathForFileName:(NSString *)dateString{
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES);
    
    NSString *documentsPath = [paths objectAtIndex:0];
    
    return [documentsPath stringByAppendingPathComponent:dateString];
    
}

- (IBAction)saveButtonTapped:(id)sender {
    
    if (self.inspection) {
        self.inspection.queenSelected = [NSNumber numberWithBool:self.queenSelected];
        self.inspection.eggsSelected = [NSNumber numberWithBool:self.eggsSelected];
        self.inspection.openBSelected = [NSNumber numberWithBool:self.oBroodSelected];
        self.inspection.cappedBSelected = [NSNumber numberWithBool:self.cBroodSelected];
        self.inspection.cappedHoneySelected = [NSNumber numberWithBool:self.cHoneySelected];
        self.inspection.note = self.noteString;
        self.inspection.image = self.dateString;
        
        [[InspectionController sharedInstance] syncronize];
        
        [self.navigationController popViewControllerAnimated:YES];
        
    }else{
    
    [[InspectionController sharedInstance] addInspectionWithQueen:self.queenSelected andEggs:self.eggsSelected andOBrood:self.oBroodSelected andCBrood:self.cBroodSelected andCHoney:self.cHoneySelected andNote:self.noteString andImage:self.dateString andDate:[NSDate date] andHive:self.hive];
    //remember to add the hive.
    [self.navigationController popViewControllerAnimated:YES];
    }
    
//    NSNumber *cBroodAsNumber = [NSNumber numberWithBool:cBroodSelected];
//    inspection.cappedBSelected = cBroodAsNumber;
//    
//        if (self.entry) {
//            self.entry.title = self.titleTextField.text;
//            self.entry.bodyText = self.bodyTextView.text;
//            self.entry.timestamp = [NSDate date];
//            
//            [[EntryController sharedInstance] save];
//        } else {
//            self.entry = [[EntryController sharedInstance] createEntryWithTitle:self.titleTextField.text bodyText:self.bodyTextView.text];
//        }
//    }
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier isEqualToString:@"notesView"]) {
//        NSIndexPath *indexpath = [self.tableView indexPathForCell:sender];
        
//        NotesViewController *notesViewController = [segue destinationViewController];
        
        //NSLog(@"Segue Activated");
        NotesViewController *notesViewController = (NotesViewController *)segue.destinationViewController;
        if (self.noteString) {
            notesViewController.noteString = self.noteString;
        }
       
    }
}

-(IBAction)unwindFromNotesView:(UIStoryboardSegue *)segue{
    
    if ([segue.sourceViewController isKindOfClass:[NotesViewController class]]) {
        NotesViewController *notesViewController = segue.sourceViewController;
        if (notesViewController.notesText) {
            self.noteString = notesViewController.notesText.text;
        }
        
    }
}

@end
