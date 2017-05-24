//
//  CDrawView.m
//  DrawRect_
//
//  Created by mac on 17/5/24.
//  Copyright © 2017年 cai. All rights reserved.
//

#import "CDrawView.h"

@implementation CDrawView

// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    CGContextRef ref = UIGraphicsGetCurrentContext();
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(30, 100)];
    [path addLineToPoint:CGPointMake(300, 300)];
    [path addLineToPoint:CGPointMake(160, 360)];
    
    [path closePath];
    
    CGContextAddPath(ref, path.CGPath);
    
    //设置状态信息
    //1. 线宽
    CGContextSetLineWidth(ref, 20);
    
    //2. 设置线段两端样式
    /*
     typedef CF_ENUM(int32_t, CGLineCap) {
     kCGLineCapButt,        //默认
     kCGLineCapRound,
     kCGLineCapSquare
     };
     */
    CGContextSetLineCap(ref, kCGLineCapRound);
    
    //3. 设置线段连接处的样式
    /*
     typedef CF_ENUM(int32_t, CGLineJoin) {
     kCGLineJoinMiter,      //默认
     kCGLineJoinRound,
     kCGLineJoinBevel
     };
     */
    CGContextSetLineJoin(ref, kCGLineJoinRound);
    
    //4. 设置绘图颜色
    //    [[UIColor redColor] setStroke]; //画边的时候使用红色 --仅用于渲染时 为kCGPathStroke时
    //    [[UIColor yellowColor] setFill];    //设置填充时颜色 --kCGPathFill
    
    [[UIColor blueColor] set];  //填充和描边 使用同一颜色
    
    //上面所有的设置状态的代码，都会将状态应用于当前上下文中的所有路径
    
    //    CGContextDrawPath(ref, kCGPathFill);
    
    CGContextDrawPath(ref, kCGPathStroke);
    
    //    CGContextDrawPath(ref, kCGPathFillStroke);  //既填充也描边
    
}

//绘制基本图形
- (void)drawFundationalShape
{
    //获取上下文
    CGContextRef ref = UIGraphicsGetCurrentContext();
    
    //创建UIBezierPath
    //向UIBezierPath中添加路径
    //绘制矩形
    //    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(50, 50, 100, 100)];
    
    //绘制圆角矩形
    //    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(50, 50, 200, 100) cornerRadius:50];
    
    //绘制椭圆
    //    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(50, 50, 200, 100)];
    
    //绘制 --圆  cornerRadius: 边长/2.0  半径
    // 两种:
    //    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(50, 50, 100, 100) cornerRadius:50];
    //    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(50, 50, 100, 100)];
    //画弧
    //绘制一个弧 clockwise: 顺时针或逆时针
    //    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(200, 200) radius:50 startAngle:0 endAngle:M_PI_2 clockwise:NO];
    
    //以画弧方式画一个圆
    //    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(200, 200) radius:50 startAngle:0 endAngle:M_PI * 2 clockwise:YES];
    
    //画圆环
    //直接画一个圆 设置线宽 --推荐使用这种方式
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(200, 200) radius:50 startAngle:0 endAngle:M_PI * 2 clockwise:YES];
    CGContextSetLineWidth(ref, 20);   //线宽 里外各一半
    
    //把UIBezierPath添加到上下文中
    CGContextAddPath(ref, path.CGPath);
    
    //渲染
    /*
     typedef CF_ENUM (int32_t, CGPathDrawingMode) {
     kCGPathFill,
     kCGPathEOFill,
     kCGPathStroke,
     kCGPathFillStroke,
     kCGPathEOFillStroke
     };
     */
    CGContextDrawPath(ref, kCGPathStroke);
    
    //    CGContextDrawPath(ref, kCGPathFill); //填充
}

@end
