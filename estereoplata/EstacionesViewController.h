//
//  EstacionesViewController.h
//  estereoplata
//
//  Created by Leonel Roberto Perea Trejo on 2/1/14.
//  Copyright (c) 2014 Leonel Roberto Perea Trejo. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AudioStreamer;

@interface EstacionesViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) IBOutlet UITableView *tableView;

@end
