//
//  LPBaseTableViewCell.m
//  BangDuoBao
//
//  Created by XuYafei on 15/9/1.
//  Copyright (c) 2015年 Loopeer. All rights reserved.
//

#import "LPBaseTableViewCell.h"

static CGFloat _defaultHeight;

typedef NS_ENUM (NSInteger, SeparatorLineStyle) {
    SeparatorLineStyleNone,
    SeparatorLineStyleOnly,
    SeparatorLineStyleTop,
    SeparatorLineStyleCenter,
    SeparatorLineStyleBottom
};

@interface LPBaseTableViewCell ()

@property (nonatomic, assign) NSInteger separatorLineStyle;

@end

@implementation LPBaseTableViewCell {
    UIImageView *_bottomSeparatorLine;
    UIImageView *_topSeparatorLine;
}

+ (void)initialize {
    _defaultHeight = 1 / [UIScreen mainScreen].scale;
}

#pragma mark - UITableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.contentView.backgroundColor = [UIColor whiteColor];
        
        _topSeparatorLineHeight = _defaultHeight;
        _bottomSeparatorLineHeight = _defaultHeight;
        _topSeparatorLineColor = [UIColor colorWithRed:0.78 green:0.78 blue:0.8 alpha:1.0];
        _bottomSeparatorLineColor = [UIColor colorWithRed:0.78 green:0.78 blue:0.8 alpha:1.0];
        
        _topSeparatorLine = [[UIImageView alloc] initWithFrame:CGRectZero];
        _topSeparatorLine.backgroundColor = [UIColor whiteColor];
        _topSeparatorLine.image = [LPBaseTableViewCell imageWithColor:_topSeparatorLineColor];
        [self addSubview:_topSeparatorLine];
        
        _bottomSeparatorLine = [[UIImageView alloc] initWithFrame:CGRectZero];
        _bottomSeparatorLine.backgroundColor = [UIColor whiteColor];
        _bottomSeparatorLine.image = [LPBaseTableViewCell imageWithColor:_bottomSeparatorLineColor];
        [self addSubview:_bottomSeparatorLine];
    }
    return self;
}

+ (NSString *)cellReuseIdentifier {
    return NSStringFromClass([self class]);
}

- (void)layoutSubviews {
    [super layoutSubviews];
    _bottomSeparatorLine.hidden = NO;
    _topSeparatorLine.hidden = NO;
    if (_hideTopSeparatorLine
        || _separatorLineStyle == SeparatorLineStyleNone
        || _separatorLineStyle == SeparatorLineStyleCenter
        || _separatorLineStyle == SeparatorLineStyleBottom) {
        _topSeparatorLine.hidden = YES;
    }
    if (_hideBottomSeparatorLine || _separatorLineStyle == SeparatorLineStyleNone) {
        _bottomSeparatorLine.hidden = YES;
    }
    
    _topSeparatorLine.frame = CGRectMake(_topSeparatorLineInsets.left, 0, CGRectGetWidth(self.frame) - _topSeparatorLineInsets.left - _topSeparatorLineInsets.right, _topSeparatorLineHeight);
    _bottomSeparatorLine.frame = CGRectMake(_bottomSeparatorLineInsets.left, CGRectGetHeight(self.frame) - _bottomSeparatorLineHeight, CGRectGetWidth(self.frame) - _bottomSeparatorLineInsets.left - _bottomSeparatorLineInsets.right, _bottomSeparatorLineHeight);
}

#pragma mark - Accessor

- (void)setSeparatorLineStyle:(NSInteger)separatorLineStyle {
    _separatorLineStyle = separatorLineStyle;
    [self setNeedsLayout];
}

- (void)setTopSeparatorLineColor:(UIColor *)topSeparatorLineColor {
    _topSeparatorLineColor = topSeparatorLineColor;
    _topSeparatorLine.image = [LPBaseTableViewCell imageWithColor:_topSeparatorLineColor];
}

- (void)setBottomSeparatorLineColor:(UIColor *)bottomSeparatorLineColor {
    _bottomSeparatorLineColor = bottomSeparatorLineColor;
    _bottomSeparatorLine.image = [LPBaseTableViewCell imageWithColor:_bottomSeparatorLineColor];
}

- (void)setTopSeparatorLineHeight:(CGFloat)topSeparatorLineHeight {
    _topSeparatorLineHeight = topSeparatorLineHeight;
    [self setNeedsLayout];
}

- (void)setBottomSeparatorLineHeight:(CGFloat)bottomSeparatorLineHeight {
    _bottomSeparatorLineHeight = bottomSeparatorLineHeight;
    [self setNeedsLayout];
}

- (void)setTopSeparatorLineInsets:(UIEdgeInsets)topSeparatorLineInsets {
    _topSeparatorLineInsets = topSeparatorLineInsets;
    [self setNeedsLayout];
}

- (void)setBottomSeparatorLineInsets:(UIEdgeInsets)bottomSeparatorLineInsets {
    _bottomSeparatorLineInsets = bottomSeparatorLineInsets;
    [self setNeedsLayout];
}

- (void)setHideTopSeparatorLine:(BOOL)hideTopSeparatorLine {
    _hideTopSeparatorLine = hideTopSeparatorLine;
    _topSeparatorLine.hidden = _hideTopSeparatorLine;
}

- (void)setHideBottomSeparatorLine:(BOOL)hideBottomSeparatorLine {
    _hideBottomSeparatorLine = hideBottomSeparatorLine;
    _bottomSeparatorLine.hidden = _hideBottomSeparatorLine;
}

#pragma mark - Public

- (void)tableView:(UITableView *)tableView separatorLineForCellAtIndexPath:(NSIndexPath *)indexPath {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (tableView.separatorStyle != UITableViewCellSeparatorStyleNone) {
            tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        }
    });
    self.topSeparatorLineInsets = UIEdgeInsetsZero;
    self.bottomSeparatorLineInsets = UIEdgeInsetsZero;
    self.topSeparatorLineColor = tableView.separatorColor;
    self.bottomSeparatorLineColor = tableView.separatorColor;
    self.topSeparatorLineHeight = _defaultHeight;
    self.bottomSeparatorLineHeight = _defaultHeight;
    self.hideTopSeparatorLine = NO;
    self.hideBottomSeparatorLine = NO;
    if ([tableView numberOfRowsInSection:indexPath.section] == 0) {
        self.separatorLineStyle = SeparatorLineStyleNone;
    } else if ([tableView numberOfRowsInSection:indexPath.section] == 1) {
        self.separatorLineStyle = SeparatorLineStyleOnly;
    } else if (indexPath.row == 0) {
        self.bottomSeparatorLineInsets = tableView.separatorInset;
        self.separatorLineStyle = SeparatorLineStyleTop;
    } else if (indexPath.row == [tableView numberOfRowsInSection:indexPath.section] - 1) {
        self.topSeparatorLineInsets = tableView.separatorInset;
        self.separatorLineStyle = SeparatorLineStyleBottom;
    } else {
        self.topSeparatorLineInsets = tableView.separatorInset;
        self.bottomSeparatorLineInsets = tableView.separatorInset;
        self.separatorLineStyle = SeparatorLineStyleCenter;
    }
}

#pragma mark - Private

+ (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContextWithOptions(rect.size, YES, [UIScreen mainScreen].scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
