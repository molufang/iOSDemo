//
//  ThemeManager.m
//  TXiOSClient
//
//  Created by liguohui on 15/4/17.
//  Copyright (c) 2015年 liguohui. All rights reserved.
//


#import "ThemeManager.h"

static ThemeManager *_themeManager=nil;

@implementation ThemeManager

+ (ThemeManager*)sharedInstance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _themeManager = [[ThemeManager alloc] init];
    });
    
    return _themeManager;
}


+ (id)copyWithZone:(NSZone *)zone{
    return self;
}

- (id)init{
    if (self=[super init]) {
        [self initDefaultTheme];
        
        //初始化字体配置文件
        NSString *fontConfigPath = [[NSBundle mainBundle] pathForResource:@"fontColor" ofType:@"plist"];
        _fontConfig = [NSDictionary dictionaryWithContentsOfFile:fontConfigPath];

    }
    
    return self;
}



#pragma mark - public static methods -
- (NSString *)changeTheme:(NSString*)themeName{
    
    if (!themeName || [themeName isEqualToString:@""]) {
//        默认的主题
        NSString *themePath=[[NSBundle mainBundle] resourcePath];
        
        if ([[NSFileManager defaultManager] fileExistsAtPath:themePath isDirectory:NULL]) {
            self.themePath=themePath;
        }
        NSString *filePath = [themePath stringByAppendingPathComponent:@"fontColor.plist"];
        self.fontConfig = [NSDictionary dictionaryWithContentsOfFile:filePath];

        return nil;
    }
    
    NSString *themePath=[Bundle_Path_Of_ThemeResource stringByAppendingPathComponent:themeName];
    if ([[NSFileManager defaultManager] fileExistsAtPath:themePath isDirectory:NULL]) {
        self.themePath=themePath;
    }
//    设置字体配置文件
    NSString *filePath = [themePath stringByAppendingPathComponent:@"fontColor.plist"];
    self.fontConfig = [NSDictionary dictionaryWithContentsOfFile:filePath];
    
    return themeName;
}



- (UIImage*)getThemedImageWithName:(NSString*)imgName{
    if (!imgName || [imgName isEqualToString:@""]) {
        return nil;
    }
    
    NSString *imgPath=[self.themePath stringByAppendingPathComponent:imgName];
    
    return [UIImage imageWithContentsOfFile:imgPath];
}
//返回当前主题下的颜色
- (UIColor *)getThemedColorWithName:(NSString *)name {
    if (name.length == 0) {
        return nil;
    }
    
    NSString *rgb = [self.fontConfig objectForKey:name];

    //    十六进制的颜色
 /*   if ([rgb hasPrefix:@"0x"] ) {
        
//        NSInteger rgbValue = [rgb integerValue];
        
        unsigned long red = strtoul([rgb UTF8String],0,0);
        NSLog(@"转换完的数字为：%lx",red);
        
        UIColor *color =UIColorFromRGB(red);
        return color;
        
    }*/
    if ([rgb hasPrefix:@"0x"]) {
        
        NSString *r_str=[rgb substringWithRange:NSMakeRange(2, 2)];
        NSString *g_str=[rgb substringWithRange:NSMakeRange(4, 2)];
        NSString *b_str=[rgb substringWithRange:NSMakeRange(6, 2)];

        unsigned long  r = strtoul([r_str UTF8String],0,16);
        unsigned long  g = strtoul([g_str UTF8String],0,16);
        unsigned long  b = strtoul([b_str UTF8String],0,16);

        UIColor *color = [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1];
        return color;

        
    }

    
    NSArray *rgbs = [rgb componentsSeparatedByString:@","];
    
    float r = [rgbs[0] floatValue];
    float g = [rgbs[1] floatValue];
    float b = [rgbs[2] floatValue];

    
    if (rgbs.count == 3) {
        UIColor *color = [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1];
        return color;
    }
    else
    {
        float alpha=[rgbs[3] floatValue];
        UIColor *color = [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:alpha];
        return color;
    }
    
    
    
    
    
    
    return nil;
}

#pragma mark - private methods -
- (void)initDefaultTheme{
    
    NSString *themePath=[[NSBundle mainBundle] resourcePath];

    if ([[NSFileManager defaultManager] fileExistsAtPath:themePath isDirectory:NULL]) {
        self.themePath=themePath;
    }
    
    //init UI

}

@end
