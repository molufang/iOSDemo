//
//  DXBaseSegementSelect.m
//  T3Incubator
//
//  Created by CAXA on 16/3/14.
//  Copyright © 2016年 mlf. All rights reserved.
//

#import "DXBaseSegementSelect.h"
#import "DXTitleSegement.h"
#define kTitleViewHeight 44 //  标题视图高度

@interface DXBaseSegementSelect ()<UIScrollViewDelegate>
{
    NSInteger _lastIndex;    //  记录滚动视图最后滚动页码
}
@end

@implementation DXBaseSegementSelect

-(instancetype)init
{
    if (self = [super init]) {
        
        _lastIndex = 0;
        self.currentSegPageIndex = 0;
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self resetTitleScrollFrame];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self addSomeViews];
}

- (void)addSomeViews
{
    _titleView = [[DXTitleSegement alloc] init];
    //    _titleView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:_titleView];
    
    
    _controllerContainScrollView = [[UIScrollView alloc] init];
    _controllerContainScrollView.bounces = NO;
    _controllerContainScrollView.pagingEnabled = YES;
    _controllerContainScrollView.delegate = self;
    _controllerContainScrollView.backgroundColor = [UIColor magentaColor];
    _controllerContainScrollView.showsHorizontalScrollIndicator = NO;//不显示底部的滚动条
    _controllerContainScrollView.showsVerticalScrollIndicator = NO;//水平方向不显示滑动条
    //    _controllerContainScrollView.backgroundColor = [UIColor whiteColor];
    
    //  防止点击statusbar tableview不能滚动到顶部
    _controllerContainScrollView.scrollsToTop = NO;
    [self.view addSubview:_controllerContainScrollView];
    
    _titleView.frame = CGRectMake(0, 0, self.Rect_Used.size.width, kTitleViewHeight);
    
     _controllerContainScrollView.frame = CGRectMake(0, _titleView.bottom, self.Rect_Used.size.width, ContentViewHeight -  kTitleViewHeight);
//    _controllerContainScrollView.frame = CGRectMake(0, _titleView.bottom, self.Rect_Used.size.width, ContentViewHeight -  kTitleViewHeight);
}

//  重新设置frame
- (void)resetTitleScrollFrame
{
    
    _titleView.frame = CGRectMake(0, 0, self.Rect_Used.size.width, kTitleViewHeight);
    _controllerContainScrollView.frame = CGRectMake(0, _titleView.bottom, self.Rect_Used.size.width, ContentViewHeight -  kTitleViewHeight);
    
    [self addTitleView:_titleArray];
    
    [_titleView changeSliderViewWithIndex:self.currentSegPageIndex];
}

//  添加头部
- (void)addTitleView:(NSArray *)titleArray
{
    
    [_titleView setisHiddenSepLine:self.isSepLine isHiddenSliderView:self.isSliderView];
    
    [_titleView setTitleArray:titleArray Target:self Selector:@selector(titleBtnAction:)];
    
    _controllerContainScrollView.contentSize = CGSizeMake(self.Rect_Used.size.width * titleArray.count, ContentViewHeight -  kTitleViewHeight);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - title button click aciton
- (void)titleBtnAction:(UIButton *)btn
{
    NSString *buttonTitle = [btn titleForState:UIControlStateNormal];
    NSLog(@"tip:点击了button->%@",buttonTitle);
    _titleView.sliderView.left = _controllerContainScrollView.contentOffset.x/self.titleArray.count;
    [_controllerContainScrollView setContentOffset:CGPointMake((btn.tag - 10000) * self.Rect_Used.size.width, 0) animated:YES];
    
    [self loadDataWithCurrent:(btn.tag - 10000)];
}

#pragma mark - UIScrollView delegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if ([scrollView isEqual:_controllerContainScrollView]) {
        _titleView.sliderView.left = scrollView.contentOffset.x/self.titleArray.count;
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger currentPage = scrollView.contentOffset.x/self.Rect_Used.size.width;
    
    [self loadDataWithCurrent:currentPage];
}

//  判断是否重新加载数据
- (void)loadDataWithCurrent:(NSInteger)currentPage
{
    //  修改标题颜色
    UIButton *btn = (UIButton *)[_titleView viewWithTag:(10000 + currentPage)];
    if (self.buttonSelectedColor) {
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [btn setBackgroundColor:_buttonSelectedColor];
    }else{
        
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [btn setBackgroundColor:[[ThemeManager sharedInstance] getThemedColorWithName:@"GeneralMainColor"]];
    }
    
    
    NSLog(@"tip:当前segment-->%ld",(long)currentPage);
    
    //  如果当前页面滚动结束 则不进行页面加载
    if (_lastIndex != currentPage) {
        UIButton *btn = (UIButton *)[_titleView viewWithTag:(10000 + _lastIndex)];
        [btn setTitleColor:[[ThemeManager sharedInstance] getThemedColorWithName:@"GeneralGrayColor"] forState:UIControlStateNormal];
        [btn setBackgroundColor:[UIColor whiteColor]];
        
        [self refreshCurrentPageData:currentPage];
        
        CGFloat r = arc4random()%255 / 255.0;
        CGFloat g = arc4random()%255 / 255.0;
        CGFloat b = arc4random()%255 / 255.0;
        _controllerContainScrollView.backgroundColor = [UIColor colorWithRed:r green:g blue:b alpha:0.5];
        NSLog(@"tip:页面改变，重新加载数据");
    }
    _lastIndex = currentPage;
}

//   设置指示条颜色
-(void)setButtonSelectedColor:(UIColor *)buttonSelectedColor
{
    _buttonSelectedColor = buttonSelectedColor;
    self.titleView.sliderViewBgColor = buttonSelectedColor;
}


//设置上面的竖着的分割线
- (void)setIsSepLine:(BOOL)isSepLine {
    
    _isSepLine = isSepLine;
    self.titleView.isSepLine = isSepLine;
}

//设置下面的下划线
- (void)setIsSliderView:(BOOL)isSliderView {
    
    _isSliderView = isSliderView;
    self.titleView.isSliderView = isSliderView;
}





/**
 *  刷新相应页面数据
 *
 *  @param currentPage 当前页面
 */
- (void)refreshCurrentPageData:(NSInteger)currentPage
{
    self.currentSegPageIndex = currentPage;
    NSLog(@"tip:-----进行数据加载-----");
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
