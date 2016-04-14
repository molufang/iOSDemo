//
//  MasonryViewController.m
//  demo
//
//  Created by mlf on 16/4/14.
//  Copyright © 2016年 applecaxa. All rights reserved.
//

#import "MasonryViewController.h"

#import "Masonry.h"
@interface MasonryViewController ()

@end

@implementation MasonryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
     // 居中显示一个view
//    UIView *view1 = [[UIView alloc] init];
//    view1.translatesAutoresizingMaskIntoConstraints = NO;
//    view1.backgroundColor = [UIColor greenColor];
//    //在使用autolayout之前一定要先将试图添加到superview上 否则会报错
//    [self.view addSubview:view1];
//    // 用masonry约束布局
//    [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
//        // 设置view1居中
//        make.center.equalTo(self.view);
//        // 设置view的宽 高
//        make.size.mas_equalTo(CGSizeMake(200, 200));
//    }];
    
    /*
     
     1.mas_makeConstraints 只负责添加新增约束，Autolayout中不能同时存在两条针对于同一对象的约束，否则会报错
     2.mas_updateConstraints 针对上面的情况，会更新在block中出现的约束，确保不会出现两个相同的约束
     3.mas_remakeConstraints 会清除之前的所有约束，仅保留最新的约束
     */
    
    
    
    //让一个View小于其superView（边界15）
//    UIView *view2 = [[UIView alloc]init];
//    view2.backgroundColor = [UIColor cyanColor];
//    [self.view addSubview:view2];
//    UIEdgeInsets padding = UIEdgeInsetsMake(10, 10, 10, 10);
//    [view2 mas_makeConstraints:^(MASConstraintMaker *make) {
//        
//        //方法一
//       make.top.left.bottom.and.right.equalTo(self.view).width.insets(padding);
//        //方法二：
//        make.top.equalTo(self.view).with.offset(padding.top);
//        make.left.equalTo(self.view).with.offset(padding.left);
//        make.bottom.equalTo(self.view).with.offset(-padding.bottom);
//        make.right.equalTo(self.view).with.offset(-padding.right);
//        
//        //方法三：
//        make.top.equalTo(self.view.mas_top).with.offset(padding.top);
//        make.left.equalTo(self.view.mas_left).with.offset(padding.left);
//        make.bottom.equalTo(self.view.mas_bottom).with.offset(-padding.bottom);
//        make.right.equalTo(self.view.mas_right).with.offset(-padding.right);
//        
//        //方法四：
//        make.edges.equalTo(self.view).insets(padding);
//    }];
    
    
    // 3.让3个view平分
    
    UIView *view3 = [[UIView alloc]init];
    view3.backgroundColor = [UIColor redColor];
    [self.view addSubview:view3];
    
    UIView *view4 = [[UIView alloc]init];
    view4.backgroundColor  = [UIColor greenColor];
    [self.view addSubview:view4];
    
    [view3  mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.mas_equalTo(self.view.mas_centerY);
        make.left.equalTo(self.view.mas_left).with.offset(10);
        make.right.equalTo(view4.mas_left).with.offset(-10);
        make.height.mas_equalTo(@150);
        make.width.equalTo(view4);
        
    } ];
    
    [view4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.view.mas_centerY);
        make.left.equalTo(view3.mas_right).with.offset(10);
        make.right.equalTo(self.view.mas_right).with.offset(-10);
        make.height.equalTo(view3);
        make.width.equalTo(view3);
    }];
    
    
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
