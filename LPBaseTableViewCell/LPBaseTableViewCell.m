//
//  LPBaseTableViewCell.m
//  BangDuoBao
//
//  Created by XuYafei on 15/9/1.
//  Copyright (c) 2015年 Loopeer. All rights reserved.
//

#import "LPBaseTableViewCell.h"
#import "Masonry.h"

static const CGFloat defaultHeight = 0.5;

typedef NS_ENUM (NSInteger, SeparatorLineStyle) {
    SeparatorLineStyleOnly,
    SeparatorLineStyleTop,
    SeparatorLineStyleCenter,
    SeparatorLineStyleBottom,
    SeparatorLineStyleNone
};

@interface LPBaseTableViewCell ()

@property (nonatomic, assign) NSInteger separatorLineStyle;

@end

@implementation LPBaseTableViewCell {
    UIImageView *_bottomSeparatorLine;
    UIImageView *_topSeparatorLine;
}

#pragma mark - UITableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupViews];
        [self setupConstraints];
        _separatorLineStyle = SeparatorLineStyleNone;
        _topSeparatorLineHeight = defaultHeight;
        _bottomSeparatorLineHeight = defaultHeight;
        _topSeparatorLineColor = [UIColor groupTableViewBackgroundColor];
        _bottomSeparatorLineColor = [UIColor groupTableViewBackgroundColor];
        _topSeparatorLineInsets = UIEdgeInsetsZero;
        _topSeparatorLineInsets = UIEdgeInsetsZero;
        _hideTopSeparatorLine = NO;
        _hideBottomSeparatorLine = NO;
        
        _topSeparatorLine = [[UIImageView alloc] initWithFrame:CGRectZero];
        _topSeparatorLine.image = [LPBaseTableViewCell imageWithColor:_topSeparatorLineColor];
        [self addSubview:_topSeparatorLine];
        
        _bottomSeparatorLine = [[UIImageView alloc] initWithFrame:CGRectZero];
        _bottomSeparatorLine.image = [LPBaseTableViewCell imageWithColor:_bottomSeparatorLineColor];
        [self addSubview:_bottomSeparatorLine];
    }
    return self;
}

- (void)setupViews {
    self.contentView.backgroundColor = [UIColor whiteColor];
    self.opaque = YES;
}

- (void)setupConstraints {
    
}

+ (NSString *)cellReuseIdentifier {
    return NSStringFromClass([self class]);
}

- (void)redraw {
    [self.contentView setNeedsUpdateConstraints];
    [self.contentView updateConstraintsIfNeeded];
    [self.contentView setNeedsLayout];
    [self.contentView layoutIfNeeded];
}

- (void)updateConstraints {
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
    
    [_topSeparatorLine mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self);
        make.left.equalTo(self).offset(_topSeparatorLineInsets.left);
        make.right.equalTo(self).offset(-_topSeparatorLineInsets.right);
        make.height.mas_equalTo(_topSeparatorLineHeight);
    }];
    
    [_bottomSeparatorLine mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self);
        make.left.equalTo(self).offset(_bottomSeparatorLineInsets.left);
        make.right.equalTo(self).offset(-_bottomSeparatorLineInsets.right);
        make.height.mas_equalTo(_bottomSeparatorLineHeight);
    }];
    [super updateConstraints];
}

#pragma mark - Accessor

- (void)setSeparatorLineStyle:(NSInteger)separatorLineStyle {
    _separatorLineStyle = separatorLineStyle;
    [self setNeedsUpdateConstraints];
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
    [self setNeedsUpdateConstraints];
}

- (void)setBottomSeparatorLineHeight:(CGFloat)bottomSeparatorLineHeight {
    _bottomSeparatorLineHeight = bottomSeparatorLineHeight;
    [self setNeedsUpdateConstraints];
}

- (void)setTopSeparatorLineInsets:(UIEdgeInsets)topSeparatorLineInsets {
    _topSeparatorLineInsets = topSeparatorLineInsets;
    [self setNeedsUpdateConstraints];
}

- (void)setBottomSeparatorLineInsets:(UIEdgeInsets)bottomSeparatorLineInsets {
    _bottomSeparatorLineInsets = bottomSeparatorLineInsets;
    [self setNeedsUpdateConstraints];
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
    if (tableView.separatorStyle != UITableViewCellSeparatorStyleNone) {
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    self.topSeparatorLineInsets = UIEdgeInsetsZero;
    self.bottomSeparatorLineInsets = UIEdgeInsetsZero;
    self.topSeparatorLineColor = tableView.separatorColor;
    self.bottomSeparatorLineColor = tableView.separatorColor;
    self.topSeparatorLineHeight = defaultHeight;
    self.bottomSeparatorLineHeight = defaultHeight;
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
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
