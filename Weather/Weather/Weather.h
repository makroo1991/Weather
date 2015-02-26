//
//  Weather.h
//  Weather
//
//  Created by Mark Prutskiy on 25.02.15.
//  Copyright (c) 2015 Mark. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface Weather : NSManagedObject

- (id)initWithDictionary:(NSDictionary *)dic;

@property (nonatomic, strong) NSString *city;
@property (nonatomic, strong) NSNumber *code;
@property (nonatomic, strong) NSDate *date;
@property (nonatomic, strong) NSNumber *temp;
@property (nonatomic, strong) NSString *text;

@end
