//
//  Weather.m
//  Weather
//
//  Created by Mark Prutskiy on 25.02.15.
//  Copyright (c) 2015 Mark. All rights reserved.
//

#import "Weather.h"

@implementation Weather

- (id)initWithDictionary:(NSDictionary *)dic {
    self = [super init];
    
    if(self) {
        
        self.city = [dic valueForKeyPath:@"query.results.channel.location.city"];
        
        NSDictionary * conditionDic = [dic valueForKeyPath:@"query.results.channel.item.condition"];
        
        self.code = [NSNumber numberWithInt:[[conditionDic valueForKey:@"code"] intValue]];
        self.date = [conditionDic valueForKey:@"date"];
        self.temp = [NSNumber numberWithInt:[[conditionDic valueForKey:@"temp"] intValue]];
        self.text = [conditionDic valueForKey:@"text"];
        
    }
    
    return self;
}

@end
