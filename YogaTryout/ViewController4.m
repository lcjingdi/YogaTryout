//
//  ViewController1.m
//  YogaTryout
//
//  Created by lcjingdi on 2019/5/14.
//  Copyright © 2019 EKW. All rights reserved.
//

#import "ViewController4.h"
#import <YogaKitObjC/UIView+Yoga.h>
#import "Show.h"
#import "ShowTableViewCell.h"

@interface ViewController4 ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, assign) YGValue  *paddingHorizontal;
@property (nonatomic, assign) YGValue *padding;
@property (nonatomic, strong) UIColor *backgroundColor;

@property (nonatomic, strong) NSArray<Show *> *shows;

@property (nonatomic, strong) UIScrollView *contentView;
@property (nonatomic, copy) NSString *showCellIdentifier;

// Overall show info
@property (nonatomic, assign) int showPopularity;
@property (nonatomic, copy) NSString *showYear;
@property (nonatomic, copy) NSString *showRating;
@property (nonatomic, copy) NSString *showLength;
@property (nonatomic, copy) NSString *showCast;
@property (nonatomic, copy) NSString *showCreators;

// Show selected
@property (nonatomic, assign) int showSelectedIndex;
@property (nonatomic, copy) NSString *selectedShowSeriesLabel;

@end

@implementation ViewController4

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    CGRect contentViewRect = CGRectZero;
    for (UIView *view in _contentView.subviews) {
        contentViewRect = CGRectUnion(contentViewRect, view.frame);
    }
    _contentView.contentSize = contentViewRect.size;
}

- (void)defaultValue {
    self.backgroundColor = [UIColor blackColor];
    self.shows = [Show loadShows];
    self.contentView = [[UIScrollView alloc] initWithFrame:CGRectZero];
    self.showCellIdentifier = @"ShowCell";
    
    self.showPopularity = 5;
    self.showYear = @"2010";
    self.showRating = @"TV-14";
    self.showLength = @"3 Series";
    self.showCast = @"Benedict Cumberbatch, Martin Freeman, Una Stubbs";
    self.showCreators = @"Mark Gatiss, Steven Moffat";
    
    self.showSelectedIndex = 2;
    self.selectedShowSeriesLabel = @"S3:E3";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Frame 布局";
    [self demo1];
    //        [self demo2];
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
    
    [self.contentView configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.width = YGPointValue(size.width);
        layout.height = YGPointValue(size.height);
    }];
    
    [self.contentView.yoga applyLayoutPreservingOrigin:YES];
}

