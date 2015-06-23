//
//  ViewController.m
//  Note-it
//
//  Created by Pradnya Nikam on 22/06/15.
//  Copyright (c) 2015 Prad. All rights reserved.
//

#import "NotesViewController.h"
#import "NotesDatasource.h"

@interface NotesViewController ()
@property NotesDatasource * notesDatasource;
@end

@implementation NotesViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tap];
    
    //setting up datasource and delegates
    _notesDatasource = [NotesDatasource new];
    [self.tableView setDataSource:_notesDatasource];
    [self.tableView setDelegate:_notesDatasource];
    _notesDatasource.tableView = _tableView;
}

-(void)viewWillAppear:(BOOL)animated{
    [self.tableView reloadData];
}

- (IBAction)addNote:(id)sender {
    [self dismissKeyboard];
    [_notesDatasource addNote:self.noteTextToAdd.text];
    self.noteTextToAdd.text = @"";
}

-(void)dismissKeyboard{
    [_noteTextToAdd resignFirstResponder];
}

#pragma mark - UITextFieldDelegate

-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}
@end