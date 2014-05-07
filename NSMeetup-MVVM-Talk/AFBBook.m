//
//  AFBBook.m
//  NSMeetup-MVVM-Talk
//
//  Created by Adam Block on 5/7/14.
//  Copyright (c) 2014 Adam Block. All rights reserved.
//

#import "AFBBook.h"

@interface AFBBook ()

@end

@implementation AFBBook

- (NSString *)description
{
    NSMutableString *description = [@"" mutableCopy];
    [description appendFormat:@"Title: %@; ", self.title];
    [description appendFormat:@"Author: %@; ", self.author];
    [description appendFormat:@"ISBN: %@; ", self.isbn];
    [description appendFormat:@"Units Sold: %i; ", self.unitsSold];
    [description appendFormat:@"Type: %i; ", self.type];
    return description;
}

@end
