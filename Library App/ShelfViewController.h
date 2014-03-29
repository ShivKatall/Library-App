//
//  ShelfViewController.h
//  Library App
//
//  Created by Cole Bratcher on 3/23/14.
//  Copyright (c) 2014 Cole Bratcher. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddBookViewController.h"

@class Shelf;

@interface ShelfViewController : UITableViewController <AddBookViewControllerDelegate>

@property (nonatomic, weak) Shelf *shelf;

@end
