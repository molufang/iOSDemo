//
//  BaseViewController.m
//  demo
//
//  Created by applecaxa on 16/2/16.
//  Copyright © 2016年 applecaxa. All rights reserved.
//

#import "BaseViewController.h"
#import "GetIndentifyViewController.h"
#import "WeChatRedPacktViewController.h"
#import "DXMyHomePlaceViewController.h"
#import "DXUserImmsiteBaseViewController.h"
#import "WifiInfoViewController.h"
#import "MasonryViewController.h"

@interface BaseViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *baseTableView;

@property (nonatomic,retain) NSMutableArray *array;

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    self.baseTableView.delegate = self;
    self.baseTableView.dataSource = self;
    
    self.array = [[NSMutableArray alloc]initWithObjects:@"1.短信验证码倒计时闪烁",@"2.微信红包算法",@"3.下拉折叠和头部左右选中封装",@"4.类似淘宝的选择商品",@"5.获取wifi信息",@"6.自动布局的使用", nil];
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.array.count;
}


- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIndentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier];
    }
    
    cell.textLabel.text = [self.array objectAtIndex:indexPath.row];
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    if (indexPath.row == 0) {
        GetIndentifyViewController *controller = [[GetIndentifyViewController alloc]initWithNibName:@"GetIndentifyViewController" bundle:nil];
        [self.navigationController pushViewController:controller animated:YES];
    }else if (indexPath.row == 1) {
        WeChatRedPacktViewController *viewChat = [[WeChatRedPacktViewController alloc]initWithNibName:@"WeChatRedPacktViewController" bundle:nil];
        [self.navigationController pushViewController:viewChat animated:YES];
    }  else if (indexPath.row == 2) {
        
         DXMyHomePlaceViewController *myPlace = [[ DXMyHomePlaceViewController alloc]init];
        [self.navigationController pushViewController:myPlace animated:YES];
    } else if (indexPath.row == 3) {
        
        DXUserImmsiteBaseViewController *site = [[DXUserImmsiteBaseViewController alloc]init];
        [self.navigationController pushViewController:site animated:YES];
    } else if (indexPath.row == 4) {
        WifiInfoViewController *wifiVC = [[WifiInfoViewController alloc]init];
        [self.navigationController pushViewController:wifiVC animated:YES];
    }else if (indexPath.row == 5) {
        MasonryViewController *masVC = [[MasonryViewController alloc]init];
        [self.navigationController pushViewController:masVC animated:YES];
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
