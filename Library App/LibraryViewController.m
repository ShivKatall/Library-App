//
//  LibraryViewController.m
//  Library App
//
//  Created by Cole Bratcher on 3/19/14.
//  Copyright (c) 2014 Cole Bratcher. All rights reserved.
//

#import "LibraryViewController.h"
#import "Library.h"
#import "Shelf.h"
#import "Book.h"
#import "ShelfViewController.h"
#import "LibraryAppMainViewController.h"

@interface LibraryViewController ()

@end

@class Library;

@implementation LibraryViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

}


- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.library.shelves count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ShelfCell" forIndexPath:indexPath];
    Shelf *shelf = [self.library.shelves objectAtIndex:indexPath.row];
    cell.textLabel.text = shelf.shelfName;
    return cell;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"showShelfSegue"]) {
        ShelfViewController *destination = segue.destinationViewController;
        Shelf *shelf = [self.library.shelves objectAtIndex:[self.tableView indexPathForSelectedRow].row];
        destination.shelf = shelf;
    }
}
@end
