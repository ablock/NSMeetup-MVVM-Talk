//
//  AFBExample2ViewController.m
//  NSMeetup-MVVM-Talk
//
//  Created by Adam Block on 5/7/14.
//  Copyright (c) 2014 Adam Block. All rights reserved.
//

#import "AFBExample2ViewController.h"
#import "AFBExample2Presenter.h"

@interface AFBExample2ViewController ()

// Views
@property (nonatomic, weak) IBOutlet UITextField *titleField;
@property (nonatomic, weak) IBOutlet UITextField *authorField;
@property (nonatomic, weak) IBOutlet UITextField *isbnField;
@property (nonatomic, weak) IBOutlet UILabel *unitsSoldLabel;
@property (nonatomic, weak) IBOutlet UISegmentedControl *bookTypeSegmentedControl;

// Presenter
@property (nonatomic, strong) AFBExample2Presenter *presenter;

@end

@implementation AFBExample2ViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self setupPresenter];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [self.presenter stopTimer];
    self.presenter = nil;
}

- (void)setupPresenter
{
    self.presenter = [[AFBExample2Presenter alloc] initWithDelegate:self];
}

#pragma mark - UI Callbacks
- (IBAction)textFieldUpdated:(id)sender
{
    UITextField *tf = sender;
    if (tf == self.titleField) {
        [self.presenter updateBookTitle:tf.text];
    } else if (tf == self.authorField) {
        [self.presenter updateBookAuthor:tf.text];
    } else if (tf == self.isbnField) {
        [self.presenter updateBookIsbn:tf.text];
    }
}

- (IBAction)segmentedControlUpdated:(id)sender
{
    UISegmentedControl *sc = sender;
    [self.presenter updateBookType:sc.selectedSegmentIndex];
}

- (IBAction)hideKeyboard:(id)sender
{
    [self.view endEditing:YES];
}

#pragma mark - Presenter delegate methods
- (void)updateBookTitle:(NSString *)title
{
    self.titleField.text = title;
}

- (void)updateBookAuthor:(NSString *)author
{
    self.authorField.text = author;
}

- (void)updateBookIsbn:(NSString *)isbn
{
    self.isbnField.text = isbn;
}

- (void)updateBookUnitsSold:(NSString *)unitsSold
{
    self.unitsSoldLabel.text = unitsSold;
}

- (void)updateBookType:(BookType)type
{
    [self configureSegmentedControlForBookType:type];
    [self formatForBookType:type];
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
