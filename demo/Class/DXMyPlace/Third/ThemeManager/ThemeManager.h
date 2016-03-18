//
//  ThemeManager.h
//  TXiOSClient
//
//  Created by liguohui on 15/4/17.
//  Copyright (c) 2015年 liguohui. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define Bundle_Of_ThemeResource @"ThemeResource"

//the path in the bundle
#define Bundle_Path_Of_ThemeResource                                        \
[[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:Bundle_Of_ThemeResource]

@interface ThemeManager : NSObject

@property (nonatomic,strong) NSString *themeName;
@property (nonatomic,strong) NSString *themePath;

//字体的配置信息
@property(nonatomic,retain)NSDictionary *fontConfig;

+ (ThemeManager*)sharedInstance;

- (NSString *)changeTheme:(NSString*)themeName;


//获取当前主题下的图片
- (UIImage *)getThemedImageWithName:(NSString*)imgName;
//返回当前主题下的颜色
- (UIColor *)getThemedColorWithName:(NSString *)name;

@end
