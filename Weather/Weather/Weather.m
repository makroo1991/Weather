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
        
        self.code = [NSNumber numberWithInt:[[dic valueForKey:@"code"] intValue]];
        self.date = [dic valueForKey:@"date"];
        self.temp = [NSNumber numberWithInt:[[dic valueForKey:@"temp"] intValue]];
        self.text = [dic valueForKey:@"text"];
        
    }
    
    return self;
}

@end
