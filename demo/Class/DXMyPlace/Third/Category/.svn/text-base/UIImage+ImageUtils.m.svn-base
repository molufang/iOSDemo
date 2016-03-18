//
//  UIImage+XFTImageSet.m
//  XFTIOSClinet
//
//  Created by zqb on 14-7-11.
//  Copyright (c) 2014年 doujingxuan. All rights reserved.
//

#import "UIImage+ImageUtils.h"

@implementation UIImage (ImageUtils)


+ (UIImage *)colorizeImage:(UIImage *)baseImage withColor:(UIColor *)theColor {
    UIGraphicsBeginImageContext(baseImage.size);
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGRect area = CGRectMake(0, 0, baseImage.size.width, baseImage.size.height);
    
    CGContextScaleCTM(ctx, 1, -1);
    CGContextTranslateCTM(ctx, 0, -area.size.height);
    
    CGContextSaveGState(ctx);
    CGContextClipToMask(ctx, area, baseImage.CGImage);
    
    [theColor set];
    CGContextFillRect(ctx, area);
	
    CGContextRestoreGState(ctx);
    
    CGContextSetBlendMode(ctx, kCGBlendModeMultiply);
    
    CGContextDrawImage(ctx, area, baseImage.CGImage);
	
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return newImage;
}

//  baseImage 要截取的图片； theMaskImage 遮罩层图片
+ (UIImage *)maskImage:(UIImage *)baseImage withImage:(UIImage *)theMaskImage
{
    CGImageRetain(baseImage.CGImage);
    CGImageRetain(theMaskImage.CGImage);
	UIGraphicsBeginImageContext(baseImage.size);
	CGContextRef ctx = UIGraphicsGetCurrentContext();
	CGRect area = CGRectMake(0, 0, baseImage.size.width, baseImage.size.height);
	CGContextScaleCTM(ctx, 1, -1);
    CGContextTranslateCTM(ctx, 0, -area.size.height);
	
	CGImageRef maskRef = theMaskImage.CGImage;
	
	CGImageRef maskImage = CGImageMaskCreate(CGImageGetWidth(maskRef),
                                             CGImageGetHeight(maskRef),
                                             CGImageGetBitsPerComponent(maskRef),
                                             CGImageGetBitsPerPixel(maskRef),
                                             CGImageGetBytesPerRow(maskRef),
                                             CGImageGetDataProvider(maskRef), NULL, false);
	
	CGImageRef masked = CGImageCreateWithMask([baseImage CGImage], maskImage);
	CGImageRelease(maskImage);
	CGImageRelease(maskRef);
	
	CGContextDrawImage(ctx, area, masked);
	CGImageRelease(masked);
	UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
	
	return newImage;
}

/* 简介：王建林（Apathy） 用来遮罩图片成需要的形状 */
+ (UIImage*) maskImage:(UIImage *)image withMask:(UIImage *)maskImage {
    
    CGImageRef maskRef = [maskImage CGImage];
    
    // 获取遮罩层
    CGImageRef actualMask = CGImageMaskCreate(CGImageGetWidth(maskRef), CGImageGetHeight(maskRef),CGImageGetBitsPerComponent(maskRef), CGImageGetBitsPerPixel(maskRef),CGImageGetBytesPerRow(maskRef), CGImageGetDataProvider(maskRef), NULL, false);
    
    // 合成图片
    CGImageRef sourceImageRef = CGImageCreateWithMask(image.CGImage, actualMask);
    
    return [UIImage imageWithCGImage:sourceImageRef];
    
}

//  改变图片大小
+ (UIImage *)originImage:(UIImage *)image scaleToSize:(CGSize)size
{
    UIGraphicsBeginImageContext(size);  //size 为CGSize类型，即你所需要的图片尺寸
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaledImage;   //返回的就是已经改变的图片
}

/*作者:窦静轩    描述:得到选择照片压缩比*/
//调整
+(CGSize)getRightPictureRatio:(CGSize)size
{
    CGFloat width = size.width;
    CGFloat height = size.height;
//    float temp;
    if (width > height) {
        if (height > 1200) {
            width =  width * 1200/height;
            height = 1200;
            
        }
    }
    else{
        if (width > 1200) {
            height = height * 1200/width;
            width = 1200;
        }
        
            
    }
    CGSize newSize = CGSizeMake(width, height);
    return newSize;
}


@end
