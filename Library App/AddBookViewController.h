//
//  AddBookViewController.h
//  Library App
//
//  Created by Cole Bratcher on 3/28/14.
//  Copyright (c) 2014 Cole Bratcher. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AddBookViewController;
@class Book;

@protocol AddBookViewControllerDelegate <NSObject>

-(void)addBookViewControllerDidCancel:(AddBookViewController *)controller;

-(void)AddBookViewController: (AddBookViewController *)controller didFinishAddingItem:(Book *)book;

@end

@interface AddBookViewController : UITableViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneBarButton;
@property (weak, nonatomic) id <AddBookViewControllerDelegate> delegate;

-(IBAction)cancel;
-(IBAction)done;

@end
