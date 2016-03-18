//
//  DXBaseViewController.m
//  DXDesign
//
//  Created by molufang on 15/6/23.
//  Copyright (c) 2015年 mlf. All rights reserved.
//

#import "DXBaseViewController.h"
#import <objc/runtime.h>

@interface DXBaseViewController ()<UIGestureRecognizerDelegate>
{
    UIInterfaceOrientation _deviceOrientation;  //  当前设备方向
}

@property (nonatomic, copy) XTBarButtonItemActionBlock barbuttonItemAction;
@property (nonatomic, copy) XTLeftBarButtonActionBlock leftBarButtonAction;
@property (nonatomic, copy) XTRightBarButtonActionBlock rightBarButtonAction;

@end

@implementation DXBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"" style:UIBarButtonItemStylePlain target:self action:nil];
    
    
    // 让所有的页面都使用 自定的的返回按钮
    WEAKSELF
    if (!([self.navigationController.viewControllers count]==1)){
        [self configureLeftBackBarButtonaction:^{
            [weakSelf.navigationController popViewControllerAnimated:YES];
        }];
    }
    //ios7.0适配
    if ([[[UIDevice currentDevice] systemVersion] doubleValue] >= 7.0) {
        self.navigationController.navigationBar.translucent = NO;
//        self.navigationController.interactivePopGestureRecognizer.enabled = YES;
//        self.navigationController.interactivePopGestureRecognizer.delegate = self;
    }
    
    self.parameterDic = [NSMutableDictionary dictionary];
    
    //  注册statusbar位置改变通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(statusBarOrientationChange:) name:UIApplicationDidChangeStatusBarOrientationNotification object:nil];
    
    [self changeCurrentFrame];
    
    self.view.backgroundColor = [UIColor whiteColor];
    //  设置navigation的返回按钮颜色
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];

    
    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)]) {
        [self setEdgesForExtendedLayout:UIRectEdgeNone];
    }
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    self.navigationController.navigationBar.translucent = NO;
    
    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.backgroundColor = [UIColor whiteColor];
    
    [self.view bringSubviewToFront:self.refreshBtn];
    
    //  视图出现重新计算frame  防止下一页面跟上一页面方向不一致 导致不匹配
    [self changeCurrentFrame];
    
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
 }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIGestureRecognizer delegate
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    if (self.navigationController.viewControllers.count == 1) {
        //关闭主界面的右滑返回
        return NO;
    } else {
        return YES;
    }
}

#pragma mark - refresh btn
-(void)addRefreshBtn
{
    if (!self.refreshBtn) {
        self.refreshBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.refreshBtn setImage:[[ThemeManager sharedInstance] getThemedImageWithName:@"loadFailedImage.png"] forState:UIControlStateNormal];
        self.refreshBtn.backgroundColor = [[ThemeManager sharedInstance] getThemedColorWithName:@"GeneralViewBgColor"];
        self.refreshBtn.frame = self.view.bounds;
        [self.refreshBtn addTarget:self action:@selector(refreshData) forControlEvents:UIControlEventTouchUpInside];
        
        self.refreshBtn.hidden = YES;
//        if (![DXNetWorkManager shareInstance].netWorkEnable) {
//            self.refreshBtn.hidden = NO;
//        }
        
        [self.view addSubview:self.refreshBtn];
    }
}

- (void)refreshData
{
    
}

#pragma mark - setting navigationbar
// 设置带图片的左侧导航按钮并且回调方法
- (void)configureLeftBarButtonWithImageName:(NSString *)imageName action:(XTLeftBarButtonActionBlock)action
{
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.frame = CGRectMake(0, 0, 21, 16);
    [leftBtn addTarget:self action:@selector(clickedLeftBarButtonItemAction) forControlEvents:UIControlEventTouchUpInside];
//    [leftBtn setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [leftBtn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    leftBtn.adjustsImageWhenHighlighted = NO;
    UIBarButtonItem *navRightBtn = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
    self.navigationItem.leftBarButtonItem =navRightBtn;
    
    self.leftBarButtonAction = action;
    
}

