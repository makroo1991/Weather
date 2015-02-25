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
        
        int tempLbWidthHeight = [UIScreen mainScreen].bounds.size.width - 100;
        
        _tempLb = [[UILabel alloc] initWithFrame:CGRectMake(self.center.x - tempLbWidthHeight / 2, self.center.y - tempLbWidthHeight / 2, tempLbWidthHeight, tempLbWidthHeight)];
//        _tempLb.backgroundColor = [UIColor grayColor];
        _tempLb.textAlignment = NSTextAlignmentCenter;
        _tempLb.font = [UIFont systemFontOfSize:tempLbWidthHeight / 2];
        [self addSubview:_tempLb];
        
        int textLbHeight = 25;
        
        _textLb = [[UILabel alloc] initWithFrame:CGRectMake(0, textLbHeight, _tempLb.bounds.size.width, textLbHeight)];
//        _textLb.backgroundColor = [UIColor whiteColor];
        _textLb.textAlignment = NSTextAlignmentCenter;
        _textLb.font = [UIFont systemFontOfSize:textLbHeight];
        [_tempLb addSubview:_textLb];
        
    }
    
    return self;
}

- (void)updateView:(Weather *)weather {
    _tempLb.text = [weather.temp stringValue];
    _textLb.text = weather.text;
}

@end
