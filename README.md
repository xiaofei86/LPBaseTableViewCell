#LPBaseTableViewCell

[![License MIT](https://img.shields.io/badge/license-MIT-green.svg?style=flat)](https://raw.githubusercontent.com/xiaofei86/LPAssistiveTouch/master/LICENSE)&nbsp;
[![CocoaPods](http://img.shields.io/cocoapods/p/YYKit.svg?style=flat)](http://www.apple.com/ios/)&nbsp;
[![Support](https://img.shields.io/badge/support-iOS%207%2B%20-blue.svg?style=flat)](https://en.wikipedia.org/wiki/IOS_7)&nbsp;
[![Support](https://img.shields.io/badge/blog-xuyafei.cn-orange.svg)](http://www.xuyafei.cn)&nbsp;

带有默认分割线的cell。将自定义的cell继承自LPBaseTableViewCell或者直接使用。在tableView:cellForRowAtIndexPath:里调用tableView:separatorLineForCellAtIndexPath:显示默认分割线效果。

如果想对cell的分割线进行全局设置需要设置tableView的如下属性。

	_tableView.separatorColor = [UIColor orangeColor];
    _tableView.separatorInset = UIEdgeInsetsMake(0, 15, 0, 15);
    
如果想对某个cell的分割线样式进行定制，可以执行通过配置如下参数来实现。

	@property (nonatomic, assign) UIColor *topSeparatorLineColor;
	@property (nonatomic, assign) UIColor *bottomSeparatorLineColor;
	
	@property (nonatomic, assign) CGFloat topSeparatorLineHeight;
	@property (nonatomic, assign) CGFloat bottomSeparatorLineHeight;
	
	@property (nonatomic, assign) UIEdgeInsets topSeparatorLineInsets;
	@property (nonatomic, assign) UIEdgeInsets bottomSeparatorLineInsets;
	
[图片备用链接](http://c.picphotos.baidu.com/album/s%3D680%3Bq%3D90/sign=d9f52361cd8065387feaa71ba7e6d079/d50735fae6cd7b89d4b79cac082442a7d8330ec1.jpg)

<img src = "https://github.com/xiaofei86/LPBaseTableViewCell/raw/master/Images/1.png" width = 373>

#OneLine

	- (void)tableView:(UITableView *)tableView separatorLineForCellAtIndexPath:(NSIndexPath *)indexPath;		