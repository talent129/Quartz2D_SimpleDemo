//
//  MatrixView.m
//  Matrix
//
//  Created by mac on 17/5/24.
//  Copyright © 2017年 cai. All rights reserved.
//

#import "MatrixView.h"

@implementation MatrixView

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    CGContextRef ref = UIGraphicsGetCurrentContext();
    
    //将当前图形上下文的状态信息保存到栈中
    CGContextSaveGState(ref);
    
//    /*------------------------对整个上下文的坐标系进行操作-----------------------*/
//    //平移
    CGContextTranslateCTM(ref, 100, 100);
//
//    //缩放
    CGContextScaleCTM(ref, 0.3, 0.3);
//
//    //旋转
//    CGContextRotateCTM(ref, M_PI_4 * 0.5);
    
    //画一个矩形
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(150, 250, 100, 70)];
    
    //画一个椭圆
    UIBezierPath *path1 = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(120, 300, 180, 120)];
    
    //画一个线段
    UIBezierPath *path2 = [UIBezierPath bezierPath];
    [path2 moveToPoint:CGPointMake(200, 80)];
    [path2 addLineToPoint:CGPointMake(300, 400)];
    
    CGContextAddPath(ref, path.CGPath);
    CGContextAddPath(ref, path1.CGPath);
    CGContextAddPath(ref, path2.CGPath);
    
    //设置颜色等状态信息
    CGContextSetLineWidth(ref, 20);
    [[UIColor redColor] set];
    CGContextSetLineJoin(ref, kCGLineJoinRound);
    
    //渲染
    CGContextDrawPath(ref, kCGPathStroke);
    
    //上面的图形渲染完毕后 希望再添加一个矩形
    //要求: 不做任何旋转、缩放、平移等操作 同时，线条颜色 粗细 连接处的样式都使用默认样式
    //恢复图形上下文中的状态信息
    CGContextRestoreGState(ref);
    
    UIBezierPath *path3 = [UIBezierPath bezierPathWithRect:CGRectMake(20, 100, 150, 60)];
    CGContextAddPath(ref, path3.CGPath);
    //渲染
    CGContextDrawPath(ref, kCGPathStroke);
    
}

//仿射变换
- (void)test
{
    CGContextRef ref = UIGraphicsGetCurrentContext();
    
    /*------------------------对整个上下文的坐标系进行操作-----------------------*/
    //平移
    CGContextTranslateCTM(ref, 100, 100);
    
    //缩放
    CGContextScaleCTM(ref, 0.3, 0.3);
    
    //旋转
    CGContextRotateCTM(ref, M_PI_4 * 0.5);
    
    //画一个矩形
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(150, 250, 100, 70)];
    
    //画一个椭圆
    UIBezierPath *path1 = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(120, 300, 180, 120)];
    
    //画一个线段
    UIBezierPath *path2 = [UIBezierPath bezierPath];
    [path2 moveToPoint:CGPointMake(200, 80)];
    [path2 addLineToPoint:CGPointMake(300, 400)];
    
    CGContextAddPath(ref, path.CGPath);
    CGContextAddPath(ref, path1.CGPath);
    CGContextAddPath(ref, path2.CGPath);
    
    //渲染
    CGContextDrawPath(ref, kCGPathStroke);
}

@end
