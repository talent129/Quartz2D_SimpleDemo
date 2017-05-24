//
//  ViewController.m
//  DrawRect_
//
//  Created by mac on 17/5/24.
//  Copyright © 2017年 cai. All rights reserved.
//

#import "ViewController.h"
#import "CDrawView.h"

#define SCREEN_Width    ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_Height   ([UIScreen mainScreen].bounds.size.height)

@interface ViewController ()

@property (nonatomic, strong) CDrawView *drawView;

@end

@implementation ViewController

#pragma mark -
- (CDrawView *)drawView
{
    if (!_drawView) {
        _drawView = [[CDrawView alloc] initWithFrame:CGRectMake(0, 20, SCREEN_Width, SCREEN_Height - 20)];
        _drawView.backgroundColor = [UIColor orangeColor];
    }
    return _drawView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self createUI];
    
}

#pragma mark -createUI
- (void)createUI
{
    [self.view addSubview:self.drawView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
