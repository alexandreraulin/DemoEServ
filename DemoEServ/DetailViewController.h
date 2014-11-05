//
//  DetailViewController.h
//  DemoEServ
//
//  Created by Alexandre Raulin on 05/11/2014.
//  Copyright (c) 2014 Nextoo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Station.h"

@interface DetailViewController : UIViewController

@property (strong, nonatomic) Station *station;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;
@property (weak, nonatomic) IBOutlet UILabel *bikesLabel;
@property (weak, nonatomic) IBOutlet UILabel *standsLabel;

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end
