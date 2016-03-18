//
//  UIImage+XFTImageSet.h
//  XFTIOSClinet
//
//  Created by zqb on 14-7-11.
//  Copyright (c) 2014年 doujingxuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (ImageUtils)

//  改变颜色
+ (UIImage *)colorizeImage:(UIImage *)baseImage withColor:(UIColor *)theColor;

//  遮罩
+ (UIImage *)maskImage:(UIImage *)baseImage withImage:(UIImage *)theMaskImage;

+ (UIImage*) maskImage:(UIImage *)image withMask:(UIImage *)maskImage;

//  改变图片大小
+ (UIImage *)originImage:(UIImage *)image scaleToSize:(CGSize)size;


/*作者:窦静轩    描述:得到选择照片压缩比*/
+(CGSize)getRightPictureRatio:(CGSize)size;


@end
