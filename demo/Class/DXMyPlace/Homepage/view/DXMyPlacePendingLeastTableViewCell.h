//
//  DXMyPlacePendingLeastTableViewCell.h
//  T3Incubator
//
//  Created by mlf on 16/3/15.
//  Copyright © 2016年 mlf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DXMyPlacePendingLeastTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *backGroundOneView;


@property (weak, nonatomic) IBOutlet UIView *leftOneView;



@property (weak, nonatomic) IBOutlet UIView *leftTwoView;


@property (weak, nonatomic) IBOutlet UILabel *LeftDayLabel;



@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@property (weak, nonatomic) IBOutlet UILabel *timeLabel;


@property (weak, nonatomic) IBOutlet UILabel *moneyLabel;




@property (weak, nonatomic) IBOutlet UIButton *payButton;




@end
