//
//  ViewController.m
//  CAReplicatorLayerDemo
//
//  Created by 许锦伟 on 2018/8/29.
//  Copyright © 2018年 许锦伟. All rights reserved.
//

#import "ViewController.h"
#import "RectViewController.h"
#import "CircularViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"111"];
    if (!cell) {
        cell = [[UITableViewCell alloc] init];
    }
    if (indexPath.row == 0) {
        cell.textLabel.text = @"加载矩形指示器动画";
    } else {
        cell.textLabel.text = @"加载圆形指示器动画";
    }
    cell.textLabel.textColor = [UIColor colorWithRed:56.f/255.f green:64.f/255.f blue:84.f/255.f alpha:1];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0) {
        [self.navigationController pushViewController:[RectViewController new] animated:YES];
    } else {
        [self.navigationController pushViewController:[CircularViewController new] animated:YES];
    }
    
}


@end
