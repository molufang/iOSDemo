//
//  DXTitleSegement.h
//  T3Incubator
//
//  Created by CAXA on 16/3/14.
//  Copyright © 2016年 mlf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DXTitleSegement : UIView


@property (nonatomic, strong)UIView *sliderView;    //  指示条
@property (nonatomic, strong)UIColor *sliderViewBgColor ;// 指示条颜色

@property (nonatomic,assign) BOOL isSepLine; //设置是否隐藏竖着的分割线
@property (nonatomic,assign) BOOL isSliderView; //设置是否隐藏底部的分割线


//设置是否显示和隐藏 底部和侧边的边框
- (void)setisHiddenSepLine:(BOOL)sepLine isHiddenSliderView:(BOOL)sliderView;


//   设置标题
- (void)setTitleArray:(NSArray *)titleArray Target:(id)target Selector:(SEL)selector;

//  初始化设置指示view
-(void)changeSliderViewWithIndex:(NSInteger)segIndex ;




@end



