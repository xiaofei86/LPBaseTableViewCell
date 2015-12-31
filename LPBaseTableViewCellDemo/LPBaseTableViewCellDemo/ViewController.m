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
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LPBaseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([LPBaseTableViewCell class]) forIndexPath:indexPath];
    [cell tableView:tableView separatorLineForCellAtIndexPath:indexPath];
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    cell.textLabel.textColor = [UIColor orangeColor];
    cell.textLabel.text = [NSString string];
    cell.textLabel.font = [UIFont systemFontOfSize:[UIFont systemFontSize]];
    if (indexPath.row == [tableView numberOfRowsInSection:0] / 2) {
        cell.textLabel.text = @"\u6211\u5c31\u662f\u6211\uff0c\u662f\u989c\u8272\u4e0d\u4e00\u6837\u7684\u70df\u706b\uff01";
        cell.bottomSeparatorLineColor = [UIColor blueColor];
        cell.bottomSeparatorLineHeight = 4;
        cell.bottomSeparatorLineInsets = UIEdgeInsetsMake(0, 30, 0, 30);
    } else if (indexPath.row == [tableView numberOfRowsInSection:0] / 2 + 1) {
        NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:@"\u867d\u7136\u4e0d\u77e5\u9053\u697c\u4e0a\u5728\u8bf4\u4ec0\u4e48\uff0c\u4f46\u662f\u597d\u5389\u5bb3\u7684\u6837\u5b50\u3002"];
        [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:NSMakeRange(0, 1)];
        [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor darkGrayColor] range:NSMakeRange(1, 1)];
        [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor lightGrayColor] range:NSMakeRange(2, 1)];
        [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor magentaColor] range:NSMakeRange(3, 1)];
        [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor grayColor] range:NSMakeRange(4, 1)];
        [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(5, 1)];
        [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor greenColor] range:NSMakeRange(6, 1)];
        [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor blueColor] range:NSMakeRange(7, 1)];
        [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor cyanColor] range:NSMakeRange(8, 1)];
        [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor orangeColor] range:NSMakeRange(9, 1)];
        [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor magentaColor] range:NSMakeRange(10, 1)];
        [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor brownColor] range:NSMakeRange(11, 1)];
        [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor orangeColor] range:NSMakeRange(12, 1)];
        [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor purpleColor] range:NSMakeRange(13, 1)];
        [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor brownColor] range:NSMakeRange(14, 1)];
        [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor blueColor] range:NSMakeRange(15, 1)];
        [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor cyanColor] range:NSMakeRange(16, 1)];
        [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor orangeColor] range:NSMakeRange(17, 1)];
        [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor magentaColor] range:NSMakeRange(18, 1)];
        [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor blueColor] range:NSMakeRange(19, 1)];
        [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor orangeColor] range:NSMakeRange(20, 1)];
        cell.textLabel.attributedText = attributedString;
        cell.textLabel.font = [UIFont systemFontOfSize:14];
        cell.bottomSeparatorLineColor = [UIColor greenColor];
        cell.bottomSeparatorLineHeight = 8;
        cell.bottomSeparatorLineInsets = UIEdgeInsetsMake(0, 0, 0, 0);
    }
    return cell;
}

@end
