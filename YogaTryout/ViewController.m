//
//  ViewController.m
//  YogaTryout
//
//  Created by lcjingdi on 2019/5/10.
//  Copyright © 2019 EKW. All rights reserved.
//

#import "ViewController.h"
#import <YogaKitObjC/UIView+Yoga.h>
#import "ViewController1.h"
#import "ViewController2.h"
#import "ViewController3.h"
#import "ViewController4.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"几种布局方式";
    
    [self.view addSubview:self.tableView];
     
     [self.tableView configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
         layout.isEnabled = YES;
         layout.flexGrow = 1;
         layout.width = YGPointValue(self.view.frame.size.width);
         layout.height = YGPointValue(self.view.frame.size.height);
     }];
    
    [self.view addSubview:self.tableView];
     [self.tableView.yoga applyLayoutPreservingOrigin:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    if (indexPath.row == 0) {
        cell.textLabel.text = @"Frame 布局";
    } else if (indexPath.row == 1) {
        cell.textLabel.text = @"Autolayout 布局";
    } else if (indexPath.row == 2) {
        cell.textLabel.text = @"UIStackView 布局";
    } else if (indexPath.row == 3) {
        cell.textLabel.text = @"Flex 布局";
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        [self.navigationController pushViewController:[[ViewController1 alloc] init] animated:YES];
    } else if (indexPath.row == 1) {
        [self.navigationController pushViewController:[[ViewController2 alloc] init] animated:YES];
    } else if (indexPath.row == 2) {
        [self.navigationController pushViewController:[[ViewController3 alloc] init] animated:YES];
    } else if (indexPath.row == 3) {
        [self.navigationController pushViewController:[[ViewController4 alloc] init] animated:YES];
    }
}

- (UITableView *)tableView {
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] init];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

@end
