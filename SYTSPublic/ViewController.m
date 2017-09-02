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
    
    NSDate * nowTime = [NSDate date];
    
    NSLog(@"当前时间为：  %ld",(long)[nowTime nthWeekday]);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