- (void)demo1 {
    [self defaultValue];
    
    self.contentView.backgroundColor = self.backgroundColor;
    
    [self.contentView configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        layout.flexDirection = YGFlexDirectionColumn;
        layout.height = YGPointValue(self.view.bounds.size.height);
        layout.width = YGPointValue(self.view.bounds.size.width);
    }];
    [self.view addSubview:self.contentView];
    
    Show *show = self.shows[self.showSelectedIndex];
    UIImageView *episodeImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    episodeImageView.backgroundColor = [UIColor grayColor];
    
    UIImage *image = [UIImage imageNamed:show.image];
    episodeImageView.image = image;
    
    CGFloat imageWidth = image.size.width;
    CGFloat imageHeight = image.size.height;
    
    [episodeImageView configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        //        layout.flexGrow = 1;
        layout.width = YGPointValue(self.view.frame.size.width);
        layout.alignItems = YGAlignCenter;
        layout.aspectRatio = imageWidth /imageHeight;
    }];
    [self.contentView addSubview:episodeImageView];
    
    UIView *summaryView = [[UIView alloc] initWithFrame:CGRectZero];
    [summaryView configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        layout.flexDirection = YGFlexDirectionRow;
        layout.padding = YGPointValue(8.0);
    }];
    UILabel *summaryPopularityLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    summaryPopularityLabel.text = @"★★★★★";
    summaryPopularityLabel.textColor = [UIColor redColor];
    [summaryPopularityLabel configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        layout.flexGrow = 1;
    }];
    [summaryView addSubview:summaryPopularityLabel];
    
    UIView *summaryInfoView = [[UIView alloc] initWithFrame:CGRectZero];
    [summaryInfoView configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        layout.flexGrow = 1;
        layout.flexDirection = YGFlexDirectionRow;
        layout.justifyContent = YGJustifySpaceBetween;
    }];
    
    [self.contentView addSubview:summaryView];
    
    for (NSString *text in @[self.showYear,self.showRating,self.showLength]) {
        UILabel *summaryInfoLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        summaryInfoLabel.text = text;
        summaryInfoLabel.font = [UIFont systemFontOfSize:14];
        summaryInfoLabel.textColor = [UIColor lightGrayColor];
        [summaryInfoLabel configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
            layout.isEnabled = YES;
        }];
        [summaryInfoView addSubview:summaryInfoLabel];
    }
    [summaryView addSubview:summaryInfoView];
    
    UIView *summaryInfoSpacerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 1)];
    [summaryInfoSpacerView configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        layout.flexGrow = 1;
    }];
    [summaryView addSubview:summaryInfoSpacerView];
    
    UIView *titleView = [[UIView alloc] initWithFrame:CGRectZero];
    [titleView configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        layout.flexDirection = YGFlexDirectionRow;
        layout.padding = YGPointValue(8.0);
    }];
    
    UILabel *titleEpisodeLabel = [self showLabelFor:self.selectedShowSeriesLabel font:[UIFont systemFontOfSize:14]];
    [titleView addSubview:titleEpisodeLabel];
    
    UILabel *titleFullLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    titleFullLabel.text = show.title;
    titleFullLabel.font = [UIFont boldSystemFontOfSize:16];
    titleFullLabel.textColor = [UIColor lightGrayColor];
    [titleFullLabel configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        layout.marginLeft = YGPointValue(20);
        layout.marginBottom = YGPointValue(5.0);
    }];
    [titleView addSubview:titleFullLabel];
    [self.contentView addSubview:titleView];
    
    UIView *descriptionView = [[UIView alloc] initWithFrame:CGRectZero];
    [descriptionView configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        layout.paddingHorizontal = YGPointValue(8.0);
    }];
    UILabel *descriptionLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    descriptionLabel.font = [UIFont systemFontOfSize:14];
    descriptionLabel.numberOfLines = 3;
    descriptionLabel.textColor = [UIColor lightGrayColor];
    descriptionLabel.text = show.detail;
    [descriptionLabel configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        layout.marginBottom = YGPointValue(5.0);
    }];
    [descriptionView addSubview:descriptionLabel];
    
    NSString *castText = [NSString stringWithFormat:@"Cast: %@",self.showCast];
    UILabel *castLabel = [self showLabelFor:castText font:[UIFont boldSystemFontOfSize:14]];
    [descriptionView addSubview:castLabel];
    
    NSString *creatorText = [NSString stringWithFormat:@"Creators: %@", self.showCreators];
    UILabel *creatorLabel = [self showLabelFor:creatorText font:[UIFont systemFontOfSize:14]];
    [descriptionView addSubview:creatorLabel];
    
    [self.contentView addSubview:descriptionView];
    
    UIView *actionsView = [[UIView alloc] initWithFrame:CGRectZero];
    [actionsView configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        layout.flexDirection = YGFlexDirectionRow;
        layout.padding = YGPointValue(8.0);
    }];
    
    UIView *addActionView = [self showActionViewFor:@"add" text:@"My List"];
    [actionsView addSubview:addActionView];
    
    UIView *shareActionView = [self showActionViewFor:@"share" text:@"Share"];
    [actionsView addSubview:shareActionView];
    
    [self.contentView addSubview:actionsView];
    
    UIView *tabsView = [[UIView alloc] initWithFrame:CGRectZero];
    [tabsView configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        layout.flexDirection = YGFlexDirectionRow;
        layout.padding = YGPointValue(8.0);
    }];
    
    UIView *episodesTabView = [self showTabBarFor:@"EPISODES" selected:YES];
    [tabsView addSubview:episodesTabView];
    
    UIView *moreTabView = [self showTabBarFor:@"MORE LIKE THIS" selected:NO];
    [tabsView addSubview:moreTabView];
    
    [self.contentView addSubview:tabsView];
    
    UITableView *showsTableView = [[UITableView alloc] init];
    showsTableView.delegate = self;
    showsTableView.dataSource = self;
    showsTableView.backgroundColor = self.backgroundColor;
    [showsTableView registerClass:[ShowTableViewCell class] forCellReuseIdentifier:self.showCellIdentifier];
    [showsTableView configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        layout.flexGrow = 1;
    }];
    
    [self.contentView addSubview:showsTableView];
    
    [self.contentView.yoga applyLayoutPreservingOrigin:YES];
}

