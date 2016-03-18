//
//  DXSiteImmediateUseVisit.m
//  T3Incubator
//
//  Created by applecaxa on 16/3/9.
//  Copyright © 2016年 mlf. All rights reserved.
//

#import "DXSiteImmediateUseVisit.h"
#import "DXSiteImmdeiateOrderTableViewCell.h"
#import "DXSiteImmediateUseVisitFootView.h"

#define GapToLeft   20
#define GoodDetailScaleValue    0.9

#define SiteBgViewHeight 500 // 视图距离顶部的高度


@interface DXSiteImmediateUseVisit ()
{
    
    CGFloat _cellHeight;
    NSInteger _cellNum;
    
    UIView *bgView;
    UIView *ImageBgView;
   
    UIButton *timeButton;
    UIButton *timeCyCleButton;
   
    UIView *coverView;  // 底部的透明视图
    
    
}


@end
@implementation DXSiteImmediateUseVisit

- (instancetype)init{
    self = [super init];
    if (self) {
        [self buildViews];
        
    }
    return self;
}

-(void)buildViews
{
    self.frame = [self screenBounds];
    
    coverView =  [[UIView alloc]initWithFrame:[self topView].bounds];
    coverView.backgroundColor = [UIColor blackColor];
    coverView.alpha = 0;
    coverView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    [[self topView] addSubview:coverView];
    
    bgView = [[UIView alloc]initWithFrame:CGRectMake(0, self.frame.size.height-SiteBgViewHeight, self.frame.size.width, SiteBgViewHeight)];
//    bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, StandardViewWidth, StandardViewHeight)];
    bgView.backgroundColor = [UIColor whiteColor];
    bgView.alpha = 1.0;
    [self addSubview:bgView];
    
    ImageBgView = [[UIView alloc]initWithFrame:CGRectMake(5, self.frame.size.height-SiteBgViewHeight-17, 115, 100)];
    ImageBgView.backgroundColor = [UIColor whiteColor];
    [self addSubview:ImageBgView];
    
    self.imageView = [[UIImageView alloc]initWithFrame:CGRectMake(5, 5, 105, 90)];
    [ImageBgView addSubview:self.imageView];
    
    
    self.titileLabel = [[UILabel alloc]initWithFrame:CGRectMake(ImageBgView.right+10, 10, self.frame.size.width - 140, 20)];
    [bgView addSubview:self.titileLabel];
    
   
    
    self.contentLabel = [[UILabel alloc]initWithFrame:CGRectMake(ImageBgView.right+10, 40, self.frame.size.width - 140, 20)];
    
    self.contentLabel.font = [UIFont systemFontOfSize:12];
    [bgView addSubview:self.contentLabel];
    
    self.moneyLabel = [[UILabel alloc]initWithFrame:CGRectMake(ImageBgView.right+10, 60, self.frame.size.width - 140, 20)];
    
    self.moneyLabel.textColor = [UIColor redColor];
    [bgView addSubview:self.moneyLabel];
    
    
    timeButton = [UIButton buttonWithType:UIButtonTypeSystem];
    timeButton.frame = CGRectMake(10, self.imageView.bottom+5, self.frame.size.width-20, 33);
    [timeButton setTitle:@"入驻时间" forState:UIControlStateNormal];
    [timeButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    timeButton.layer.borderWidth = 1.0;
    timeButton.layer.borderColor = [[ThemeManager sharedInstance] getThemedColorWithName:@"ActivityLaunchBorderColor"].CGColor;
    [bgView addSubview:timeButton];
    
    timeCyCleButton = [UIButton buttonWithType:UIButtonTypeSystem];
    timeCyCleButton.frame = CGRectMake(10, timeButton.bottom+5, self.frame.size.width-20, 33);
    [timeCyCleButton setTitle:@"入驻周期" forState:UIControlStateNormal];
    [timeCyCleButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    timeCyCleButton.layer.borderWidth = 1.0;
    timeCyCleButton.layer.borderColor = [[ThemeManager sharedInstance] getThemedColorWithName:@"ActivityLaunchBorderColor"].CGColor;
    [bgView addSubview:timeCyCleButton];
    

    _commitButton = [UIButton buttonWithType:UIButtonTypeSystem];
    _commitButton.frame = CGRectMake(0, self.frame.size.height-45, self.frame.size.width, 45);
    [_commitButton setTitle:@"确定" forState:UIControlStateNormal];
    [_commitButton setBackgroundColor:[UIColor colorWithRed:0.14 green:0.36 blue:0.76 alpha:1.0]];
    [_commitButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self addSubview:_commitButton];
    
    
    UITapGestureRecognizer *tapGesture2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapSelfViewAction:) ];
    [self addGestureRecognizer:tapGesture2];
    

    [self initTableView]; // 初始化tableView
    
    
}


