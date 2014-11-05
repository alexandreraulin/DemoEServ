//
//  TableViewController.h
//  DemoEServ
//
//  Created by Alexandre Raulin on 05/11/2014.
//  Copyright (c) 2014 Nextoo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewController : UITableViewController <UISearchDisplayDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end
