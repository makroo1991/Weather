//
//  WeatherManager.h
//  Weather
//
//  Created by Mark Prutskiy on 25.02.15.
//  Copyright (c) 2015 Mark. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WOEID.h"

@class Weather;

@interface WeatherManager : NSObject

+ (void)queryWeatherWithWOEID:(NSString *)WOEID
               succesCallback:(void (^)(Weather *weather)) successCallback
                errorCallback:(void (^)( NSString *error)) errorCallback;

@end