// 设置带图片的左侧导航按钮并且回调方法
- (void)configureLeftBackBarButtonaction:(XTLeftBarButtonActionBlock)action
{
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.frame = CGRectMake(0, 0, 16, 23);
    leftBtn.contentMode = UIViewContentModeScaleAspectFit; // 设置图片适应宽高比例

    [leftBtn addTarget:self action:@selector(clickedLeftBarButtonItemAction) forControlEvents:UIControlEventTouchUpInside];
    
//    [leftBtn setBackgroundImage:[UIImage imageNamed:@"fan-hui.png"] forState:UIControlStateNormal];
    [leftBtn setImage:[UIImage imageNamed:@"fan-hui.png"] forState:UIControlStateNormal];
    leftBtn.adjustsImageWhenHighlighted = NO;
    UIBarButtonItem *navRightBtn = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
    self.navigationItem.leftBarButtonItem =navRightBtn;
    
    self.leftBarButtonAction = action;
    
}



// 设置带图片的左侧导航按钮并且回调方法、可以定制按钮大小
- (void)configureLeftBarButtonWithImageName:(NSString *)imageName barButtonFrame:(CGRect)buttonRect action:(XTLeftBarButtonActionBlock)action
{
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.frame = buttonRect;
    [leftBtn addTarget:self action:@selector(clickedLeftBarButtonItemAction) forControlEvents:UIControlEventTouchUpInside];
    [leftBtn setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    leftBtn.adjustsImageWhenHighlighted = NO;
    UIBarButtonItem *navRightBtn = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
    self.navigationItem.leftBarButtonItem =navRightBtn;
    
    self.leftBarButtonAction = action;
}



- (void)configureCustomLeftBarButtonWithImageName:(NSString *)imageName action:(XTLeftBarButtonActionBlock)action
{
    UIView *backButtonView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 55, 40)];
    UIImageView *backButtonImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 10,25, 19)];
    backButtonImageView.image = [UIImage imageNamed:imageName];
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(0, 0, 55, 40);
    backButton.backgroundColor = [UIColor clearColor];
    [backButton addTarget:self action:@selector(clickedLeftBarButtonItemAction) forControlEvents:UIControlEventTouchUpInside];
    [backButtonView addSubview:backButtonImageView];
    [backButtonView addSubview:backButton];
    
    //创建back按钮
    UIBarButtonItem *backButtonItem = [[UIBarButtonItem alloc]initWithCustomView:backButtonView];
    UIBarButtonItem *flexBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    self.navigationItem.leftBarButtonItems = @[backButtonItem,flexBtn];
    
    self.leftBarButtonAction = action;
}

// 设置带图片的右侧导航按钮并且回调方法 可以定制按钮大小
- (void)configureRightBarButtonWithImageName:(NSString *)imageName barButtonFrame:(CGRect)buttonRect action:(XTRightBarButtonActionBlock)action{
    
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.frame = buttonRect;
    [rightBtn addTarget:self action:@selector(clickedRightBarButtonItemAction) forControlEvents:UIControlEventTouchUpInside];
    [rightBtn setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    rightBtn.adjustsImageWhenHighlighted = NO;
    UIBarButtonItem *navRightBtn = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    self.navigationItem.rightBarButtonItem =navRightBtn;
    
    self.rightBarButtonAction = action;
}

// 设置带图片的右侧导航按钮并且回调方法
- (void)configureRightBarButtonWithImageName:(NSString *)imageName action:(XTRightBarButtonActionBlock)action
{
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.frame = CGRectMake(0, 0, 24, 24);
    [rightBtn addTarget:self action:@selector(clickedRightBarButtonItemAction) forControlEvents:UIControlEventTouchUpInside];
    [rightBtn setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    rightBtn.adjustsImageWhenHighlighted = NO;
    UIBarButtonItem *navRightBtn = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    self.navigationItem.rightBarButtonItem =navRightBtn;
    self.rightBarButtonAction = action;
    
}


// 设置导航栏按钮的点击事件
- (void)configureBarButtonItemStyle:(XTBarButtonItemStyle)style action:(XTBarButtonItemActionBlock)action
{
    switch (style) {
        case XTBarButtonItemStyleSetting:
            self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@""] style:UIBarButtonItemStylePlain target:self action:@selector(clickedBarButtonItemAction)];
            break;
        case XTBarButtonItemStyleMore:
            self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@""] style:UIBarButtonItemStylePlain target:self action:@selector(clickedBarButtonItemAction)];
            break;
        case XTBarButtonItemStyleCamera:
            self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@""] style:UIBarButtonItemStylePlain target:self action:@selector(clickedBarButtonItemAction)];
            break;
        case XTBackButtonItemStyle:
        {
            
             UIView *backButtonView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 55, 40)];
            UIImageView *backButtonImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 10,28, 19)];
            backButtonImageView.image = [UIImage imageNamed:@"fan-hui.png"];
            UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
            backButton.frame = CGRectMake(0, 0, 55, 40);
            backButton.backgroundColor = [UIColor clearColor];
            [backButton addTarget:self action:@selector(clickedBarButtonItemAction) forControlEvents:UIControlEventTouchUpInside];
            [backButtonView addSubview:backButtonImageView];
            [backButtonView addSubview:backButton];
            
            //创建back按钮
            UIBarButtonItem *backButtonItem = [[UIBarButtonItem alloc]initWithCustomView:backButtonView];
            
            UIBarButtonItem *flexBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
            
            self.navigationItem.leftBarButtonItems = @[backButtonItem,flexBtn];
            break;
        }
        default:
            break;
    }
    self.barbuttonItemAction = action;
}


