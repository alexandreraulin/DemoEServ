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

@property (nonatomic, strong) Station *station;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;

@end
