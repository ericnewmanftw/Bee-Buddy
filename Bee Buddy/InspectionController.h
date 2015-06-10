//
//  InspectionController.h
//  Bee Buddy
//
//  Created by Eric Newman on 6/9/15.
//  Copyright (c) 2015 Eric Newman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Stack.h"
#import "Inspection.h"

@interface InspectionController : NSObject

@property (nonatomic, strong) NSArray *inspections;

+(InspectionController  *)sharedInstance;

-(void)removeInspection:(Inspection *)inspection;

-(void)addInspectionWithQueen:(NSNumber *)queenSelected
                      andEggs:(NSNumber *)eggsSelected
                    andOBrood:(NSNumber *)oBroodSelected
                    andCBrood:(NSNumber *)cBroodSelected
                    andCHoney:(NSNumber *)cHoneySelected
                      andNote:(NSString *)inspectionNotes
                     andImage:(NSData *)inspectionImage;



@end
