//
//  ViewController2.m
//  YogaTryout
//
//  Created by lcjingdi on 2019/5/14.
//  Copyright © 2019 EKW. All rights reserved.
//

#import "ViewController2.h"
#import <YogaKitObjC/UIView+Yoga.h>
#import <Masonry/Masonry.h>

@interface ViewController2 ()
@property (nonatomic, strong) UIView *view1;
@property (nonatomic, strong) UIView *view2;
@property (nonatomic, strong) UIView *view3;
@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"Autolayout 布局";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        layout.width = YGPointValue(self.view.frame.size.width);
        layout.height = YGPointValue(self.view.frame.size.height);
        layout.alignItems = YGAlignCenter;
    }];
    
    self.view1 = [[UIView alloc] init];
    self.view1.backgroundColor = [UIColor redColor];
    [self.view1 configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        layout.marginTop = YGPointValue(100);
        layout.width = YGPointValue(100);
        layout.height = YGPointValue(100);
    }];
    [self.view addSubview:self.view1];
    
    self.view2 = [[UIView alloc] init];
    self.view2.backgroundColor = [UIColor blueColor];
    [self.view2 configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        layout.marginTop = YGPointValue(100);
        layout.width = YGPointValue(100);
        layout.height = YGPointValue(100);
    }];
    [self.view addSubview:self.view2];
    
    self.view3 = [[UIView alloc] init];
    self.view3.backgroundColor = [UIColor yellowColor];
    [self.view3 configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        layout.marginTop = YGPointValue(100);
        layout.width = YGPointValue(100);
        layout.height = YGPointValue(100);
    }];
    [self.view addSubview:self.view3];
    
    [self.view.yoga applyLayoutPreservingOrigin:YES];
}

//- (void)viewDidLayoutSubviews {
//    [super viewDidLayoutSubviews];
//    [self.view.yoga applyLayoutPreservingOrigin:YES];
//}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    [self.view.yoga applyLayoutPreservingOrigin:YES];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view2 removeFromSuperview];
}
@end
