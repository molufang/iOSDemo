//
//  UIButton+Transform.m
//  DeYangCloud
//
//  Created by 谢涛 on 15/11/27.
//  Copyright © 2015年 X.T. All rights reserved.
//

#import "UIButton+Transform.h"

@implementation UIButton (Transform)

- (void)setCATransForm3D {
    CAKeyframeAnimation* animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    animation.duration = 0.5;
    
    NSMutableArray *values = [NSMutableArray array];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.1, 0.1, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.2, 1.2, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.9, 0.9, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)]];
    animation.values = values;
    [self.imageView.layer addAnimation:animation forKey:nil];
//    [self.layer addAnimation:animation forKey:nil];
}

@end
