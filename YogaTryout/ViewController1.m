//
//  ViewController1.m
//  YogaTryout
//
//  Created by lcjingdi on 2019/5/14.
//  Copyright © 2019 EKW. All rights reserved.
//

#import "ViewController1.h"
#import <YogaKitObjC/UIView+Yoga.h>
#import "Show.h"
#import "ShowTableViewCell.h"

@interface ViewController1 ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UIImageView *topImage;
@property (nonatomic, strong) UIImageView *view1;
@property (nonatomic, strong) UILabel *label1;
@property (nonatomic, strong) UILabel *label2;
@property (nonatomic, strong) UIView *view2;
@property (nonatomic, strong) UIView *view3;
@property (nonatomic, strong) UIView *view4;
@property (nonatomic, strong) UIView *view5;
@property (nonatomic, strong) UIView *view6;
@property (nonatomic, strong) UIView *view7;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIScrollView *contentScrollView;

@property (nonatomic, strong) NSArray<Show *> *shows;

@property (nonatomic, strong) UILabel *temp1;
@property (nonatomic, strong) UILabel *temp2;

@end

@implementation ViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Frame 布局";
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self defaultValue];
    
    [self setupUI];
}

- (void)defaultValue {
    self.shows = [Show loadShows];
}

- (void)setupUI {
    self.view.backgroundColor = [UIColor blackColor];
    
    Show *show = self.shows[0];
    
    [self.view addSubview:self.contentScrollView];
    self.contentScrollView.frame = self.view.bounds;
    [self.contentScrollView addSubview:self.view1];
    
    self.label1 = [[UILabel alloc] initWithFrame:CGRectZero];
    self.label1.numberOfLines = 0;
    self.label1.text = @"dasdf asdf asddasdf asdf asddasdf asdf asddasdf asdf asddasdf asdf asddasdf asdf asddasdf asdf asddasdf asdf asddasdf asdf asddasdf asdf asddasdf asdf asddasdf asdf asddasdf asdf asddasdf asdf asddasdf asdf asddasdf asdf asddasdf asdf asddasdf asdf asddasdf asdf asddasdf asdf asddasdf asdf asddasdf asdf asddasdf asdf asddasdf asdf asddasdf asdf asddasdf asdf asddasdf asdf asddasdf asdf asddasdf asdf asddasasdf asddasdf asdf asddasdf asdf asddasdf asdf asddasdf asdf asddasdf asdf asddasdf asdf asddasdf asdf asddasdf asdf asddasdf asdf asddasdf asdf asddasdf asdf asddasdf asdf asddasdf asdf asddasdf asdf asddasdf asdf asddasdf asdf asddasdf asdf asddasdf asdf asddasdf asdf asddasdf asdf asddasdf asdf asddasdf asdf asddasdf asdf asddasdf asdf asddasdf asdf asddasdf asdf asddasdf asdf asddasdf asdf asddasasdf asddasdf asdf asddasdf asdf asddasdf asdf asddasdf asdf asddasdf asdf asddasdf asdf asddasdf asdf asddasdf asdf asddasdf asdf asddasdf asdf asddasdf asdf asddasdf asdf asddasdf asdf asddasdf asdf asddasdf asdf asddasdf asdf asddasdf asdf asddasdf asdf asddasdf asdf asddasdf asdf asddasdf asdf asddasdf asdf asddasdf asdf asddasdf asdf asddasdf asdf asddasdf asdf asddasdf asdf asddasdf asdf asddasasdf asddasdf asdf asddasdf asdf asddasdf asdf asddasdf asdf asddasdf asdf asddasdf asdf asddasdf asdf asddasdf asdf asddasdf asdf asddasdf asdf asddasdf asdf asddasdf asdf asddasdf asdf asddasdf asdf asddasdf asdf asddasdf asdf asddasdf asdf asddasdf asdf asddasdf asdf asddasdf asdf asddasdf asdf asddasdf asdf asddasdf asdf asddasdf asdf asddasdf asdf asddasdf asdf asddasdf asdf asddasdf asdf asddasdf asdf asd";
    self.label1.textColor = [UIColor redColor];
    [self.label1 sizeToFit];
    [self.contentScrollView addSubview:self.label1];
    
    self.label2 = [[UILabel alloc] initWithFrame:CGRectZero];
    self.label2.text = @"2010 TV-14 3 Series";
    self.label2.textColor = [UIColor lightGrayColor];
    self.label2.numberOfLines = 0;
    [self.label2 sizeToFit];
    [self.contentScrollView addSubview:self.label2];
    
    self.label1.frame = CGRectMake(0, CGRectGetMaxY(self.view1.frame) + 10, self.view.frame.size.width, 0);
    [self.label1 sizeToFit];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    CGRect contentViewRect = CGRectZero;
    for (UIView *view in self.contentScrollView.subviews) {
        contentViewRect = CGRectUnion(contentViewRect, view.frame);
    }
    self.contentScrollView.contentSize = contentViewRect.size;
}

