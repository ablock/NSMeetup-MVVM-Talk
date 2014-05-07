//
//  AFBExample1ViewModel.m
//  NSMeetup-MVVM-Talk
//
//  Created by Adam Block on 5/7/14.
//  Copyright (c) 2014 Adam Block. All rights reserved.
//

#import "AFBExample1ViewModel.h"
#import "Binding.h"

@interface AFBExample1ViewModel ()

@property (nonatomic, strong) AFBBook *book;
@property (nonatomic, strong, readwrite) NSString *bookUnitsSold;
@property (nonatomic, strong, readwrite) NSNumber *bookType;
@property (nonatomic, weak) NSTimer *timer;

@end

@implementation AFBExample1ViewModel

- (id)init
{
    self = [super init];
    if (self) {
        [self setupDefaultBook];
        [self startTimer];
    }
    return self;
}

- (void)setupDefaultBook
{
    self.book = [[AFBBook alloc] init];
    self.book.title = @"A Song of Rice and Tires";
    self.book.author = @"George R. R. Martin";
    self.book.isbn = @"1234567890ABCDEF";
    self.book.type = BookTypeGeorgeRRMartin;
    self.book.unitsSold = 990;
}

- (void)startTimer
{
    NSTimer *timer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(timerFired) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
    self.timer = timer;
}

- (void)stopTimer;
{
    [self.timer invalidate];
}

- (void)timerFired
{
    [self incrementUnitsSold];
    [self updateValues];
}

- (void)incrementUnitsSold
{
    int randomNewUnitsSold = arc4random() % 10;
    self.book.unitsSold = self.book.unitsSold + randomNewUnitsSold;
}

- (void)updateValues
{
    self.bookTitle = self.book.title;
    self.bookAuthor = self.book.author;
    self.bookIsbn = self.book.isbn;
    self.bookType = @(self.book.type);
    self.bookUnitsSold = [self formatUnitsSold:self.book.unitsSold];
    
    NSLog(@"ViewModel %@", self.book);
}

- (NSString *)formatUnitsSold:(NSInteger)unitsSold;
{
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    formatter.groupingSeparator = [[NSLocale currentLocale] objectForKey:NSLocaleGroupingSeparator];
    formatter.groupingSize = 3;
    formatter.usesGroupingSeparator = YES;
    return [formatter stringFromNumber:@(unitsSold)];
}

#pragma mark - Setters
- (void)updateBookTitle:(NSString *)bookTitle
{
    self.book.title = bookTitle;
    [self updateValues];
}

- (void)updateBookAuthor:(NSString *)bookAuthor
{
    self.book.author = bookAuthor;
    [self updateValues];
}

- (void)updateBookIsbn:(NSString *)bookIsbn
{
    self.book.isbn = bookIsbn;
    [self updateValues];
}

- (void)updateBookType:(BookType)type
{
    self.book.type = type;
    [self updateValues];
}

@end
