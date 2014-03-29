//
//  AddBookViewController.m
//  Library App
//
//  Created by Cole Bratcher on 3/28/14.
//  Copyright (c) 2014 Cole Bratcher. All rights reserved.
//

#import "AddBookViewController.h"
#import "Book.h"

@interface AddBookViewController ()

@end

@implementation AddBookViewController

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

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.textField becomeFirstResponder];
}

-(IBAction)cancel
{
    [self.delegate addBookViewControllerDidCancel:self];
}

-(IBAction)done
{
    Book *book = [[Book alloc] init];
    book.titleOfBook = self.textField.text;
    
    [self.delegate AddBookViewController:self didFinishAddingItem:book];
}

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}

-(BOOL)textField:(UITextField *)theTextField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSString *newText = [theTextField.text stringByReplacingCharactersInRange:range withString:string];
    
    self.doneBarButton.enabled = ([newText length] > 0);
    
    return YES;
}

@end
