//
//  ViewController.m
//  Matrix
//
//  Created by mac on 17/5/24.
//  Copyright © 2017年 cai. All rights reserved.
//

#import "ViewController.h"
#import "MatrixView.h"

@interface ViewController ()

@property (nonatomic, strong) MatrixView *matrixView;

@end

@implementation ViewController

#pragma mark -
- (MatrixView *)matrixView
{
    if (!_matrixView) {
        _matrixView = [[MatrixView alloc] initWithFrame:self.view.bounds];
        _matrixView.backgroundColor = [UIColor orangeColor];
    }
    return _matrixView;
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
    [self.view addSubview:self.matrixView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
