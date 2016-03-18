//
//  DXMyPlacePendingMoreButtonFootView.h
//  T3Incubator
//
//  Created by mlf on 16/3/15.
//  Copyright © 2016年 mlf. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DXMyPlacePendingMoreButtonFootViewMoreButtonDelegate <NSObject>

- (void)moreButtonAction:(UIButton *)btn;

@end



@interface DXMyPlacePendingMoreButtonFootView : UIView


@property (weak, nonatomic) IBOutlet UIButton *moreButton;

@property (nonatomic,assign) id<DXMyPlacePendingMoreButtonFootViewMoreButtonDelegate>footViewDelegate;


@end
