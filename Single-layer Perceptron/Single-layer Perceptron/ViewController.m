//
//  ViewController.m
//  Single-layer Perceptron
//
//  Created by LiChen Wei on 2015/5/9.
//  Copyright (c) 2015年 LiChen Wei. All rights reserved.
//

#import "ViewController.h"
#import "CWPerceptronObj.h"
@interface ViewController ()

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CWPerceptronObj *perce = [[CWPerceptronObj alloc]initPerceptron];
    NSMutableArray *inputAry = [[NSMutableArray alloc]initWithObjects:@"2",@"-3",@"1.4",@"-0.7", nil];
    [perce interInputValueAndStart:inputAry TargetOutput:1];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
