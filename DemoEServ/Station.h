//
//  Station.h
//  DemoEServ
//
//  Created by Alexandre Raulin on 04/11/2014.
//  Copyright (c) 2014 Nextoo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface Station : NSObject <MKAnnotation>

@property (nonatomic, retain) NSString *number;
@property (nonatomic, retain) NSString *contractName;
@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *address;

@property (nonatomic) float lat;
@property (nonatomic) float lng;

@property (nonatomic, retain) NSString *status;
@property (nonatomic) NSInteger bikeStands;
@property (nonatomic) NSInteger availableBikeStands;
@property (nonatomic) NSInteger availableBikes;

@end
