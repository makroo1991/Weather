//
//  WeatherView.h
//  Weather
//
//  Created by Mark Prutskiy on 25.02.15.
//  Copyright (c) 2015 Mark. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Weather;

@interface WeatherView : UIView {
    UILabel *_tempLb;
    UILabel *_textLb;
    
}

- (void)updateView:(Weather *)weather;

@end
