//
//  CYLocationView.m
//  SmartWatch
//
//  Created by chai on 15/9/26.
//  Copyright © 2015年 chai. All rights reserved.
//

#import "CYLocationView.h"
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>
 
@interface CYLocationView () <CLLocationManagerDelegate,MKMapViewDelegate>
{
    CLLocationCoordinate2D coordinate;
    CLLocationManager *_locationManager;
    MKMapView *_mapView;
}

@end

@implementation CYLocationView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createSubViews];
    }
    return self;
}

- (void)createSubViews
{
    _mapView = [[MKMapView alloc] initWithFrame:self.bounds];
    _mapView.mapType = MKMapTypeStandard;
    _mapView.delegate = self;
    _mapView.scrollEnabled = NO;
    [self addSubview:_mapView];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
