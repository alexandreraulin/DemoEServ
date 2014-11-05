//
//  Station.m
//  DemoEServ
//
//  Created by Alexandre Raulin on 04/11/2014.
//  Copyright (c) 2014 Nextoo. All rights reserved.
//

#import "Station.h"

@implementation Station

#pragma mark - MKAnnotation protocol

- (NSString *)title {
    return self.name;
}

- (NSString *)subtitle {
    return [NSString stringWithFormat:@"Vélos : %ld, Places : %ld", self.availableBikes, self.availableBikeStands];
}

- (CLLocationCoordinate2D)coordinate {
    CLLocationCoordinate2D newCoordinate;
    
    newCoordinate.latitude = self.lat;
    newCoordinate.longitude = self.lng;
    
    return newCoordinate;
}

@end
