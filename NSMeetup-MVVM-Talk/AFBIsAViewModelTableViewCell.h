//
//  AFBIsAViewModelTableViewCell.h
//  NSMeetup-MVVM-Talk
//
//  Created by Adam Block on 5/7/14.
//  Copyright (c) 2014 Adam Block. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFBBook.h"

@interface AFBIsAViewModelTableViewCell : UITableViewCell

- (void)configureWithBook:(AFBBook *)book;

@end