- (UIScrollView *)contentScrollView {
    if (_contentScrollView == nil) {
        _contentScrollView = [[UIScrollView alloc] initWithFrame:CGRectZero];
    }
    return _contentScrollView;
}
- (UIImageView *)view1 {
    if (_view1 == nil) {
        Show *show = self.shows[0];
        UIImage *image = [UIImage imageNamed:show.image];
        _view1 = [[UIImageView alloc] initWithFrame:CGRectZero];
        _view1.backgroundColor = [UIColor yellowColor];
        _view1.image = image;
        
//        CGFloat imageWidth = image.size.width;
//        CGFloat imageHeight = image.size.height;
        
//        CGFloat widthScale = imageWidth / self.view.frame.size.width;
        
        _view1.frame = CGRectMake(0, 0, self.view.frame.size.width, 200);
    }
    return _view1;
}
//
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    return 100.0f;
//}
//
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    NSLog(@"Selected row %ld", (long)indexPath.row);
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    return self.shows.count;
//}
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    ShowTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.showCellIdentifier forIndexPath:indexPath];
//    cell.show = self.shows[indexPath.row];
//    return cell;
//}
//
//- (UILabel *)showLabelFor:(NSString *)text font:(UIFont *)font {
//    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
//
//    label.font = font;
//    label.textColor = [UIColor redColor];
//    label.text = text;
//    [label configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
//        layout.isEnabled = YES;
//        layout.marginBottom = YGPointValue(5.0);
//    }];
//
//    return label;
//}
//
//- (UIView *)showActionViewFor:(NSString *)imageName text:(NSString *)text {
//    UIView *actionView = [[UIView alloc] initWithFrame:CGRectZero];
//    [actionView configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
//        layout.isEnabled = YES;
//        layout.alignItems = YGAlignCenter;
//        layout.marginRight = YGPointValue(20.0);
//    }];
//
//    UIButton *actionButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    [actionButton setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
//    [actionButton configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
//        layout.isEnabled = YES;
//        layout.padding = YGPointValue(10.0);
//    }];
//    [actionView addSubview:actionButton];
//    UILabel *actionLabel = [self showLabelFor:text font:[UIFont systemFontOfSize:12.0]];
//    [actionView addSubview:actionLabel];
//
//    return actionView;
//}
//
//- (UIView *)showTabBarFor:(NSString *)text selected:(BOOL)selected {
//    // 1
//    UIView *tabView = [[UIView alloc] initWithFrame:CGRectZero];
//    [tabView configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
//        layout.isEnabled = YES;
//        layout.alignItems = YGAlignCenter;
//        layout.marginRight = YGPointValue(20.0);
//    }];
//
//    // 2
//    UIFont *tabLabelFont = [[UIFont alloc] init];
//    if (selected) {
//        tabLabelFont = [UIFont boldSystemFontOfSize:14];
//    } else {
//        tabLabelFont = [UIFont systemFontOfSize:16];
//    }
//    CGSize fontSize = [text sizeWithAttributes:@{NSFontAttributeName: tabLabelFont}];
//
//    // 3
//    UIView *tabSelectionView =[[UIView alloc] initWithFrame:CGRectMake(0, 0, fontSize.width, 3)];
//    if (selected) {
//        tabSelectionView.backgroundColor = [UIColor redColor];
//    }
//    [tabSelectionView configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
//        layout.isEnabled = YES;
//        layout.marginBottom = YGPointValue(5.0);
//    }];
//    [tabView addSubview:tabSelectionView];
//
//    // 4
//    UILabel *tabLabel = [self showLabelFor:text font:tabLabelFont];
//    [tabView addSubview:tabLabel];
//
//    return tabView;
//}

@end
