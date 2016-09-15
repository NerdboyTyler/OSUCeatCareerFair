//
//  MainViewController.h
//  OSU Ceat Career Fair
//
//  Created by Tyler Weppler on 8/28/15.
//  Copyright (c) 2015 NerdboyDevelopment. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *mapButton;
@property (weak, nonatomic) IBOutlet UINavigationBar *navBar;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *aboutButton;

@end
