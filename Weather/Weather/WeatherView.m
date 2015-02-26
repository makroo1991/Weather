//
//  WeatherView.m
//  Weather
//
//  Created by Mark Prutskiy on 25.02.15.
//  Copyright (c) 2015 Mark. All rights reserved.
//

#import "WeatherView.h"
#include "Weather.h"

@implementation WeatherView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if(self) {
        
        int lbHeight = [UIScreen mainScreen].bounds.size.width - 100;
        
        _tempLb = [[UILabel alloc] initWithFrame:CGRectMake(self.center.x - lbHeight / 2, self.center.y - lbHeight / 2, lbHeight, lbHeight)];
        _tempLb.textAlignment = NSTextAlignmentCenter;
        _tempLb.font = [UIFont systemFontOfSize:lbHeight / 2];
        [self addSubview:_tempLb];
        
        lbHeight = 25;
        
        _textLb = [[UILabel alloc] initWithFrame:CGRectMake(0, lbHeight, _tempLb.bounds.size.width, lbHeight + 5)];
        _textLb.textAlignment = NSTextAlignmentCenter;
        _textLb.font = [UIFont systemFontOfSize:lbHeight];
        [_tempLb addSubview:_textLb];
        
        _cityLb = [[UILabel alloc] initWithFrame:CGRectMake(0, _tempLb.bounds.size.height - lbHeight, _tempLb.bounds.size.width, lbHeight + 5)];
        _cityLb.textAlignment = NSTextAlignmentCenter;
        _cityLb.font = [UIFont systemFontOfSize:lbHeight];
        [_tempLb addSubview:_cityLb];
        
    }
    
    return self;
}

- (void)updateView:(Weather *)weather {
    _tempLb.text = [weather.temp stringValue];
    _textLb.text = weather.text;
    _cityLb.text = weather.city;
}

@end
