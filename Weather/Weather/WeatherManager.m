//
//  WeatherManager.m
//  Weather
//
//  Created by Mark Prutskiy on 25.02.15.
//  Copyright (c) 2015 Mark. All rights reserved.
//

#import "WeatherManager.h"
#import "Weather.h"
#import "YQL.h"

@implementation WeatherManager

+ (void)queryWeatherWithWOEID:(NSString *)WOEID
               succesCallback:(void (^)(Weather *weather)) successCallback
                errorCallback:(void (^)( NSString *error)) errorCallback {
    
    YQL *yql = [[YQL alloc] init];
    NSString *queryString = [NSString stringWithFormat:@"select item.condition from weather.forecast where woeid=%@",WOEID];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        NSDictionary *results = [yql query:queryString];
        dispatch_async(dispatch_get_main_queue(), ^{
            
            NSLog(@"results: %@",results[@"query"][@"results"]);
            
            if(results){
                Weather *weather = [[Weather alloc] initWithDictionary:[results valueForKeyPath:@"query.results.channel.item.condition"]];
                
                successCallback(weather);
            } else
                errorCallback(@"Custom Error");
        });
    });
}

@end
