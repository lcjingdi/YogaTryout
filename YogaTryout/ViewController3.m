//
//  ViewController3.m
//  YogaTryout
//
//  Created by lcjingdi on 2019/5/14.
//  Copyright © 2019 EKW. All rights reserved.
//

#import "ViewController3.h"
#import <Masonry/Masonry.h>

@interface ViewController3 ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UIView *view1;
@property (nonatomic, strong) UIView *view2;
@property (nonatomic, strong) UIView *view3;

@property (nonatomic, strong) UITableView *tableview;
@end

@implementation ViewController3

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"UIStackView 布局";
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    NSLog(@"viewDidLoad: %@",self.view);
//    [self.view addSubview:self.view1];
//    [self.view addSubview:self.view2];
//    [self.view addSubview:self.view3];
    self.tableview = [[UITableView alloc] initWithFrame:self.view.bounds];
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
    [self.view addSubview:self.tableview];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"viewWillAppear: %@",self.view);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    [self.view2 removeFromSuperview];
//    _view2 = nil;
    [self.navigationController pushViewController:[[UIViewController alloc] init] animated:YES];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    NSLog(@"viewWillLayoutSubviews: %@",self.view);
//    _view1.frame = CGRectMake(100, 100, 100, 40);
//    _view2.frame = CGRectMake(100, CGRectGetMaxY(_view1.frame) + 30, 100, 40);
//    _view3.frame = CGRectMake(100, CGRectGetMaxY(_view2.frame) + 30, 100, 40);
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    NSLog(@"viewDidLayoutSubviews: %@",self.view);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"12"];
    cell.textLabel.text = [NSString stringWithFormat:@"%d",indexPath.row];
    return cell;
}

- (UIView *)view1 {
    if (_view1 == nil) {
        _view1 = [[UIView alloc] initWithFrame:CGRectZero];
        _view1.backgroundColor = [UIColor redColor];
    }
    return _view1;
}
- (UIView *)view2 {
    if (_view2 == nil) {
        _view2 = [[UIView alloc] initWithFrame:CGRectZero];
        _view2.backgroundColor = [UIColor blueColor];
    }
    return _view2;
}
- (UIView *)view3 {
    if (_view3 == nil) {
        _view3 = [[UIView alloc] initWithFrame:CGRectZero];
        _view3.backgroundColor = [UIColor yellowColor];
    }
    return _view3;
}
@end
