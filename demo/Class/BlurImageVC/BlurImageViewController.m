//
//  BlurImageViewController.m
//  demo
//
//  Created by mlf on 16/4/15.
//  Copyright © 2016年 applecaxa. All rights reserved.
//

#import "BlurImageViewController.h"

@interface BlurImageViewController ()




@property (weak, nonatomic) IBOutlet UIImageView *imageView;



@end

@implementation BlurImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    //请求网络地址数据的同步方法
    // 因为这个方法在子线程（全局队列）中执行，所以不需要考虑子县城的问题
//    UIImage *image = [[UIImage alloc]init];
//    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@",userAvatar]];
//    SDWebImageManager *manager = [SDWebImageManager sharedManager];
//    [manager diskImageExistsForURL:url];
//    if ([manager diskImageExistsForURL:url]) {
//        image = [[manager imageCache] imageFromDiskCacheForKey:userAvatar];
//    } else {
//        NSData *data = [NSData dataWithContentsOfURL:url];
//        image = [UIImage imageWithData:data];
//    }
//    
//    NSData *data = [NSData dataWithContentsOfURL:url];
//    image = [UIImage imageWithData:data];
//    [self.imageView setImageToBlur:image blurRadius:kLBBlurredImageDefaultBlurRadius completionBlock:^{
//
//    }];
    
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
