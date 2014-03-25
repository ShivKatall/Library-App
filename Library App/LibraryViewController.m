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

@implementation LibraryViewController
@synthesize shelfList;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
        
    NSString *libraryName = [self.labelText];
    NSMutableArray *shelfList = [self.shelfList];
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.shelfList count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ShelfCell"];
    Shelf *shelf = [self.shelfList objectAtIndex:indexPath.row];
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
    if ([segue.identifier isEqualToString:@"showLibrarySegue"]) {
        ShelfViewController *destination = segue.destinationViewController;
        Shelf *shelf = [self.shelfList objectAtIndex:[self.tableView indexPathForSelectedRow].row];
        destination.labelText = shelf.shelfName;
    }
}
@end
