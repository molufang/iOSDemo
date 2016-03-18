//
//  DXUserImmsiteBaseViewController.m
//  demo
//
//  Created by mlf on 16/3/18.
//  Copyright © 2016年 applecaxa. All rights reserved.
//

#import "DXUserImmsiteBaseViewController.h"
#import "DXSiteImmediateUseVisit.h"

@interface DXUserImmsiteBaseViewController ()

@property (nonatomic, strong)DXSiteImmediateUseVisit *mystandardsView;

@end

@implementation DXUserImmsiteBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}




- (IBAction)immediateUserAction:(id)sender {
    
    //加载视图
    self.mystandardsView = [[DXSiteImmediateUseVisit alloc]init];
    [self.mystandardsView.commitButton addTarget:self action:@selector(commitButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    self.mystandardsView.GoodDetailView = self.view;//设置该属性 对应的view 会缩小
    [self setMystandardsViewObject]; // 加载数据
    [self.mystandardsView show]; //页面展示
    
    
}

- (IBAction)commitButtonAction:(id)sender {
    
    
    
    
}

- (void)setMystandardsViewObject{
    
    self.mystandardsView.titileLabel.text = @"二楼北侧固定办公位";
    self.mystandardsView.contentLabel.text = @"支付方式：押一付三";
    self.mystandardsView.moneyLabel.text = @"8000元/月";
    self.mystandardsView.imageView.image = [UIImage imageNamed:@"tupian.png"];
    
    
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
