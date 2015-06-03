//
//  ImageTableViewCell.m
//  Bee Buddy
//
//  Created by Eric Newman on 6/2/15.
//  Copyright (c) 2015 Eric Newman. All rights reserved.
//

#import "ImageTableViewCell.h"

@implementation ImageTableViewCell 

- (void)awakeFromNib {
    // Initialization code
}



- (IBAction)buttonPressed:(id)sender {
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    
   // [self presentViewController:picker animated:YES completion:NULL];
    
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    self.imageView.image = chosenImage;
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}
@end
