//
//  Hive.h
//  Bee Buddy
//
//  Created by Eric Newman on 5/30/15.
//  Copyright (c) 2015 Eric Newman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class NSManagedObject;

@interface Hive : NSManagedObject

@property (nonatomic, retain) NSString * location;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSManagedObject *apiary;
@property (nonatomic, retain) NSOrderedSet *inspections;
@end

@interface Hive (CoreDataGeneratedAccessors)

- (void)insertObject:(NSManagedObject *)value inInspectionsAtIndex:(NSUInteger)idx;
- (void)removeObjectFromInspectionsAtIndex:(NSUInteger)idx;
- (void)insertInspections:(NSArray *)value atIndexes:(NSIndexSet *)indexes;
- (void)removeInspectionsAtIndexes:(NSIndexSet *)indexes;
- (void)replaceObjectInInspectionsAtIndex:(NSUInteger)idx withObject:(NSManagedObject *)value;
- (void)replaceInspectionsAtIndexes:(NSIndexSet *)indexes withInspections:(NSArray *)values;
- (void)addInspectionsObject:(NSManagedObject *)value;
- (void)removeInspectionsObject:(NSManagedObject *)value;
- (void)addInspections:(NSOrderedSet *)values;
- (void)removeInspections:(NSOrderedSet *)values;
@end
