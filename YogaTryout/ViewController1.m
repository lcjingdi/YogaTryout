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
@property (nonatomic, strong) UILabel *label3;
@property (nonatomic, strong) UILabel *label4;
@property (nonatomic, strong) UILabel *label5;
@property (nonatomic, strong) UILabel *label6;
@property (nonatomic, strong) UILabel *label7;
@property (nonatomic, strong) UIButton *button1;
@property (nonatomic, strong) UIButton *button2;
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
    self.label1.text = @"★★★★★";
    self.label1.textColor = [UIColor redColor];
    [self.label1 sizeToFit];
    [self.contentScrollView addSubview:self.label1];
    
    self.label1.frame = CGRectMake(0, CGRectGetMaxY(self.view1.frame) + 10, self.view.frame.size.width, 0);
    [self.label1 sizeToFit];
    
    self.label2 = [[UILabel alloc] initWithFrame:CGRectZero];
    self.label2.text = @"2010 TV-14 3 Series";
    self.label2.textColor = [UIColor lightGrayColor];
    self.label2.numberOfLines = 1;
    self.label2.frame = CGRectMake(CGRectGetMaxX(self.label1.frame) + 5 + 10 + 30, self.label1.frame.origin.y, self.view.frame.size.width - self.label1.frame.size.width, 0);
    [self.label2 sizeToFit];
    [self.contentScrollView addSubview:self.label2];
    
    self.label3 = [[UILabel alloc] initWithFrame:CGRectZero];
    self.label3.text = @"S3:E3";
    self.label3.textColor = [UIColor redColor];
    self.label3.frame = CGRectMake(0, CGRectGetMaxY(self.label2.frame) + 10, 0, 0);
    [self.label3 sizeToFit];
    [self.contentScrollView addSubview:self.label3];
    
    self.label4 = [[UILabel alloc] initWithFrame:CGRectZero];
    self.label4.text = @"His Last Vow";
    self.label4.textColor = [UIColor lightGrayColor];
    self.label4.frame = CGRectMake(CGRectGetMaxX(self.label3.frame) + 5, CGRectGetMaxY(self.label2.frame) + 10, 0, 0);
    [self.label4 sizeToFit];
    [self.contentScrollView addSubview:self.label4];
    
    self.label5 = [[UILabel alloc] initWithFrame:CGRectZero];
    self.label5.text = show.detail;
    self.label5.textColor = [UIColor lightGrayColor];
    self.label5.frame = CGRectMake(0 , CGRectGetMaxY(self.label4.frame) + 10, self.contentScrollView.frame.size.width, 0);
    self.label5.numberOfLines = 0;
    [self.label5 sizeToFit];
    [self.contentScrollView addSubview:self.label5];
    
    self.label6 = [[UILabel alloc] initWithFrame:CGRectZero];
    self.label6.text = @"Cast: Benedict Cumberbatch, Martin Freeman, Una Stubbs";
    self.label6.textColor = [UIColor lightGrayColor];
    self.label6.frame = CGRectMake(0, CGRectGetMaxY(self.label5.frame) + 10, self.contentScrollView.frame.size.width, 0);
    self.label6.numberOfLines = 0;
    [self.label6 sizeToFit];
    [self.contentScrollView addSubview:self.label6];
    
    self.label7 = [[UILabel alloc] initWithFrame:CGRectZero];
    self.label7.text = @"Creators: Mark Gatiss, Steven Moffat";
    self.label7.textColor = [UIColor lightGrayColor];
    self.label7.frame = CGRectMake(0, CGRectGetMaxY(self.label6.frame) + 10, self.contentScrollView.frame.size.width, 0);
    self.label7.numberOfLines = 0;
    [self.label7 sizeToFit];
    [self.contentScrollView addSubview:self.label7];
    
    self.button1 = [[UIButton alloc] initWithFrame:CGRectZero];
    [self.button1 setImage:[UIImage imageNamed:@"add"] forState:UIControlStateNormal];
    [self.button1 setTitle:@"My List" forState:UIControlStateNormal];
    self.button1.frame = CGRectMake(0, CGRectGetMaxY(self.label7.frame) + 10, 60, 44);
    [self.button1 setTitleEdgeInsets:UIEdgeInsetsMake(self.button1.imageView.frame.size.height+10 ,-self.button1.imageView.frame.size.width, 0.0,0.0)];
    [self.button1 setImageEdgeInsets:UIEdgeInsetsMake(-10, 0.0,0.0, -self.button1.titleLabel.bounds.size.width)];
    [self.contentScrollView addSubview:self.button1];
    
    self.button2 = [[UIButton alloc] initWithFrame:CGRectZero];
    [self.button2 setImage:[UIImage imageNamed:@"share"] forState:UIControlStateNormal];
    [self.button2 setTitle:@"share" forState:UIControlStateNormal];
    self.button2.frame = CGRectMake(CGRectGetMaxX(self.button1.frame) + 10, CGRectGetMaxY(self.label7.frame) + 10, 60, 44);
    [self.button2 setTitleEdgeInsets:UIEdgeInsetsMake(self.button2.imageView.frame.size.height+10 ,-self.button2.imageView.frame.size.width, 0.0,0.0)];
    [self.button2 setImageEdgeInsets:UIEdgeInsetsMake(-10, 0.0,0.0, -self.button2.titleLabel.bounds.size.width)];
    
    [self.contentScrollView addSubview:self.button2];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.contentScrollView addSubview:self.tableView];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    CGRect contentViewRect = CGRectZero;
    for (UIView *view in self.contentScrollView.subviews) {
        contentViewRect = CGRectUnion(contentViewRect, view.frame);
    }
    self.contentScrollView.contentSize = CGSizeMake(contentViewRect.size.width, contentViewRect.size.height + 64);
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
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    cell.textLabel.text = self.shows[indexPath.row];
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

@end
