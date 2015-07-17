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
    
    [self.delegate imageTapped];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}

@end
