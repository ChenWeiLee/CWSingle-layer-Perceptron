//
//  CWPerceptronObj.m
//  Single-layer Perceptron
//
//  Created by LiChen Wei on 2015/5/11.
//  Copyright (c) 2015年 LiChen Wei. All rights reserved.
//

#import "CWPerceptronObj.h"

@implementation CWPerceptronObj

- (id)initPerceptron{
    self = [super init];
    if (self) {
        plusTotalValue = 0;
        targetOutput = 0;
        needFix = YES;
        _learnRate = [NSNumber numberWithDouble:0.1];
        _inputXAry = [[NSMutableArray alloc]init];
        _weightsAry = [[NSMutableArray alloc]init];
    }
    return self;
}


- (int)interInputValueAndStart:(NSMutableArray *)intput TargetOutput:(int)target
{
    [_inputXAry removeAllObjects];
    _inputXAry = [intput mutableCopy];
    targetOutput = target;
    
    if ([intput count] > [_weightsAry count]) {
        double avg = 0.0;
        needFix = YES;
        if ([_weightsAry count] == 0) {
            for (int i = 0; i < [intput count]; i ++) {
                int avgRan = arc4random() % 1000;
                int ne = arc4random() %10 +1;
                
                if (avgRan % ne == 0) {
                    avgRan = -1 * avgRan;
                }
                avg = avgRan/100.0;
                
                [_weightsAry addObject:[NSNumber numberWithDouble:avg]];
            }
            
        }else{
            for (NSString *strDouble in _weightsAry) {
                avg = avg + [strDouble doubleValue];
            }
            avg = avg/[_weightsAry count];
            
            for (int i = 0; i < [intput count] - [_weightsAry count]; i ++) {
                [_weightsAry addObject:[NSNumber numberWithDouble:avg]];
            }
        }
    }
    return [self stepOne_PlusTotal];
}

- (int)stepOne_PlusTotal{
    for (int x = 0; x < [_inputXAry count]; x ++) {
        plusTotalValue = plusTotalValue + [[_inputXAry objectAtIndex:x] doubleValue] * [[_weightsAry objectAtIndex:x] doubleValue];
    }
    return [self stepTwo_SGN:plusTotalValue];
}
- (int)stepTwo_SGN:(double)totalValue{
    int sgnValue = 0;
    if (totalValue == 0) {
        needFix = NO;
    }else{
        if (totalValue > 0)
            sgnValue = 1;
        else
            sgnValue = -1;
    }
    if (needFix) {
        [self stepThree_calMultiplication:sgnValue];
    }
    
    return sgnValue;
}
- (void)stepThree_calMultiplication:(int)sgn{
    double correctValue = [_learnRate doubleValue]*(targetOutput+sgn);
    if (correctValue != 0) {
        for (int z = 0; z < [_inputXAry count]; z++) {
            [_weightsAry replaceObjectAtIndex:z withObject:[NSString stringWithFormat:@"%f",[[_weightsAry objectAtIndex:z] doubleValue]+correctValue * [[_inputXAry objectAtIndex:z] doubleValue]]];
        }
    }else{
        needFix = NO;
    }
}

@end
