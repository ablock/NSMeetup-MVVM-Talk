//
//  AFBExample1ViewModel.h
//  NSMeetup-MVVM-Talk
//
//  Created by Adam Block on 5/7/14.
//  Copyright (c) 2014 Adam Block. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFBBook.h"

@interface AFBExample1ViewModel : NSObject

@property (nonatomic, strong) NSString *bookTitle;
@property (nonatomic, strong) NSString *bookAuthor;
@property (nonatomic, strong) NSString *bookIsbn;
@property (nonatomic, strong, readonly) NSString *bookUnitsSold;
@property (nonatomic, strong, readonly) NSNumber *bookType;

- (void)updateBookTitle:(NSString *)title;
- (void)updateBookAuthor:(NSString *)author;
- (void)updateBookIsbn:(NSString *)isbn;
- (void)updateBookType:(BookType)type;

- (void)stopTimer;

@end
