//
//  DXMyPlacePendingHeadView.m
//  T3Incubator
//
//  Created by mlf on 16/3/15.
//  Copyright © 2016年 mlf. All rights reserved.
//

#import "DXMyPlacePendingHeadView.h"

@implementation DXMyPlacePendingHeadView


- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.leftdownOneView.layer.masksToBounds = YES;
    self.leftdownOneView.layer.cornerRadius = self.leftdownOneView.width/2;
    
    self.leftdownTwoView.layer.masksToBounds = YES;
    self.leftdownTwoView.layer.cornerRadius = self.leftdownTwoView.width/2;
    
    self.leftdownOneView.backgroundColor = [[ThemeManager sharedInstance] getThemedColorWithName:@"GeneralMainColor"];
    
    
    [self.downPayButton setTitleColor:[[ThemeManager sharedInstance]getThemedColorWithName:@"GeneralMainColor"] forState:UIControlStateNormal];
    
    
    
    
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
