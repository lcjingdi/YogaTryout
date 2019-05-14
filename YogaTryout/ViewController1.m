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
@property (nonatomic, strong) UIView *view1;
@property (nonatomic, strong) UIView *view2;
@property (nonatomic, strong) UIView *view3;
@property (nonatomic, strong) UIView *view4;
@property (nonatomic, strong) UIView *view5;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIScrollView *contentScrollView;

@property (nonatomic, strong) NSArray<Show *> *shows;

@end

@implementation ViewController1

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
}

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
    UIImage *image = [UIImage imageNamed:show.image];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    imageView.image = image;
    
    CGFloat imageWidth = image.size.width;
    CGFloat imageHeight = image.size.height;
    
    CGFloat widthScale = imageWidth / self.view.frame.size.width;
    
    imageView.frame = CGRectMake(0, 0, imageWidth, imageHeight);
    
    [self.view addSubview:imageView];
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
