//
//  InspectionTableViewCell.h
//  Bee Buddy
//
//  Created by Eric Newman on 5/28/15.
//  Copyright (c) 2015 Eric Newman. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InspectionTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *notes;
@property (strong, nonatomic) IBOutlet UILabel *date;
@property (strong, nonatomic) IBOutlet UIImageView *image;

@end
