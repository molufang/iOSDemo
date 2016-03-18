//
//  DXBaseViewController.h
//  DXDesign
//
//  Created by molufang on 15/6/23.
//  Copyright (c) 2015年 mlf. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, XTBarButtonItemStyle) {
    XTBarButtonItemStyleSetting = 0,
    XTBarButtonItemStyleMore,
    XTBarButtonItemStyleCamera,
    XTBackButtonItemStyle,
};

// 通用Block

typedef void (^XTBarButtonItemActionBlock) (void);
typedef void(^DXGeneralBlock)(id object);
typedef void (^XTLeftBarButtonActionBlock) (void);
typedef void (^XTRightBarButtonActionBlock) (void);

@interface DXBaseViewController : UIViewController

@property (nonatomic , assign) CGRect Rect_Used;


@property (nonatomic, copy) DXGeneralBlock block;   //  处理函数回调 代替delegate

@property (nonatomic, strong)NSMutableDictionary *parameterDic; //  数据请求参数信息

@property (nonatomic, strong)UIButton *refreshBtn;  //  无数据时提示按钮

/**
 *  添加加载失败刷新按钮
 *  子类主动添加
 *  且需要在viewwillapear、旋转时设置frame  并 在不需要的时候hidden=yes
 */
- (void)addRefreshBtn;

/**
 *  点击刷新按钮方法 子类实现
 *
 */
- (void)refreshData;

/**
 *  根据特定方向设置frame
 *  @param
 */
- (CGRect)frameForOrientation:(UIInterfaceOrientation)orientation;


//- (void)panduan;

/**
 *  设置左侧带图片的导航按钮并且回调方法
 *
 *  @param imageName 设置左侧导航按钮的图片名称
 *  @param action 设置动作
 */
- (void)configureLeftBarButtonWithImageName:(NSString *)imageName action:(XTLeftBarButtonActionBlock)action;

/**
 *  设置左侧带图片的导航返回按钮
 *
 *  @param imageName 设置左侧返回按钮
 *  @param buttonRect 定制按钮的大小 一般x、y坐标都是0
 *  @param action 设置动作
 */
- (void)configureLeftBackBarButtonaction:(XTLeftBarButtonActionBlock)action;

/**
 *  设置左侧带图片的导航按钮并且回调方法
 *
 *  @param imageName 设置左侧导航按钮的图片名称
 *  @param buttonRect 定制按钮的大小 一般x、y坐标都是0
 *  @param action 设置动作
 */
- (void)configureLeftBarButtonWithImageName:(NSString *)imageName barButtonFrame:(CGRect)buttonRect action:(XTLeftBarButtonActionBlock)action;


/**
 *  设置自定义左侧带图片的导航按钮并且回调方法
 *
 *  @param imageName 设置左侧导航按钮的图片名称
 *  @param action 设置动作
 */
- (void)configureCustomLeftBarButtonWithImageName:(NSString *)imageName action:(XTLeftBarButtonActionBlock)action;


/**
 *  设置右侧带图片的导航按钮并且回调方法
 *
 *  @param imageName 设置右侧导航按钮的图片名称
 *  @param action 设置动作
 */
- (void)configureRightBarButtonWithImageName:(NSString *)imageName action:(XTRightBarButtonActionBlock)action;


/**
 *  设置右侧带图片的导航按钮并且回调方法
 *
 *  @param imageName 设置右侧导航按钮的图片名称
 *  @param buttonRect 定制按钮的大小 一般x、y坐标都是0
 *  @param action 设置动作
 */
- (void)configureRightBarButtonWithImageName:(NSString *)imageName barButtonFrame:(CGRect)buttonRect action:(XTRightBarButtonActionBlock)action;

/**
 *  设置barButtonItem以及回调方法
 *
 *  @param style 设置返回样式
 *  @param action 设置动作
 */
- (void)configureBarButtonItemStyle:(XTBarButtonItemStyle)style action:(XTBarButtonItemActionBlock)action;




/**
 *  显示加载等待
 *
 *  @param title 文本信息
 *  @param view  承载视图
 */
- (void)showProgressWithTitle:(NSString *)title inView:(UIView *)view;

/**
 *  显示加载等待
 *
 *  @param title 文本信息
 *  @param view  承载视图
 *  @param delay 多久后消失
 */
- (void)showProgressWithTitle:(NSString *)title inView:(UIView *)view afterDelay:(CGFloat)delay;

/**
 *  成功提示消息
 *
 *  @param status 文本内容
 *  @param status 显示的视图
 */
- (void)showSuccess:(NSString *)status inView:(UIView *)view;

/**
 *  失败提示消息
 *
 *  @param status 文本内容
 *  @param view   所显示的视图
 */
- (void)showError:(NSString *)status inView:(UIView *)view;

/**
 *  显示进度条
 *
 *  @param progress 进度值
 *  @param view     所显示的视图
 */
- (void)showProgressModeDeterminate:(CGFloat)progress inView:(UIView *)view;

/**
 *  显示进度条
 *
 *  @param date 返回下一天的零点时间
 */
-(NSDate *)getTheNextDayDateFromZero;

@end
