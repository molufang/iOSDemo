//
//  WifiInfoViewController.m
//  MethodIncubator
//
//  Created by yanglei on 15/11/2.
//  Copyright © 2015年 杨磊. All rights reserved.
//

#import "WifiInfoViewController.h"
#import <SystemConfiguration/CaptiveNetwork.h>

@interface WifiInfoViewController ()

@end

@implementation WifiInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _mWebView.delegate = self;
    
    //打开URL
    NSString *path = [[NSBundle mainBundle] pathForResource:@"index" ofType:@"html"];
    [self.mWebView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath: path]]];
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    NSString *urlstr = request.URL.absoluteString;
    NSLog(@"%@",urlstr);
    if ([urlstr isEqualToString:@"ios://jwzhangjie1"]) {
        NSLog(@"wifiInfo = %@",[self getWifiName]);
    }
    
    return YES;
}

-(void)webView:(nonnull UIWebView *)webView didFailLoadWithError:(nullable NSError *)error{
    NSLog(@"加载失败");
}

-(void)webViewDidStartLoad:(nonnull UIWebView *)webView{
    NSLog(@"开始加载");
}


-(void)webViewDidFinishLoad:(nonnull UIWebView *)webView{
    NSLog(@"开始结束");
    //    对于调用js的时候最好这个方法里面或者之后
}

- (NSString *)getWifiName {
    NSString *wifiName = nil;
    CFArrayRef wifiInterfaces = CNCopySupportedInterfaces();
    if (!wifiInterfaces) {
        return nil;
    }
    NSArray *interfaces = (__bridge NSArray *)wifiInterfaces;
    for (NSString *interfaceName in interfaces) {
        CFDictionaryRef dictRef = CNCopyCurrentNetworkInfo((__bridge CFStringRef)(interfaceName));
        if (dictRef) {
            NSDictionary *networkInfo = (__bridge NSDictionary *)dictRef;
            NSLog(@"network info -> %@", networkInfo);
            wifiName = [networkInfo objectForKey:(__bridge NSString *)kCNNetworkInfoKeySSID];
            CFRelease(dictRef);
        }
    }
    CFRelease(wifiInterfaces);
    return wifiName;
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
