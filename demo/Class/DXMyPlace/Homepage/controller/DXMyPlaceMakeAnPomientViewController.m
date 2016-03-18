//
//  DXMyPlaceMakeAnPomientViewController.m
//  T3Incubator
//
//  Created by mlf on 16/3/15.
//  Copyright © 2016年 mlf. All rights reserved.
//

#import "DXMyPlaceMakeAnPomientViewController.h"
#import "DXMyPlaceMakeAppointmentTableViewCell.h"
#import "DXMyPlacePendingMoreButtonFootView.h"

@interface DXMyPlaceMakeAnPomientViewController ()<UITableViewDelegate,UITableViewDataSource>


{
    DXMyPlacePendingMoreButtonFootView *footView;

}




@end

@implementation DXMyPlaceMakeAnPomientViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    self.makeAnPomientTableView.backgroundColor = [UIColor whiteColor];
    self.makeAnPomientTableView.separatorStyle = UITableViewCellSeparatorStyleNone;

    
}

#pragma mark - UITableView delegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 3;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
 
    return 1;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellName = @"DXMyPlaceMakeAppointmentTableViewCell";
    DXMyPlaceMakeAppointmentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellName];
    
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"DXMyPlaceMakeAppointmentTableViewCell" owner:self options:nil] lastObject];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    
    return 5;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 42;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;
}


- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    
    footView = [[[NSBundle mainBundle] loadNibNamed:@"DXMyPlacePendingMoreButtonFootView" owner:self options:nil] lastObject];
    footView.moreButton.tag = section;
    [footView.moreButton setTitle:@"续费" forState:UIControlStateNormal];
    [footView.moreButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    return footView;
}

- (void)buttonAction:(UIButton *)sedner {
    
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
