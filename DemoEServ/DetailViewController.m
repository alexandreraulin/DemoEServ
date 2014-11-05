//
//  DetailViewController.m
//  DemoEServ
//
//  Created by Alexandre Raulin on 05/11/2014.
//  Copyright (c) 2014 Nextoo. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self updateView];
}

- (void)setStation:(Station *)station {
    if (_station != station) {
        _station = station;
        
        [self updateView];
    }
}

- (void)updateView {
    if(self.station) {
        self.nameLabel.text = self.station.name;
        self.addressLabel.text = self.station.address;
        self.statusLabel.text = self.station.status;
        self.bikesLabel.text = [NSString stringWithFormat:@"%ld", self.station.availableBikes];
        self.standsLabel.text = [NSString stringWithFormat:@"%ld", self.station.availableBikeStands];
        
        [self.mapView addAnnotation:self.station];
        [self.mapView showAnnotations:@[self.station] animated:YES];
    }
}

@end