- (void)initTableView {
    _mainTableView = [[UITableView alloc] initWithFrame:CGRectMake(0,  timeCyCleButton.bottom, StandardViewWidth,SiteBgViewHeight - timeCyCleButton.bottom -45)];
    _mainTableView.delegate = self;
    _mainTableView.dataSource = self;
    _mainTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _mainTableView.separatorInset = UIEdgeInsetsMake(0, 10, 0, 10);
    _mainTableView.backgroundColor = [UIColor whiteColor];
    [bgView addSubview:_mainTableView];
}


- (CGRect)screenBounds
{
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
    
    // On iOS7, screen width and height doesn't automatically follow orientation
    if (floor(NSFoundationVersionNumber) <= NSFoundationVersionNumber_iOS_7_1) {
        UIInterfaceOrientation interfaceOrientation = [[UIApplication sharedApplication] statusBarOrientation];
        if (UIInterfaceOrientationIsLandscape(interfaceOrientation)) {
            CGFloat tmp = screenWidth;
            screenWidth = screenHeight;
            screenHeight = tmp;
        }
    }
    
    return CGRectMake(0, 0, screenWidth, screenHeight);
}

-(void)tapSelfViewAction:(id)sender
{
    [self dismiss];
}

- (void)dismiss {
    // 把添加的两个视图移除
//    [self removeFromSuperview];
//    
//    if (coverView) {
//        [coverView removeFromSuperview];
//    }
     [self hideAnimation];
    
}

- (void)show {
    
    [UIView animateWithDuration:0.5 animations:^{
        coverView.alpha = 0.5;
    } completion:^(BOOL finished) {
    }];
    [[self topView] addSubview:self];
    [self showAnimation];
}

-(UIView*)topView{
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    
    NSLog(@"window.subviews = %lu",(unsigned long)window.subviews.count);
    return  window.subviews[0];
}

- (void)showAnimation {
    
    CGAffineTransform t;
    if (self.GoodDetailView !=nil) {
        t = self.GoodDetailView.transform;
    }

    CGPoint mainImgCenter = ImageBgView.center;
    ImageBgView.center  = CGPointMake(mainImgCenter.x, mainImgCenter.y+SCREEN_HEIGHT);
    CGPoint tempPoint = bgView.center;
    bgView.center = CGPointMake(SCREEN_WIDTH/2, tempPoint.y+SCREEN_HEIGHT);
    [UIView animateWithDuration:0.5 animations:^{
        
        bgView.center = tempPoint;
        ImageBgView.center = mainImgCenter;

        if (self.GoodDetailView !=nil) {
            CGAffineTransform tempTransform = CGAffineTransformScale(t, GoodDetailScaleValue, GoodDetailScaleValue);
            self.GoodDetailView.transform = tempTransform;
        }
        
    }];
}


- (void)hideAnimation{
    
    CGAffineTransform t ;
    if (self.GoodDetailView != nil) {
        t = self.GoodDetailView.transform;
    }
    [UIView animateWithDuration:0.5 animations:^{
        CGPoint mainImgCenter = ImageBgView.center;
        ImageBgView.center  = CGPointMake(mainImgCenter.x, mainImgCenter.y+SCREEN_HEIGHT);
        CGPoint tempPoint = bgView.center;
        bgView.center = CGPointMake(SCREEN_WIDTH/2, tempPoint.y+SCREEN_HEIGHT);
        if (self.GoodDetailView != nil) {
            CGAffineTransform tempTransform = CGAffineTransformScale(t, 1/GoodDetailScaleValue, 1/GoodDetailScaleValue);
            self.GoodDetailView.transform = tempTransform;
        }
        coverView.alpha = 0.0;
        bgView.alpha = 0.0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

#pragma mark - setting for cell
//设置每行调用的cell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellName = @"DXSiteImmdeiateOrderTableViewCell";
    DXSiteImmdeiateOrderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellName];
    
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"DXSiteImmdeiateOrderTableViewCell" owner:self options:nil] lastObject];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return cell;
    
}

//设置cell每行间隔的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 40;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 6;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];//选中后的反显颜色即刻消失
    NSLog(@"click cell section : %ld row : %ld",(long)indexPath.section,(long)indexPath.row);
    
    
}


//设置选中的行所执行的动作
-(NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return indexPath;
    
}


-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *tempView = [[UIView alloc] init];
    return tempView;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    DXSiteImmediateUseVisitFootView *footView = [[[NSBundle mainBundle]loadNibNamed:@"DXSiteImmediateUseVisitFootView" owner:self options:nil]lastObject];
    return footView;
}

//设置section header 的高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.1;
}

//设置section footer的高度
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 35;
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
