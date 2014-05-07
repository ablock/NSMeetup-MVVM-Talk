//
//  AFBBook.h
//  NSMeetup-MVVM-Talk
//
//  Created by Adam Block on 5/7/14.
//  Copyright (c) 2014 Adam Block. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, BookType) {
    BookTypeFiction,
    BookTypeNonFiction,
    BookTypeGeorgeRRMartin
};

@interface AFBBook : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *author;
@property (nonatomic, strong) NSString *isbn;
@property (nonatomic) NSInteger unitsSold;
@property (nonatomic) BookType type;

@end
