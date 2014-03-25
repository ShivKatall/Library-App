//
//  LibraryViewController.h
//  Library App
//
//  Created by Cole Bratcher on 3/19/14.
//  Copyright (c) 2014 Cole Bratcher. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LibraryViewController : UITableViewController

@property (weak, nonatomic) IBOutlet UILabel *mainLabel;
@property (nonatomic) NSString *labelText;
@property (nonatomic) NSMutableArray *shelfList;


@end
