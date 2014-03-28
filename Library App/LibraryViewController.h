//
//  LibraryViewController.h
//  Library App
//
//  Created by Cole Bratcher on 3/19/14.
//  Copyright (c) 2014 Cole Bratcher. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Library.h"

@interface LibraryViewController : UITableViewController 

@property (nonatomic, weak) Library *library;
@property (weak, nonatomic) IBOutlet UILabel *mainLabel;



@end
