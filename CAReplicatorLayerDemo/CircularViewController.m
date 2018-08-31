//
//  CircularViewController.m
//  CAReplicatorLayerDemo
//
//  Created by 许锦伟 on 2018/8/31.
//  Copyright © 2018年 许锦伟. All rights reserved.
//

#import "CircularViewController.h"

@interface CircularViewController () {
    CAReplicatorLayer *replicatorLayer;
    CALayer *circularLayer;
}

@end

@implementation CircularViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"缩放动画-Scale";
    self.view.backgroundColor = [UIColor colorWithRed:190.f/255.f green:243.f/255.f blue:253.f/255.f alpha:1];
    [self addLayer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [circularLayer addAnimation:[self circularScaleAnimation] forKey:@""];
    
    
}

- (void)addLayer {
    
    
    replicatorLayer = [CAReplicatorLayer layer];
    replicatorLayer.bounds = CGRectMake(100, 100, 300, 300);
    replicatorLayer.position = self.view.center;
    replicatorLayer.backgroundColor = [UIColor clearColor].CGColor;
    
    [self.view.layer addSublayer:replicatorLayer];
    [self addCircularLayer];
    
}

- (void)addCircularLayer {
    circularLayer = [CALayer layer];
    circularLayer.frame = CGRectMake(250, 150, 15, 15);
    circularLayer.cornerRadius = 7.5;
    circularLayer.backgroundColor = [UIColor colorWithRed:86.f/255.f green:148.f/255.f blue:253.f/255.f alpha:1].CGColor;
    circularLayer.transform = CATransform3DMakeScale(0.01, 0.01, 0.01);
    [replicatorLayer addSublayer:circularLayer];
    
    replicatorLayer.instanceCount = 15;
    CGFloat angle = 2 * M_PI / 15;
    //    replicatorLayer.instanceDelay = 4.f/ 15.f;
    //    replicatorLayer.instanceDelay = 3.f/ 15.f;
    replicatorLayer.instanceDelay = 1.f/ 15.f;
    //设置偏移角度和方向
    replicatorLayer.instanceTransform = CATransform3DMakeRotation(angle, 0, 0, 1);
    
}

- (CABasicAnimation *)circularScaleAnimation{
    CABasicAnimation *scale = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scale.toValue = @0.1;
    scale.fromValue = @1;
    scale.duration = 1.f;
    
    scale.repeatCount = HUGE;
    return scale;
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
