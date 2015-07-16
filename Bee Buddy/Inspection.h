//
//  Inspection.h
//  
//
//  Created by Eric Newman on 7/15/15.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Hive;

@interface Inspection : NSManagedObject

@property (nonatomic, retain) NSNumber * cappedBSelected;
@property (nonatomic, retain) NSNumber * cappedHoneySelected;
@property (nonatomic, retain) NSDate * date;
@property (nonatomic, retain) NSNumber * eggsSelected;
@property (nonatomic, retain) NSString * image;
@property (nonatomic, retain) NSString * note;
@property (nonatomic, retain) NSNumber * openBSelected;
@property (nonatomic, retain) NSNumber * queenSelected;
@property (nonatomic, retain) Hive *hive;

@end
