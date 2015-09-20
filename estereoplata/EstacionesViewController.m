//
//  TableViewController2.m
//  estereoplata
//
//  Created by Leonel Roberto Perea Trejo on 2/1/14.
//  Copyright (c) 2014 Leonel Roberto Perea Trejo. All rights reserved.
//

#import "EstacionesViewController.h"
#import "FirstViewController.h"

@interface EstacionesViewController ()

@end

@implementation EstacionesViewController{
    NSArray *stations;
    NSArray *stationsDetail;
    FirstViewController *test;
    FirstViewController *old_test;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    stations = [[NSArray arrayWithObjects:
                @"Radio Jerez - Jerez, Zacatecas",
                @"Radio RRR - Jalisco",
                @"Inolvidable - Jerez, Zacatecas",
                @"Lupe - Zacatecas",
                @"Radio Caxcan - Jalpa, Zacatecas",
                @"Pop - Aguascalientes",
                @"Stereo Zer - Zacatecas",
                @"Amor - Zacatecas",
                @"La Tremenda - Fresnillo",
                @"La Kaliente Aguascalientes",
                @"La San Marqueña - Aguascalientes",
                @"Amor - Aguascalientes",
                @"Stereo - Fresnillo, Zacatecas",
                @"Digital - Zacatecas",
                @"Zer Radio - Mexico", nil]retain];
    stationsDetail = [[NSArray arrayWithObjects:
                      @"89.1 FM",
                      @"89.5 FM",
                      @"90.7 FM",
                      @"93.3 FM",
                      @"95.1 FM",
                      @"95.7 FM",
                      @"96.5 FM",
                      @"99.3 FM",
                      @"98.5 FM",
                      @"100.1 FM",
                      @"102.9 FM",
                      @"104.5 FM",
                      @"106.1 FM",
                      @"106.5 FM",
                      @"1650 AM", nil]retain];
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [stations count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"StationCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:simpleTableIdentifier];
    }
    
    //NSLog(@"%lu",indexPath.row);
    cell.textLabel.text = [stations objectAtIndex:indexPath.row];
    cell.detailTextLabel.text = [stationsDetail objectAtIndex:indexPath.row];
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (void)tableView: (UITableView *)tableView didSelectRowAtIndexPath: (NSIndexPath *)indexPath{
    /*if(test!=old_test){
        [test eliminar];
        test = old_test;
    }*/
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    //NSLog(@"prepareForSegue: %@", segue.identifier);
    if ([segue.identifier isEqualToString:@"ShowStation"]) {
        
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        //FirstViewController *destViewController = [segue destinationViewController];
        //destViewController.valorPasado= @"Hola";
        
        //UINavigationController *navController = (UINavigationController*)[segue destinationViewController];
        /*
        FirstViewController *destViewController = (FirstViewController* )[segue destinationViewController];
        destViewController.valorPasado = @"Your title";*/
        
        //NSLog(@"%@",test.valorPasado);
        old_test = (FirstViewController *)segue.destinationViewController;
        [segue.destinationViewController setValorPasado:[NSString stringWithFormat:@"%ld", (long)indexPath.row]];
        
        /*
        UINavigationController *navController = (UINavigationController*)[segue destinationViewController];
        UITableViewController *eventsController = [navController topViewController];
        [eventsController set set setUsername:username];
        
        UINavigationController *navigationController = segue.destinationViewController;
		FirstViewController *stationDetailsViewController = [[navigationController viewControllers] objectAtIndex:0];
        stationDetailsViewController.valorPasado = @"Hola";*/
        
    }
}

@end
