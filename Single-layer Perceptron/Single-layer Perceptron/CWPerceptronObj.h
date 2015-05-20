//
//  CWPerceptronObj.h
//  Single-layer Perceptron
//
//  Created by LiChen Wei on 2015/5/11.
//  Copyright (c) 2015年 LiChen Wei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CWPerceptronObj : NSObject
{
    double plusTotalValue;
    int targetOutput;
    BOOL needFix;
}
@property (nonatomic) NSMutableArray *inputXAry;   //輸入值
@property (nonatomic) NSMutableArray *weightsAry;  //加權值
@property (nonatomic,strong) NSNumber *learnRate;  //學習速度 0.0~1.0
//@property (nonatomic) NSMutableArray *correctionWeightsAry; //加權修正值
- (id)initPerceptron;
- (int)interInputValueAndStart:(NSMutableArray *)intput TargetOutput:(int)target;
@end
