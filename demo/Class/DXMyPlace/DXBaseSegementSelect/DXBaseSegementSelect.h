//
//  DXBaseSegementSelect.h
//  T3Incubator
//
//  Created by CAXA on 16/3/14.
//  Copyright © 2016年 mlf. All rights reserved.
//

#import "DXBaseViewController.h"
#import "DXTitleSegement.h"

@interface DXBaseSegementSelect : DXBaseViewController

@property (nonatomic, strong)NSArray *titleArray;    //  标题数组
@property (nonatomic, strong)DXTitleSegement *titleView;   // 标题视图
@property (nonatomic, strong)UIScrollView *controllerContainScrollView;  //  承载controller的滚动视图
@property (nonatomic, assign)NSInteger currentSegPageIndex;

@property (nonatomic, strong)UIColor *buttonSelectedColor;  //  指示条颜色

@property (nonatomic,assign) BOOL isSepLine; //设置是否隐藏竖着的分割线
@property (nonatomic,assign) BOOL isSliderView; //设置是否隐藏底部的分割线


//  刷新相应页面数据
//  子类进行继承
- (void)refreshCurrentPageData:(NSInteger)currentPage;

//  添加视图
- (void)addSomeViews;

//  重新设置frame
- (void)resetTitleScrollFrame;

@end