- (void) demo2 {
    UIView *contentView = [[UIView alloc] initWithFrame:self.view.bounds];
    contentView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:contentView];
    
    [contentView configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        layout.flexDirection = YGFlexDirectionRow;
        //        layout.flexWrap = YGWrapWrap;
        layout.justifyContent = YGJustifyFlexStart;
    }];
    
    UIView *v1 = [[UIView alloc] init];
    v1.backgroundColor = [UIColor whiteColor];
    [v1 configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        layout.width = YGPointValue(150);
        layout.height = YGPointValue(30);
        layout.flexShrink = 0.1;
    }];
    UIView *v2 = [[UIView alloc] init];
    v2.backgroundColor = [UIColor redColor];
    [v2 configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        layout.width = YGPointValue(200);
        layout.height = YGPointValue(60);
        layout.flexShrink = 0.2;
    }];
    UIView *v3 = [[UIView alloc] init];
    v3.backgroundColor = [UIColor blueColor];
    [v3 configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        layout.width = YGPointValue(300);
        layout.height = YGPointValue(100);
        layout.flexShrink = 0.3;
    }];
    
    [contentView addSubview:v1];
    [contentView addSubview:v2];
    [contentView addSubview:v3];
    
    [contentView.yoga applyLayoutPreservingOrigin:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100.0f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"Selected row %ld", (long)indexPath.row);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.shows.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ShowTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.showCellIdentifier forIndexPath:indexPath];
    cell.show = self.shows[indexPath.row];
    return cell;
}

- (UILabel *)showLabelFor:(NSString *)text font:(UIFont *)font {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
    
    label.font = font;
    label.textColor = [UIColor redColor];
    label.text = text;
    [label configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        layout.marginBottom = YGPointValue(5.0);
    }];
    
    return label;
}

- (UIView *)showActionViewFor:(NSString *)imageName text:(NSString *)text {
    UIView *actionView = [[UIView alloc] initWithFrame:CGRectZero];
    [actionView configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        layout.alignItems = YGAlignCenter;
        layout.marginRight = YGPointValue(20.0);
    }];
    
    UIButton *actionButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [actionButton setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [actionButton configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        layout.padding = YGPointValue(10.0);
    }];
    [actionView addSubview:actionButton];
    UILabel *actionLabel = [self showLabelFor:text font:[UIFont systemFontOfSize:12.0]];
    [actionView addSubview:actionLabel];
    
    return actionView;
}

- (UIView *)showTabBarFor:(NSString *)text selected:(BOOL)selected {
    // 1
    UIView *tabView = [[UIView alloc] initWithFrame:CGRectZero];
    [tabView configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        layout.alignItems = YGAlignCenter;
        layout.marginRight = YGPointValue(20.0);
    }];
    
    // 2
    UIFont *tabLabelFont = [[UIFont alloc] init];
    if (selected) {
        tabLabelFont = [UIFont boldSystemFontOfSize:14];
    } else {
        tabLabelFont = [UIFont systemFontOfSize:16];
    }
    CGSize fontSize = [text sizeWithAttributes:@{NSFontAttributeName: tabLabelFont}];
    
    // 3
    UIView *tabSelectionView =[[UIView alloc] initWithFrame:CGRectMake(0, 0, fontSize.width, 3)];
    if (selected) {
        tabSelectionView.backgroundColor = [UIColor redColor];
    }
    [tabSelectionView configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        layout.marginBottom = YGPointValue(5.0);
    }];
    [tabView addSubview:tabSelectionView];
    
    // 4
    UILabel *tabLabel = [self showLabelFor:text font:tabLabelFont];
    [tabView addSubview:tabLabel];
    
    return tabView;
}

@end
