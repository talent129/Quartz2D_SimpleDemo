//
//  Draw.m
//  DrawRectDemo
//
//  Created by mac on 17/5/24.
//  Copyright © 2017年 cai. All rights reserved.
//

#import "Draw.h"

@implementation Draw

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    CGContextRef ref = UIGraphicsGetCurrentContext();
    
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(150, 150) radius:100 startAngle:0 endAngle:M_PI * 2 clockwise:1];
    
    UIBezierPath *path1 = [UIBezierPath bezierPathWithArcCenter:CGPointMake(150, 150) radius:50 startAngle:0 endAngle:M_PI * 2 clockwise:0];
    
    CGContextAddPath(ref, path.CGPath);
    CGContextAddPath(ref, path1.CGPath);
    
    //默认填充模式: nonzero winding number rule(非零绕数规则) 从左到右跨过， +1。 从右到左跨过， -1。 最后如果是0 那么不填充 否则填充
    CGContextDrawPath(ref, kCGPathFill);
}

//奇偶填充模式
- (void)eoFill
{
    CGContextRef ref = UIGraphicsGetCurrentContext();
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(100, 100, 200, 100)];
    
    UIBezierPath *path1 = [UIBezierPath bezierPathWithArcCenter:CGPointMake(200, 150) radius:80 startAngle:0 endAngle:M_PI * 2 clockwise:1];
    
    UIBezierPath *path2 = [UIBezierPath bezierPathWithRect:CGRectMake(250, 30, 20, 200)];
    
    CGContextAddPath(ref, path.CGPath);
    CGContextAddPath(ref, path1.CGPath);
    CGContextAddPath(ref, path2.CGPath);
    
    /*
     typedef CF_ENUM (int32_t, CGPathDrawingMode) {
     kCGPathFill,
     kCGPathEOFill,
     kCGPathStroke,
     kCGPathFillStroke,
     kCGPathEOFillStroke
     };
     */
    //被覆盖过奇数次的点填充， 被覆盖过偶数次的点不填充
    //E: Even 偶数
    //O: Odd 奇数
    //EOFill: 奇偶模式填充
    CGContextDrawPath(ref, kCGPathEOFill);
}

@end
