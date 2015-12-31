//
//  LPBaseTableViewCell.h
//  BangDuoBao
//
//  Created by XuYafei on 15/9/1.
//  Copyright (c) 2015年 Loopeer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LPBaseTableViewCell : UITableViewCell

- (void)tableView:(UITableView *)tableView separatorLineForCellAtIndexPath:(NSIndexPath *)indexPath;

@property (nonatomic, assign) UIColor *topSeparatorLineColor;
@property (nonatomic, assign) UIColor *bottomSeparatorLineColor;

@property (nonatomic, assign) CGFloat topSeparatorLineHeight;
@property (nonatomic, assign) CGFloat bottomSeparatorLineHeight;

@property (nonatomic, assign) UIEdgeInsets topSeparatorLineInsets;
@property (nonatomic, assign) UIEdgeInsets bottomSeparatorLineInsets;

@property (nonatomic, assign) BOOL hideTopSeparatorLine;
@property (nonatomic, assign) BOOL hideBottomSeparatorLine;

@end
