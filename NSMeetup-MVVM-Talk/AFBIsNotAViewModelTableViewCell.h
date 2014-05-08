//
//  AFBIsNotAViewModelTableViewCell.h
//  NSMeetup-MVVM-Talk
//
//  Created by Adam Block on 5/7/14.
//  Copyright (c) 2014 Adam Block. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFBBook.h"

@interface AFBIsNotAViewModelTableViewCell : UITableViewCell

- (void)configureWithTitle:(NSString *)title author:(NSString *)author isbn:(NSString *)isbn unitsSold:(NSString *)unitsSold type:(BookType)type;

@end
