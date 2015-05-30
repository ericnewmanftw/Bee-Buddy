//
//  Inspection.h
//  Bee Buddy
//
//  Created by Eric Newman on 5/30/15.
//  Copyright (c) 2015 Eric Newman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Hive;

@interface Inspection : NSManagedObject

@property (nonatomic, retain) NSNumber * cappedBSelected;
@property (nonatomic, retain) NSNumber * cappedHoneySelected;
@property (nonatomic, retain) NSDate * date;
@property (nonatomic, retain) NSNumber * eggsSelected;
@property (nonatomic, retain) NSData * image;
@property (nonatomic, retain) NSString * note;
@property (nonatomic, retain) NSNumber * openBSelected;
@property (nonatomic, retain) NSNumber * queenSelected;
@property (nonatomic, retain) Hive *hive;

@end