- (void)clickedBarButtonItemAction
{
    if (self.barbuttonItemAction) {
        self.barbuttonItemAction();
    }
}
- (void)clickedLeftBarButtonItemAction
{
    if (self.leftBarButtonAction) {
        self.leftBarButtonAction();
    }
}


- (void)clickedRightBarButtonItemAction
{
    if (self.rightBarButtonAction) {
        self.rightBarButtonAction();
    }
}



/**
 *  statusbar位置改变通知处理方法
 *  @param
 */
- (void)statusBarOrientationChange:(NSNotification *)notification
{
    [self changeCurrentFrame];
}

/**
 *  重新设置当前frame值
 */
-(void)changeCurrentFrame
{
    //  获取当前设备home键方向
    _deviceOrientation = [[UIApplication sharedApplication] statusBarOrientation];
    switch (_deviceOrientation)
    {
        case UIInterfaceOrientationPortrait:
            self.Rect_Used = [self frameForOrientation:UIInterfaceOrientationPortrait];
            break;
        case UIInterfaceOrientationPortraitUpsideDown:
            self.Rect_Used = [self frameForOrientation:UIInterfaceOrientationPortraitUpsideDown];
            break;
        case UIInterfaceOrientationLandscapeLeft:
            self.Rect_Used = [self frameForOrientation:UIInterfaceOrientationLandscapeLeft];
            break;
        case UIInterfaceOrientationLandscapeRight:
            self.Rect_Used = [self frameForOrientation:UIInterfaceOrientationLandscapeRight];
            break;
            
        default:
            break;
    }
}

/**
 *  根据特定方向设置frame
 *  @param
 */
- (CGRect)frameForOrientation:(UIInterfaceOrientation)orientation
{
    CGRect frame;
    if (orientation == UIInterfaceOrientationLandscapeLeft || orientation == UIInterfaceOrientationLandscapeRight) {
        CGRect bounds = [UIScreen mainScreen].bounds;
        frame = CGRectMake(bounds.origin.x, bounds.origin.y, bounds.size.height, bounds.size.width);
        if ([[[UIDevice currentDevice] systemVersion] floatValue]>=8.0) {
            CGRect bounds = [UIScreen mainScreen].bounds;
            frame = CGRectMake(bounds.origin.x, bounds.origin.y, bounds.size.width, bounds.size.height);
            if (IsPad) {
                frame = CGRectMake(bounds.origin.x, bounds.origin.y, bounds.size.width, bounds.size.height);
            }
        }
    } else {
        frame = [UIScreen mainScreen].bounds;
    }
    return frame;
}

- (BOOL)shouldAutorotate
{
    return YES;
}

