//
//  LibraryAppMainViewController.m
//  Library App
//
//  Created by Cole Bratcher on 3/19/14.
//  Copyright (c) 2014 Cole Bratcher. All rights reserved.
//

#import "LibraryAppMainViewController.h"
#import "Library.h"
#import "Shelf.h"
#import "Book.h"
#import "LibraryViewController.h"

@interface LibraryAppMainViewController ()

@end

@implementation LibraryAppMainViewController

@synthesize libraryList;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    libraryList = [NSMutableArray arrayWithCapacity:4];
    {
        Library *library = [[Library alloc] init];
        library.libraryName = @"Seattle Library";
        [libraryList addObject:library];
    }
    {
        Library *library = [[Library alloc] init];
        library.libraryName = @"San Francisco Library";
        [libraryList addObject:library];
    }
    {
        Library *library = [[Library alloc] init];
        library.libraryName = @"Portland Library";
        [libraryList addObject:library];
    }
    
    Shelf *hipsterShelf = [Shelf new];
    hipsterShelf.shelfName = @"Hipster Books";
    Shelf *techShelf = [Shelf new];
    techShelf.shelfName = @"Technical Books";
    Shelf *beerShelf = [Shelf new];
    beerShelf.shelfName = @"Beer Books";
    Shelf *coffeeShelf = [Shelf new];
    coffeeShelf.shelfName = @"Coffee Books";
    
    {
        Book *newBook = [Book new];
        newBook.titleOfBook = @"How to Brew";
        beerShelf.books = [NSMutableArray arrayWithObject:newBook];
    }
    {
        Book *newBook = [Book new];
        newBook.titleOfBook = @"The Art and Craft of Coffee";
        coffeeShelf.books = [NSMutableArray arrayWithObject:newBook];
    }
    {
        Book *newBook = [Book new];
        newBook.titleOfBook = @"NSHipster: Obscure Topics in Cocoa & Objective-C";
        Book *newBook2 = [Book new];
        newBook2.titleOfBook = @"Basher Science: Technology: A byte-sized world!";
        techShelf.books = [NSMutableArray arrayWithObjects:newBook, newBook2, nil];
    }
    {
        Book *newBook = [Book new];
        newBook.titleOfBook = @"Eminent Hipsters";
        hipsterShelf.books = [NSMutableArray arrayWithObject:newBook];
    }

    Library *seattleLibrary = [libraryList objectAtIndex:0];
    seattleLibrary.shelves = [NSMutableArray arrayWithObjects:hipsterShelf, techShelf, beerShelf, coffeeShelf, nil];
    Library *sanFranciscoLibrary = [libraryList objectAtIndex:1];
    sanFranciscoLibrary.shelves = [NSMutableArray arrayWithObjects:techShelf, beerShelf, coffeeShelf, nil];
    Library *portlandLibrary = [libraryList objectAtIndex:2];
    portlandLibrary.shelves = [NSMutableArray arrayWithObjects:hipsterShelf, beerShelf, coffeeShelf, nil];

}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.libraryList count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LibraryCell"];
    Library *library = [self.libraryList objectAtIndex:indexPath.row];
    cell.textLabel.text = library.libraryName;
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
        LibraryViewController *destination = segue.destinationViewController;
        Library *library = [self.libraryList objectAtIndex:[self.tableView indexPathForSelectedRow].row];
        destination.labelText = library.libraryName;
        destination.shelfList = library.shelves;
    }
}

@end
