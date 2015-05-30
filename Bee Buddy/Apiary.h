//
//  Apiary.h
//  Bee Buddy
//
//  Created by Eric Newman on 5/30/15.
//  Copyright (c) 2015 Eric Newman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Hive;

@interface Apiary : NSManagedObject

@property (nonatomic, retain) NSString * location;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet *hives;
@end

@interface Apiary (CoreDataGeneratedAccessors)

- (void)addHivesObject:(Hive *)value;
- (void)removeHivesObject:(Hive *)value;
- (void)addHives:(NSSet *)values;
- (void)removeHives:(NSSet *)values;

@end
