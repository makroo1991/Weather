//
//  ViewController.m
//  Weather
//
//  Created by Mark Prutskiy on 25.02.15.
//  Copyright (c) 2015 Mark. All rights reserved.
//

#import "WeatherViewController.h"
#import "WeatherView.h"
#import "WeatherManager.h"
#import "DBManager.h"

@interface WeatherViewController ()

@end

@implementation WeatherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self initWeatherView];
    [self loadWeatherFromDB];
    [self updateWeather];
}

- (void)initWeatherView {
    _weatherView = [[WeatherView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:_weatherView];
}

- (void)loadWeatherFromDB {
     NSMutableArray *weatherArray= [[DBManager sharedInstance] loadContext];
    
    Weather *weather = [weatherArray firstObject];
    [_weatherView updateView:weather];
}

- (void)updateWeather {
    [WeatherManager queryWeatherWithWOEID:Odessa_WOEID succesCallback:^(Weather *weather) {
        [_weatherView updateView:weather];
        
    } errorCallback:^(NSString *error) {
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
