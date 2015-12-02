//
//  VLilleTableViewController.m
//  DemoEServ
//
//  Created by Alexandre Raulin on 04/11/2014.
//  Copyright (c) 2014 Nextoo. All rights reserved.
//

#import "TableViewController.h"
#import "Station.h"
#import "RKObjectMapping.h"
#import "RKResponseDescriptor.h"
#import "RKObjectRequestOperation.h"
#import "DetailViewController.h"

@interface TableViewController () {
    NSArray *_searchResults;
    NSArray *_stations;
}

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _stations = [NSArray array];
    
    RKObjectMapping *mapping = [RKObjectMapping mappingForClass:[Station class]];
    [mapping addAttributeMappingsFromDictionary:@{
                                                  @"number":   @"number",
                                                  @"contract_name":   @"contractName",
                                                  @"name":   @"name",
                                                  @"address":   @"address",
                                                  @"position.lat":   @"lat",
                                                  @"position.lng":   @"lng",
                                                  @"status":   @"status",
                                                  @"bike_stands":   @"bikeStands",
                                                  @"available_bike_stands":   @"availableBikeStands",
                                                  @"available_bikes":   @"availableBikes",
                                                  }];
    
    RKResponseDescriptor *responseDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:mapping method:RKRequestMethodAny pathPattern:nil keyPath:nil statusCodes:nil];
    
    //NSURL *url = [NSURL URLWithString:@"http://vlille.fr/stations/xml-stations.aspx"];
    NSURL *url = [NSURL URLWithString:@"https://api.jcdecaux.com/vls/v1/stations?contract=Paris&apiKey="];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    RKObjectRequestOperation *operation = [[RKObjectRequestOperation alloc] initWithRequest:request responseDescriptors:@[responseDescriptor]];
    [operation setCompletionBlockWithSuccess:^(RKObjectRequestOperation *operation, RKMappingResult *result) {
        _stations = [result array];
        [self.tableView reloadData];
        
    } failure:nil];
    [operation start];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(tableView == self.searchDisplayController.searchResultsTableView) {
        return _searchResults.count;
    } else {
        return _stations.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"StationTableViewCell" forIndexPath:indexPath];
    
    Station *station = nil;
    if(tableView == self.searchDisplayController.searchResultsTableView) {
        station = [_searchResults objectAtIndex:indexPath.row];
    } else {
        station = [_stations objectAtIndex:indexPath.row];
    }
    
    cell.textLabel.text = station.name;
    
    return cell;
}

#pragma mark - UISearchDisplayDelegate

- (void)searchDisplayControllerDidBeginSearch:(UISearchDisplayController *)controller {
    _searchResults = [_stations copy];
}

- (void)searchDisplayControllerDidEndSearch:(UISearchDisplayController *)controller {
    _searchResults = nil;
}

- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString {
    
    NSPredicate *resultPredicate = [NSPredicate predicateWithFormat:@"name contains[c] %@", searchString];
    _searchResults = [_stations filteredArrayUsingPredicate:resultPredicate];
    
    return YES;
}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = nil;
        Station *station = nil;
        
        if (self.searchDisplayController.active) {
            indexPath = [self.searchDisplayController.searchResultsTableView indexPathForSelectedRow];
            station = [_searchResults objectAtIndex:indexPath.row];
        } else {
            indexPath = [self.tableView indexPathForSelectedRow];
            station = [_stations objectAtIndex:indexPath.row];
        }
        
        [(DetailViewController *)[segue destinationViewController] setStation:station];
    }
}

@end
