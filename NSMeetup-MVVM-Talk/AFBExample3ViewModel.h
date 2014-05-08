//
//  AFBExample3ViewModel.h
//  NSMeetup-MVVM-Talk
//
//  Created by Adam Block on 5/7/14.
//  Copyright (c) 2014 Adam Block. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AFBExample3ViewModel : NSObject

@property (nonatomic, strong) NSNumber *updateFlag;

- (NSInteger)numberOfCellsInVariableLengthSection;
- (NSString *)titleForCellAtVariableRow:(NSInteger)row;
- (NSString *)subtitleForCellAtVariableRow:(NSInteger)row;

- (void)stopTimer;

@end
