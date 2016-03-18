//
//  DXMyPlacePendingPaymentViewController.m
//  T3Incubator
//
//  Created by mlf on 16/3/15.
//  Copyright © 2016年 mlf. All rights reserved.
//

#import "DXMyPlacePendingPaymentViewController.h"

#import "DXMyPlacePendingLeastTableViewCell.h"

#import "DXMyPlacePendingHeadView.h"

#import "DXMyPlacePendingNewTableViewCell.h"

#import "DXMyPlacePendingMoreButtonFootView.h"

@interface DXMyPlacePendingPaymentViewController ()<UITableViewDelegate,UITableViewDataSource,DXMyPlacePendingMoreButtonFootViewMoreButtonDelegate>

{
    DXMyPlacePendingHeadView *header;
    DXMyPlacePendingMoreButtonFootView *footView;

    
}

@property (nonatomic,strong) NSMutableArray *upAndDownArray; //存放需要折叠的行列


@end


@implementation DXMyPlacePendingPaymentViewController

- (instancetype)init
{
    if (self = [super init]) {
        self.sourceArray = [NSMutableArray array];
//        self.currentPageIndex = 1;
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    self.pendingPaymentTableView.backgroundColor = [UIColor whiteColor];
    self.pendingPaymentTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.upAndDownArray = [[NSMutableArray alloc]initWithCapacity:10];
}





#pragma mark - UITableView delegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
 
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    if ([self.upAndDownArray containsObject:[NSNumber numberWithInteger:section]]) {
        return self.sourceArray.count;

    } else {
        
        return 0;
    }

}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellName = @"DXMyPlacePendingNewTableViewCell";
    DXMyPlacePendingNewTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellName];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"DXMyPlacePendingNewTableViewCell" owner:self options:nil] lastObject];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    
    return 230;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 42;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 97;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    header = [[[NSBundle mainBundle] loadNibNamed:@"DXMyPlacePendingHeadView" owner:self options:nil] lastObject];
    return header;

}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    
    footView = [[[NSBundle mainBundle] loadNibNamed:@"DXMyPlacePendingMoreButtonFootView" owner:self options:nil] lastObject];
    footView.moreButton.tag = section;
    footView.footViewDelegate = self;
    
    if ([self.upAndDownArray containsObject:[NSNumber numberWithInteger:section]]) {
        [footView.moreButton setTitle:@"收起" forState:UIControlStateNormal];
    } else {
        [footView.moreButton setTitle:@"查看更多账单" forState:UIControlStateNormal];
    }
    
    return footView;
}


#pragma mark footViewDelegate----
- (void)moreButtonAction:(UIButton *)btn {
    if (self.sourceArray) {
        [self.sourceArray removeAllObjects];
    }
    
    [self.sourceArray  addObject:@"1"];
    [self.sourceArray  addObject:@"1"];
    [self.sourceArray  addObject:@"1"];
    [self.sourceArray  addObject:@"1"];
    
    NSInteger tage = btn.tag;
    if ([self.upAndDownArray containsObject:[NSNumber numberWithInteger:tage]]) {
        [self.upAndDownArray removeObject:[NSNumber numberWithInteger:tage]];
        NSIndexSet *set = [[NSIndexSet alloc]initWithIndex:tage];
        [btn setTitle:@"查看更多账单" forState:UIControlStateNormal];
        [self.pendingPaymentTableView reloadSections:set withRowAnimation:UITableViewRowAnimationAutomatic];
    } else {
        
        [self.upAndDownArray addObject:[NSNumber numberWithInteger:tage]];
        [btn setTitle:@"收起" forState:UIControlStateNormal];
        
        NSIndexSet *set = [[NSIndexSet alloc]initWithIndex:tage];
        [self.pendingPaymentTableView reloadSections:set withRowAnimation:UITableViewRowAnimationAutomatic];
        
    }

}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