//支持的方向
- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskAll;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    //    UIDeviceOrientation deviceOrientation = [UIDevice currentDevice].orientation;
    //    if (UIDeviceOrientationIsLandscape(deviceOrientation))
    //    {
    //        CGRect rect = [self frameForOrientation:interfaceOrientation];
    //        Rect_Used = rect;
    //    }
    //    else if(UIDeviceOrientationIsPortrait(deviceOrientation))
    //    {
    //        CGRect rect = [self frameForOrientation:interfaceOrientation];
    //         Rect_Used = rect;
    //    }
    // // Return YES for supported orientations
    return YES; // 只支持向左横向, YES 表示支持所有方向
}

#pragma mark - 横竖屏幕适配 iPhone iPad适配（父类改写）
- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation duration:(NSTimeInterval)duration
{
    CGRect frame = [self frameForOrientation:interfaceOrientation];
    self.Rect_Used = frame;//重新定义frame
}


#pragma mark - MBProgress

//
///**
// *  显示加载等待
// *
// *  @param title 文本信息
// *  @param view  承载视图
// */
//- (void)showProgressWithTitle:(NSString *)title inView:(UIView *)view
//{
//    self.progress = [[MBProgressHUD alloc] initWithView:view];
//    self.progress.delegate = self;
//    [view addSubview:self.progress];
//    self.progress.labelText = title;
//    [self.progress show:YES];
//}
//
//- (void)showProgressWithTitle:(NSString *)title inView:(UIView *)view afterDelay:(CGFloat)delay
//{
//    [self showProgressWithTitle:title inView:view];
//    self.progress.mode = MBProgressHUDModeText;
//    [self.progress hide:YES afterDelay:delay];
//}
//
///**
// *  成功提示消息
// *
// *  @param status 文本内容
// *  @param status 显示的视图
// */
//- (void)showSuccess:(NSString *)status inView:(UIView *)view
//{
//    [self showTip:status inView:view imageName:@"success-white.png"];
//}
//
///**
// *  失败提示消息
// *
// *  @param status 文本内容
// *  @param view   所显示的视图
// */
//- (void)showError:(NSString *)status inView:(UIView *)view
//{
//    [self showTip:status inView:view imageName:@"error-white.png"];
//}
//
////
//- (void)showTip:(NSString *)title inView:(UIView *)view imageName:(NSString *)imageName
//{
//    if (self.progress) {
//        [self.progress hide:NO];
//    }
//    self.progress = [[MBProgressHUD alloc] initWithView:view];
//    [view addSubview:self.progress];
//    self.progress.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
//    
//    // Set custom view mode
//    self.progress.mode = MBProgressHUDModeCustomView;
//    
//    self.progress.labelText = title;
//    
//    [self.progress show:YES];
//    [self.progress hide:YES afterDelay:1.5];
//}
//
///**
// *  显示进度条
// *
// *  @param progress 进度值
// *  @param view     所显示的视图
// */
//- (void)showProgressModeDeterminate:(CGFloat)progress inView:(UIView *)view
//{
//    if (!self.progress) {
//        self.progress = [[MBProgressHUD alloc] initWithView:view];
//        self.progress.delegate = self;
//        [view addSubview:self.progress];
//        self.progress.mode = MBProgressHUDModeAnnularDeterminate;
//        [self.progress show:YES];
//    }
//    self.progress.progress = progress;
//    
//    if (progress == 1.0) {
//        [self.progress hide:YES afterDelay:0.5];
//    }
//}
//
///**
// * Called after the HUD was fully hidden from the screen.
// */
//- (void)hudWasHidden:(MBProgressHUD *)hud
//{
//    [self.progress removeFromSuperview];
//    self.progress = nil;
//}
//
//
//




-(NSDate *)getTheNextDayDateFromZero {
//    从现在开始往后一个小时
//    NSDate *now = [[NSDate date] initWithTimeInterval:60 * 60 sinceDate:[NSDate date]];
    NSDate *now = [NSDate date];
    NSCalendar *calendarStart = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendarStart components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:now];
    NSDate *dateStart = [calendarStart dateFromComponents:components];
    NSDateComponents *compt = [[NSDateComponents alloc] init];
    [compt setDay:1];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDate *endDate = [calendar dateByAddingComponents:compt toDate:dateStart options:0];
    return endDate;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
