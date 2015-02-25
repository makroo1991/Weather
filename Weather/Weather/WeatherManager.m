//
//  WeatherManager.m
//  Weather
//
//  Created by Mark Prutskiy on 25.02.15.
//  Copyright (c) 2015 Mark. All rights reserved.
//

#import "WeatherManager.h"
#import "YQL.h"

@implementation WeatherManager

+ (void)queryWeatherWithWOEID:(NSString *)WOEID
               succesCallback:(void (^)(NSDictionary *response)) successCallback
                errorCallback:(void (^)( NSString *error)) errorCallback {
    
    YQL *yql = [[YQL alloc] init];
    NSString *queryString = [NSString stringWithFormat:@"select wind from weather.forecast where woeid=%@",WOEID];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
         NSDictionary *results = [yql query:queryString];
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"%@",results[@"query"][@"count"]);
            NSLog(@"%@",results[@"query"][@"results"]);
            
            if (results)
                successCallback(results);
            else
                errorCallback(@"Error");
        });
    });
}

@end
