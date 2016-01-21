//
//  ViewController.m
//  LPBaseTableViewCellDemo
//
//  Created by XuYafei on 15/12/30.
//  Copyright © 2015年 loopeer. All rights reserved.
//

#import "ViewController.h"
#import "LPBaseTableViewCell.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation ViewController {
    UITableView *_tableView;
}

#pragma mark - Initlialization

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.navigationItem.title = @"LPBaseTableVieCell";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.separatorColor = [UIColor orangeColor];
    _tableView.separatorInset = UIEdgeInsetsMake(0, 15, 0, 15);
    [_tableView registerClass:[LPBaseTableViewCell class] forCellReuseIdentifier:NSStringFromClass([LPBaseTableViewCell class])];
    _tableView.backgroundColor = [UIColor whiteColor];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.rowHeight = 44;
    [self.view addSubview:_tableView];
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LPBaseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([LPBaseTableViewCell class]) forIndexPath:indexPath];
    [cell tableView:tableView separatorLineForCellAtIndexPath:indexPath];
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    cell.textLabel.textColor = [UIColor orangeColor];
    cell.textLabel.text = [NSString string];
    if (indexPath.row == [tableView numberOfRowsInSection:0] / 2) {
        cell.textLabel.text = @"foo";
        cell.bottomSeparatorLineColor = [UIColor blueColor];
        cell.bottomSeparatorLineHeight = 4;
        cell.bottomSeparatorLineInsets = UIEdgeInsetsMake(0, 30, 0, 30);
    } else if (indexPath.row == [tableView numberOfRowsInSection:0] / 2 + 1) {
        cell.textLabel.text = @"bar";
        cell.bottomSeparatorLineColor = [UIColor greenColor];
        cell.bottomSeparatorLineHeight = 8;
        cell.bottomSeparatorLineInsets = UIEdgeInsetsMake(0, 0, 0, 0);
    }
    return cell;
}

@end
