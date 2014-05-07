//
//  AFBExample1ViewController.m
//  NSMeetup-MVVM-Talk
//
//  Created by Adam Block on 5/7/14.
//  Copyright (c) 2014 Adam Block. All rights reserved.
//

#import "AFBExample1ViewController.h"
#import "AFBExample1ViewModel.h"
#import "AFBBook.h"
#import "Binding.h"
#import "EXTScope.h"

@interface AFBExample1ViewController ()

// Views
@property (nonatomic, weak) IBOutlet UITextField *titleField;
@property (nonatomic, weak) IBOutlet UITextField *authorField;
@property (nonatomic, weak) IBOutlet UITextField *isbnField;
@property (nonatomic, weak) IBOutlet UILabel *unitsSoldLabel;
@property (nonatomic, weak) IBOutlet UISegmentedControl *bookTypeSegmentedControl;

// ViewModel
@property (nonatomic, strong) AFBExample1ViewModel *viewModel;
@property (nonatomic, strong) NSMutableArray *bindings;

@end

@implementation AFBExample1ViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self setupViewModel];
    [self setupBindings];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [self.viewModel stopTimer];
    self.bindings = nil;
    self.viewModel = nil;
}

- (void)setupViewModel
{
    self.viewModel = [[AFBExample1ViewModel alloc] init];
}

#pragma mark - Bindings
- (void)setupBindings
{
    self.bindings = [NSMutableArray array];
    
    @weakify(self);
    [self.bindings addObject:[Bind(self.viewModel, bookTitle) next:^(NSString *title) {
        @strongify(self);
        self.titleField.text = title;
    }]];
    [self.bindings addObject:[Bind(self.viewModel, bookAuthor) next:^(NSString *author) {
        @strongify(self);
        self.authorField.text = author;
    }]];
    [self.bindings addObject:[Bind(self.viewModel, bookIsbn) next:^(NSString *isbn) {
        @strongify(self);
        self.isbnField.text = isbn;
    }]];
    [self.bindings addObject:[Bind(self.viewModel, bookUnitsSold) next:^(NSString *unitsSold) {
        @strongify(self);
        self.unitsSoldLabel.text = unitsSold;
    }]];
    [self.bindings addObject:[Bind(self.viewModel, bookType) next:^(NSNumber *bookType) {
        @strongify(self);
        BookType type = [bookType integerValue];
        [self configureSegmentedControlForBookType:type];
        [self formatForBookType:type];
    }]];
}

#pragma mark - UI Callbacks
- (IBAction)textFieldUpdated:(id)sender
{
    UITextField *tf = sender;
    if (tf == self.titleField) {
        [self.viewModel updateBookTitle:tf.text];
    } else if (tf == self.authorField) {
        [self.viewModel updateBookAuthor:tf.text];
    } else if (tf == self.isbnField) {
        [self.viewModel updateBookIsbn:tf.text];
    }
}

- (IBAction)segmentedControlUpdated:(id)sender
{
    UISegmentedControl *sc = sender;
    [self.viewModel updateBookType:sc.selectedSegmentIndex];
}

- (IBAction)hideKeyboard:(id)sender
{
    [self.view endEditing:YES];
}

#pragma mark - View code
- (void)configureSegmentedControlForBookType:(BookType)type
{
    self.bookTypeSegmentedControl.selectedSegmentIndex = type;
}

- (void)formatForBookType:(BookType)type
{
    switch (type) {
        case BookTypeFiction: self.view.backgroundColor = [UIColor lightGrayColor]; break;
        case BookTypeNonFiction: self.view.backgroundColor = [UIColor greenColor]; break;
        case BookTypeGeorgeRRMartin: self.view.backgroundColor = [UIColor yellowColor];
    }
}

@end
