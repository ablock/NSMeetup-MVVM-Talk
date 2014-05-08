//
//  AFBExample3ViewModel.m
//  NSMeetup-MVVM-Talk
//
//  Created by Adam Block on 5/7/14.
//  Copyright (c) 2014 Adam Block. All rights reserved.
//

#import "AFBExample3ViewModel.h"

static NSString *letters = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";


@interface AFBExample3ViewModel ()

@property (nonatomic, strong) NSMutableArray *variableCells;
@property (nonatomic, weak) NSTimer *timer;

@end


@implementation AFBExample3ViewModel

- (id)init
{
    self = [super init];
    if (self) {
        [self setupCellArray];
        [self startTimer];
    }
    return self;
}

- (void)setupCellArray
{
    self.variableCells = [NSMutableArray array];
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
    [self addCell];
}

- (void)addCell
{
    [self.variableCells addObject:@{ @"title": [self randomStringWithLength:10], @"subtitle": [self randomStringWithLength:20] }];
    NSLog(@"Variable cells: %i", self.variableCells.count);
    [self bumpUpdateFlag];
}

- (void)bumpUpdateFlag
{
    self.updateFlag = @([self.updateFlag integerValue] + 1);
}

#pragma mark - Public interface
- (NSInteger)numberOfCellsInVariableLengthSection
{
    return self.variableCells.count;
}

- (NSString *)titleForCellAtVariableRow:(NSInteger)row
{
    return self.variableCells[row][@"title"];
}

- (NSString *)subtitleForCellAtVariableRow:(NSInteger)row
{
    return self.variableCells[row][@"subtitle"];
}

#pragma mark - Helper methods
- (NSString *)randomStringWithLength:(NSInteger)length
{
    NSMutableString *randomString = [NSMutableString stringWithCapacity:length];
    
    for (int i = 0; i < length; i++) {
        [randomString appendFormat: @"%C", [letters characterAtIndex: arc4random() % [letters length]]];
    }
    
    return randomString;
}

@end
