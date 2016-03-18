//
//  DXSiteImmediateUseVisit.h
//  T3Incubator
//
//  Created by applecaxa on 16/3/9.
//  Copyright © 2016年 mlf. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "DXStandardModel.h"

#ifndef SCREEN_WIDTH
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#endif

#ifndef SCREEN_HEIGHT
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
#endif

#define StandardViewHeight  (SCREEN_HEIGHT/3*2)//View 高度 根据应用情况调节
#define StandardViewWidth   (SCREEN_WIDTH)  // view宽度


@interface DXSiteImmediateUseVisit : UIView<UITableViewDelegate,UITableViewDataSource>

#pragma mark - 非必需 效果相关
/*详情页 设置该属性调用show会自带商品详情页后移动画,在ios7中 如果页面不是navgation过来的自身也会缩小*/
@property (nonatomic) UIView *GoodDetailView;
@property (nonatomic,retain) UIButton *commitButton;
@property (nonatomic,retain) UIImageView *imageView;
@property (nonatomic,retain) UILabel *titileLabel;
@property (nonatomic,retain) UILabel *contentLabel;
@property (nonatomic,retain) UILabel *moneyLabel;
@property (nonatomic) UITableView *mainTableView;

/**
 * 规格数据
 */
@property(nonatomic) NSArray<DXStandardModel *>* standardArr;


#pragma mark - 必要条件

/**
 * 显示规格
 */
- (void)show;
/**
 * 关闭显示
 */
- (void)dismiss;
@end
