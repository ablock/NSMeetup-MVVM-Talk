//
//  AFBExample2Presenter.h
//  NSMeetup-MVVM-Talk
//
//  Created by Adam Block on 5/7/14.
//  Copyright (c) 2014 Adam Block. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFBBook.h"

@protocol AFBExample2PresenterDelegate <NSObject>

- (void)updateBookTitle:(NSString *)title;
- (void)updateBookAuthor:(NSString *)author;
- (void)updateBookIsbn:(NSString *)isbn;
- (void)updateBookUnitsSold:(NSString *)unitsSold;
- (void)updateBookType:(BookType)type;

@end

@interface AFBExample2Presenter : NSObject

@property (nonatomic, strong) id<AFBExample2PresenterDelegate> delegate;

- (id)initWithDelegate:(id<AFBExample2PresenterDelegate>)delegate;
- (void)updateBookTitle:(NSString *)title;
- (void)updateBookAuthor:(NSString *)author;
- (void)updateBookIsbn:(NSString *)isbn;
- (void)updateBookType:(BookType)type;

- (void)stopTimer;

@end
