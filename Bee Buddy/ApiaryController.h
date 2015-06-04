//
//  ApiaryController.h
//  Bee Buddy
//
//  Created by Eric Newman on 6/3/15.
//  Copyright (c) 2015 Eric Newman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Apiary.h"

@interface ApiaryController : NSObject

@property (nonatomic, strong) NSArray *apiaries;

+(ApiaryController *)sharedInstance;

-(void)removeApiary:(Apiary *)apiary;
-(void)addApiaryWithData:(NSString *)apiaryName
           andLocation:(NSString *)apiaryLocation
           andNumberOfHives:(NSSet *)apiaryHives;



@end
