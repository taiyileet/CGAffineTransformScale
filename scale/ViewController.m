//
//  ViewController.m
//  scale
//
//  Created by 李婷 on 15/11/24.
//  Copyright © 2015年 李婷. All rights reserved.
//

#import "ViewController.h"
#import <Masonry.h>

@interface ViewController ()

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UIView *a_view;
@property (nonatomic, strong) UIButton *button;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //set button
    [self configButton];
    
}

- (void)configButton{
    self.button = [UIButton buttonWithType:UIButtonTypeCustom];
    self.button.clipsToBounds = YES;
    [self.button setImage:[UIImage imageNamed:@"dot_red"] forState:UIControlStateNormal];
    self.button.layer.cornerRadius = 10;
    [self.button addTarget:self action:@selector(buttonDidClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_button];
    [self.button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(50);
        make.bottom.equalTo(self.view.mas_bottom).offset(-30);
        make.width.height.mas_equalTo(20);
    }];
}

- (void)buttonDidClicked:(UIButton *)sender{
   [self setImageView];
}

- (void)setImageView{
    self.imageView = [[UIImageView alloc] init];
    self.imageView.image = [UIImage imageNamed:@"bloodSuger_temp_red"];
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    //set image rotate 90 degree
    //    imageView.transform = CGAffineTransformMakeRotation(M_PI / 2.1);
    
    //set CGAffineTransformScale
    [UIImageView beginAnimations:nil context:nil];
    [UIImageView setAnimationDuration:3.0];
    // *** 设置锚点
    self.imageView.layer.anchorPoint = CGPointMake(0.5, 1);
    self.imageView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 3, 3);
    [UIView commitAnimations];
    [self.view addSubview:_imageView];
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.button.mas_centerX);
        make.width.and.height.mas_equalTo(30);
        make.bottom.equalTo(self.button.mas_bottom).offset(-10);
    }];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
