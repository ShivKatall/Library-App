//
//  ShelfViewController.m
//  Library App
//
//  Created by Cole Bratcher on 3/23/14.
//  Copyright (c) 2014 Cole Bratcher. All rights reserved.
//

#import "ShelfViewController.h"
#import "Library.h"
#import "Shelf.h"
#import "Book.h"

@interface ShelfViewController ()

@end

@implementation ShelfViewController

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

- (IBAction)toggleEditing:(id)sender
{
    if (self.tableView.editing) {
        [self.tableView setEditing:NO animated:YES];
        [(UIBarButtonItem *)sender setTitle:@"Edit"];
    } else {
        [self.tableView setEditing:YES animated:YES];
        [(UIBarButtonItem *)sender setTitle:@"Done"];
    }
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    Book *bookToDelete = [self.shelf.books objectAtIndex:indexPath.row];
    [self.shelf removeBook:bookToDelete];
    [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationLeft];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.shelf.books count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BookCell" forIndexPath:indexPath];
    Book *book = [self.shelf.books objectAtIndex:indexPath.row];
    cell.textLabel.text = book.titleOfBook;
    
    return cell;
}



// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}


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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void)addBookViewControllerDidCancel:(AddBookViewController *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)AddBookViewController:(AddBookViewController *)controller didFinishAddingItem:(Book *)book
{
    NSInteger newRowIndex = [self.shelf.books count];
    [self.shelf addBook:book];
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:newRowIndex inSection:0];
    NSArray *indexPaths = @[indexPath];
    [self.tableView insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationAutomatic];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

/*
 - (IBAction)addBook:(id)sender
 {
 Book *newBook = [Book new];
 newBook.titleOfBook = @"Book Title";
 [self.shelf addBook:newBook];
 [self.tableView reloadData];
 }
 */

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"AddBook"]) {
        
        // 1
        UINavigationController *navigationController = segue.destinationViewController;
        
        // 2
        AddBookViewController *controller = (AddBookViewController *) navigationController.topViewController;
        
        // 3
        controller.delegate = self;
    }
}
@end
