//
//  Weather.m
//  Weather
//
//  Created by Mark Prutskiy on 25.02.15.
//  Copyright (c) 2015 Mark. All rights reserved.
//

#import "Weather.h"
#import "DBManager.h"

@implementation Weather

@dynamic city;
@dynamic code;
@dynamic date;
@dynamic temp;
@dynamic text;

- (id)initWithDictionary:(NSDictionary *)dic {
    self = [NSEntityDescription insertNewObjectForEntityForName:[Weather entityName] inManagedObjectContext:[[DBManager sharedInstance] managedObjectContext]];
    
    if(self) {
        
        self.city = [dic valueForKeyPath:@"query.results.channel.location.city"];
        
        NSDictionary * conditionDic = [dic valueForKeyPath:@"query.results.channel.item.condition"];
        
        self.code = [NSNumber numberWithInt:[[conditionDic valueForKey:@"code"] intValue]];
        
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"EEE, dd MMM yyyy HH:mm a zzz"];
        NSDate *date = [dateFormatter dateFromString:[conditionDic valueForKey:@"date"]];
        self.date = date;
        self.temp = [NSNumber numberWithInt:[[conditionDic valueForKey:@"temp"] intValue]];
        self.text = [conditionDic valueForKey:@"text"];
        
        [[DBManager sharedInstance] saveContext];
        
    }
    
    return self;
}

+ (NSString *)entityName {
    return @"Weather";
}

@end
