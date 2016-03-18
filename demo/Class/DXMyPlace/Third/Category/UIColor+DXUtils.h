//
//  UIColor+DXUtils.h
//  DXDesign
//
//  Created by caxa on 15-7-9.
//  Copyright (c) 2015年 mlf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (DXUtils)

//  换换16进制颜色值
+ (UIColor *)colorWithHexString:(NSString *)stringToConvert ;

+ (NSString *)stringFromColor:(UIColor*)color;

- (void)getRGBComponents:(CGFloat [3])components;


@end
