//
//  ViewController.m
//  DrawRectDemo
//
//  Created by mac on 17/5/24.
//  Copyright © 2017年 cai. All rights reserved.
//

#import "ViewController.h"
#import "Draw.h"

@interface ViewController ()

@property (nonatomic, strong) Draw *drawRectView;

@end

@implementation ViewController

#pragma mark -
- (Draw *)drawRectView
{
    if (!_drawRectView) {
        _drawRectView = [[Draw alloc] initWithFrame:self.view.bounds];
        _drawRectView.backgroundColor = [UIColor orangeColor];
    }
    return _drawRectView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor cyanColor];
    
    [self createUI];
}

#pragma mark -createUI
- (void)createUI
{
    [self.view addSubview:self.drawRectView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
