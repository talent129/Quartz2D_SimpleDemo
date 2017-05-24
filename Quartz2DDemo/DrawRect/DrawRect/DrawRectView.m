//
//  DrawRectView.m
//  DrawRect
//
//  Created by mac on 17/5/24.
//  Copyright © 2017年 cai. All rights reserved.
//

#import "DrawRectView.h"

@implementation DrawRectView


//进行自定义绘图 必须重写此方法
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
//    //Quartz 2D原生API绘图:
//    //1.获取图形上下文
//    CGContextRef ref = UIGraphicsGetCurrentContext();
//    
//    //2. 绘制各种路径
//    //2.1 设置一个起点
//    CGContextMoveToPoint(ref, 20, 100);
//    //2.2 设置一个终点
//    CGContextAddLineToPoint(ref, 100, 160);
//    //2.3 再添加一个终点
//    CGContextAddLineToPoint(ref, 150, 100);
//    
//    //2.4 关闭路径
//    CGContextClosePath(ref);
//    
//    //3. 渲染
//    CGContextStrokePath(ref);
    
    //UIBezierPath绘制图形:
    //1. 获取上下文
    CGContextRef ref = UIGraphicsGetCurrentContext();
    
    //2. 创建UIBezierPath对象
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    //3. 向UIBezierPath添加路径
    [path moveToPoint:CGPointMake(100, 200)];
    [path addLineToPoint:CGPointMake(160, 300)];
    
    [path addLineToPoint:CGPointMake(220, 200)];
    
    //关闭路径
    [path closePath];
    

    [path moveToPoint:CGPointMake(100, 360)];
    [path addLineToPoint:CGPointMake(260, 360)];
    
    //4. 把UIBezierPath对象添加到上下文中
    CGContextAddPath(ref, path.CGPath); //OC对象 转 C语言
    
    //5. 渲染
//    CGContextStrokePath(ref);
    
    //or
    
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
    
}


@end
