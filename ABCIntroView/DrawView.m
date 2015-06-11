//
//  DrawView.m
//  ABCIntroView
//
//  Created by ejt_ios on 15/4/14.
//  Copyright (c) 2015年 Adam Cooper. All rights reserved.
//

#import "DrawView.h"

@implementation DrawView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
   
    // 获得处理的上下文
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    // 设置线条的样式
    CGContextSetLineCap(contextRef, kCGLineCapSquare);
    // 设置线条的粗细程度
    CGContextSetLineWidth(contextRef, 5.0);
    // 设置颜色
    CGContextSetRGBStrokeColor(contextRef, 1.0, 0.0, 0.0, 1.0);
    // 开始一个起始路径
    CGContextBeginPath(contextRef);
    //设置起始点坐标  注意这是上下文对应区域中的相对坐标
    CGContextMoveToPoint(contextRef, 0, 0);
    // 设置下一个坐标点
    CGContextAddLineToPoint(contextRef, 100, 100);
    // 设置下一个坐标点
    CGContextAddLineToPoint(contextRef, 0, 150);
    // 设置下一个坐标点
    CGContextAddLineToPoint(contextRef, 50, 180);
    // 连接上面定义的坐标点
    CGContextStrokePath(contextRef);
}


@end
