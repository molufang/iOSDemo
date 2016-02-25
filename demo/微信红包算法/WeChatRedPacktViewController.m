//
//  WeChatRedPacktViewController.m
//  demo
//
//  Created by applecaxa on 16/2/16.
//  Copyright © 2016年 applecaxa. All rights reserved.
//

#import "WeChatRedPacktViewController.h"

@interface WeChatRedPacktViewController ()

@end

@implementation WeChatRedPacktViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}


- (void)time {
//    header("Content-Type: text/html;charset=utf-8");//输出不乱码，你懂的
//    $total=10;//红包总额
//    $num=8;// 分成8个红包，支持8人随机领取
//    $min=0.01;//每个人最少能收到0.01元
//    
//    for ($i=1;$i<$num;$i++)
//    {
//        $safe_total=$total-($num-$i)*$min;//随机安全上限
//        $money=mt_rand($min*100,$safe_total*100)/100;
//        $total=$total-$money;
//        echo '第'.$i.'个红包：'.$money.' 元，余额：'.$total.' 元 <br/>';
//    }
//    echo '第'.$num.'个红包：'.$total.' 元，余额：0 元';

}


- (void)littleChaYi {
//    header("Content-Type: text/html;charset=utf-8");//输出不乱码，你懂的
//    $total=10;//红包总额
//    $num=8;// 分成8个红包，支持8人随机领取
//    $min=0.01;//每个人最少能收到0.01元
//    
//    for ($i=1;$i<$num;$i++)
//    {
//        $safe_total=($total-($num-$i)*$min)/($num-$i);//随机安全上限
//        $money=mt_rand($min*100,$safe_total*100)/100;
//        $total=$total-$money;
//        echo '第'.$i.'个红包：'.$money.' 元，余额：'.$total.' 元 <br/>';
//    }
//    echo '第'.$num.'个红包：'.$total.' 元，余额：0 元';
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
