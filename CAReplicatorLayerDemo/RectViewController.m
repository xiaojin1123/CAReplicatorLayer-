//
//  RectViewController.m
//  CAReplicatorLayerDemo
//
//  Created by 许锦伟 on 2018/8/31.
//  Copyright © 2018年 许锦伟. All rights reserved.
//

#import "RectViewController.h"

@interface RectViewController () {
    CAReplicatorLayer *replicatorLayer;
    CAShapeLayer *activityLayer;
}

@end

@implementation RectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"透明度动画-opacity";
    self.view.backgroundColor = [UIColor colorWithRed:190.f/255.f green:243.f/255.f blue:253.f/255.f alpha:1];
    [self addLayer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.animations = @[[self alphaAnimation],[self activityScaleAnimation]];
    group.duration = 1.f;
    group.repeatCount = HUGE;
    [activityLayer addAnimation:group forKey:@""];
}

- (void)addLayer {
    replicatorLayer = [CAReplicatorLayer layer];
    replicatorLayer.bounds = CGRectMake(100, 100, 300, 300);
    replicatorLayer.position = self.view.center;
    replicatorLayer.backgroundColor = [UIColor clearColor].CGColor;
    [self.view.layer addSublayer:replicatorLayer];
    [self addActivityLayer];
    
}

- (void)addActivityLayer {
    activityLayer = [CAShapeLayer layer];
    
    //使用贝塞尔曲线绘制矩形路径
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(self.view.center.x, self.view.center.y/2)];
    [path addLineToPoint:CGPointMake(self.view.center.x + 20, self.view.center.y/2)];
    [path addLineToPoint:CGPointMake(self.view.center.x + 10, self.view.center.y/2 + 20)];
    [path addLineToPoint:CGPointMake(self.view.center.x - 10 , self.view.center.y/2 + 20)];
    [path closePath];
    activityLayer.fillColor = [UIColor whiteColor].CGColor;
    activityLayer.path = path.CGPath;
    //设置图层不可见
    activityLayer.transform = CATransform3DMakeScale(0.01, 0.01, 0.01);
    
    [replicatorLayer addSublayer:activityLayer];
    
    //复制的图层数为三个
    replicatorLayer.instanceCount = 3;
    //设置每个复制图层延迟时间
    replicatorLayer.instanceDelay = 1.f / 3.f;
    //设置每个图层之间的偏移
    replicatorLayer.instanceTransform = CATransform3DMakeTranslation(35, 0, 0);
}

- (CABasicAnimation *)alphaAnimation{
    CABasicAnimation *alpha = [CABasicAnimation animationWithKeyPath:@"opacity"];
    alpha.fromValue = @1.0;
    alpha.toValue = @0.01;
    alpha.duration = 1.f;
    return alpha;
}

- (CABasicAnimation *)activityScaleAnimation{
    CABasicAnimation *scale = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scale.toValue = @1;
    scale.fromValue = @1;
    return scale;
}

@end
