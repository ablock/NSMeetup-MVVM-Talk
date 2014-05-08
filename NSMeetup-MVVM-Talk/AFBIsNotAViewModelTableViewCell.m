//
//  AFBIsNotAViewModelTableViewCell.m
//  NSMeetup-MVVM-Talk
//
//  Created by Adam Block on 5/7/14.
//  Copyright (c) 2014 Adam Block. All rights reserved.
//

#import "AFBIsNotAViewModelTableViewCell.h"

@implementation AFBIsNotAViewModelTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
