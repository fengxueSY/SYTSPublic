//
//  ViewController.m
//  SYTSPublic
//
//  Created by 666gps on 2017/8/22.
//  Copyright © 2017年 666gps. All rights reserved.
//

#import "ViewController.h"
#import "SYTSHeader.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString * nowTime = [SYTimePublic getCurrentTime];
    NSLog(@"当前时间为：  %@",nowTime);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
