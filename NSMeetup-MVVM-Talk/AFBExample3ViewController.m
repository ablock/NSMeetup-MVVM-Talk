//
//  AFBExample3ViewController.m
//  NSMeetup-MVVM-Talk
//
//  Created by Adam Block on 5/7/14.
//  Copyright (c) 2014 Adam Block. All rights reserved.
//

#import "AFBExample3ViewController.h"
#import "AFBExample3ViewModel.h"
#import "Binding.h"
#import "EXTScope.h"

typedef NS_ENUM(NSInteger, Section) {
    SectionStatic,
    SectionVariable
};


@interface AFBExample3ViewController ()

// Views
@property (nonatomic, weak) IBOutlet UITableView *tableView;

// ViewModel
@property (nonatomic, strong) AFBExample3ViewModel *viewModel;
@property (nonatomic, strong) NSMutableArray *bindings;

@end


@implementation AFBExample3ViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self setupViewModel];
    [self setupBindings];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [self.viewModel stopTimer];
    self.bindings = nil;
    self.viewModel = nil;
}

- (void)setupViewModel
{
    self.viewModel = [[AFBExample3ViewModel alloc] init];
}

#pragma mark - Bindings
- (void)setupBindings
{
    self.bindings = [NSMutableArray array];
    
    @weakify(self);
    [self.bindings addObject:[Bind(self.viewModel, updateFlag) next:^(id value) {
        @strongify(self);
        [self.tableView reloadData];
    }]];
}

#pragma mark - Tableview
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    if (indexPath.section == SectionStatic) {
        cell.textLabel.text = @"Static cell";
        cell.detailTextLabel.text = @"Me fail English? That's unpossible!";
    } else {
        cell.textLabel.text = [self.viewModel titleForCellAtVariableRow:indexPath.row];
        cell.detailTextLabel.text = [self.viewModel subtitleForCellAtVariableRow:indexPath.row];
    }
    
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == SectionStatic) {
        return 1;
    }
    return [self.viewModel numberOfCellsInVariableLengthSection];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return section == 0 ? @"Static Cells" : @"Variable Cells";
}

@end
