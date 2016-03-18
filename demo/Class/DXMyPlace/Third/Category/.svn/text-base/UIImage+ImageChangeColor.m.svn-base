//
//  UIImage+ImageChangeColor.m
//  XFTIOSClinet
//
//  Created by IOS_IM on 15/1/8.
//  Copyright (c) 2015年 doujingxuan. All rights reserved.
//

#import "UIImage+ImageChangeColor.h"

@implementation UIImage (ImageChangeColor)

+ (UIImage*) createImageWithColor:(UIColor*) color
{
    CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}
@end
