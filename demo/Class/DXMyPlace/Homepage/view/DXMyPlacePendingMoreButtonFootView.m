//
//  DXMyPlacePendingMoreButtonFootView.m
//  T3Incubator
//
//  Created by mlf on 16/3/15.
//  Copyright © 2016年 mlf. All rights reserved.
//

#import "DXMyPlacePendingMoreButtonFootView.h"

@implementation DXMyPlacePendingMoreButtonFootView

- (void)awakeFromNib {
    
    [self.moreButton setTitleColor:[[ThemeManager sharedInstance]getThemedColorWithName:@"GeneralMainColor"] forState:UIControlStateNormal];
    [self.moreButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
   
}


- (void)buttonAction:(UIButton *)btn {
    if ([self.footViewDelegate respondsToSelector:@selector(moreButtonAction:)]) {
        [self.footViewDelegate moreButtonAction:btn];
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
