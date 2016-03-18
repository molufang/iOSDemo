//
//  DXTitleSegement.m
//  T3Incubator
//
//  Created by CAXA on 16/3/14.
//  Copyright © 2016年 mlf. All rights reserved.
//

#import "DXTitleSegement.h"


@implementation DXTitleSegement
{
    NSArray *_titleArray;
    CGFloat _everySectonWith;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.isSliderView = NO;
        self.isSepLine = NO;
    }
    return self;
}

- (void)setTitleArray:(NSArray *)titleArray Target:(id)target Selector:(SEL)selector
{
    for (UIView *view in self.subviews) {
        [view removeFromSuperview];
    }
    
    _titleArray = titleArray;
    _everySectonWith = self.width / _titleArray.count;
    for (int i = 0; i < _titleArray.count; i++) {
        UIButton * button = [[UIButton alloc] initWithFrame:CGRectMake(i * _everySectonWith, 0, _everySectonWith, self.height)];
        [button setTitle:_titleArray[i] forState: UIControlStateNormal];
        [button setTitleColor:[[ThemeManager sharedInstance] getThemedColorWithName:@"GeneralGrayColor"] forState:UIControlStateNormal];
        button.userInteractionEnabled = YES;
        button.tag = 10000 + i;
        
        button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        
        [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
        
        if (i % 2 == 0) {
            CGFloat x = 0;
            if (i == 0) {
                x = button.right - 1;
            }else{
                x = 0;
            }
            UIView *sepLine = [[UIView alloc] initWithFrame:CGRectMake(x, 5, 1, self.height - 5*2)];
            if (self.sliderViewBgColor) {
                sepLine.backgroundColor = self.sliderViewBgColor;
            }else{
                sepLine.backgroundColor = [[ThemeManager sharedInstance] getThemedColorWithName:@"GeneralGrayColor"];
                sepLine.backgroundColor = [[ThemeManager sharedInstance] getThemedColorWithName:@"GeneralMainColor"];

            }
            sepLine.hidden = self.isSepLine;
            [button addSubview:sepLine];
        }
    }
    
    _sliderView = [[UIView alloc] initWithFrame:CGRectMake(0,self.height - 2, _everySectonWith, 2)];
    _sliderView.tag = 100;
    if (self.sliderViewBgColor) {
        [_sliderView setBackgroundColor:self.sliderViewBgColor];
    }else{
        [_sliderView setBackgroundColor:[[ThemeManager sharedInstance] getThemedColorWithName:@"GeneralMainColor"]];
        
    }
    
    _sliderView.hidden = self.isSliderView;
    
    //  添加底部分割线
    UIView *bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, self.bottom - 1, self.width, 1)];
    bottomView.backgroundColor = [[ThemeManager sharedInstance] getThemedColorWithName:@"GeneralMainColor"];
    [self addSubview:bottomView];
    
    [self addSubview:_sliderView];
}

-(void)changeSliderViewWithIndex:(NSInteger)segIndex
{
    UIButton *btn = (UIButton *)[self viewWithTag:(segIndex + 10000)];
    if (self.sliderViewBgColor) {
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [btn setBackgroundColor:self.sliderViewBgColor];
        
    }else{
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [btn setBackgroundColor:[[ThemeManager sharedInstance] getThemedColorWithName:@"GeneralMainColor"]];

    }
    _sliderView.left = self.width / _titleArray.count * segIndex;
}


- (void)setisHiddenSepLine:(BOOL)sepLine isHiddenSliderView:(BOOL)sliderView {
    
    if (self.isSepLine) {
        self.isSepLine = sepLine;

    } else {
        self.isSepLine = NO;
    }
    
    
    if (self.isSliderView) {
         self.isSliderView = sliderView;
    } else {
        self.isSliderView = NO;
    }
    
   
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
