//
//  DXMyHomePlaceViewController.m
//  T3Incubator
//
//  Created by mlf on 16/3/15.
//  Copyright © 2016年 mlf. All rights reserved.
//

#import "DXMyHomePlaceViewController.h"
#import "DXMyPlacePendingPaymentViewController.h"

#import "DXMyPlaceMakeAnPomientViewController.h"



@interface DXMyHomePlaceViewController ()
{
    
    NSMutableArray *viewControllerArray;    //  保存vc 使引用计数+1 防止提前被释放

    DXMyPlaceMakeAnPomientViewController *makeAnPomientVC; //设置已经预约
    DXMyPlacePendingPaymentViewController *PendingPaymentVC; //待交费
}
@end

@implementation DXMyHomePlaceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    

    [self setTheBaseView];
    
    [self addViewToScrollView];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    
    
}

- (void)setTheBaseView{
    
    // 设置上面的显示和隐藏
    self.titleArray = @[@"待缴费",@"已预约"];
    self.buttonSelectedColor = [[ThemeManager sharedInstance] getThemedColorWithName:@"GeneralMainColor"];
    self.isSliderView = YES;
    self.isSepLine = YES;
    
    
    
    
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}


#pragma mark - rotation
//  旋转
- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation duration:(NSTimeInterval)duration
{
    [super willAnimateRotationToInterfaceOrientation:interfaceOrientation duration:duration];
    
    [self resetTitleScrollFrame];
    [self resetFrame];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self resetFrame];
    
    
}

- (void)resetFrame
{
    CGFloat tabbarHeight = self.navigationController.tabBarController.tabBar.height;
    if (self.hidesBottomBarWhenPushed) {
        //  未登录状态高度变高
        tabbarHeight = 0;
    }
    
    self.controllerContainScrollView.frame = CGRectMake(0, self.titleView.bottom, self.Rect_Used.size.width, ContentViewHeight -  self.titleView.height - tabbarHeight);
    self.controllerContainScrollView.contentSize = CGSizeMake(self.Rect_Used.size.width * self.titleArray.count, self.controllerContainScrollView.height);
    self.controllerContainScrollView.contentOffset = CGPointMake(self.Rect_Used.size.width * self.currentSegPageIndex, 0);
    
    PendingPaymentVC.view.frame = CGRectMake(0, 0, self.Rect_Used.size.width, self.controllerContainScrollView.height);
    makeAnPomientVC.view.frame = CGRectMake(self.Rect_Used.size.width, 0, self.Rect_Used.size.width, self.controllerContainScrollView.height);
    
    PendingPaymentVC.pendingPaymentTableView.frame = CGRectMake(0, 0, self.Rect_Used.size.width, self.controllerContainScrollView.height);
    makeAnPomientVC.makeAnPomientTableView.frame = CGRectMake(0, 0, self.Rect_Used.size.width, self.controllerContainScrollView.height);
    
    PendingPaymentVC.refreshBtn.frame = PendingPaymentVC.pendingPaymentTableView.frame;
    makeAnPomientVC.refreshBtn.frame = makeAnPomientVC.makeAnPomientTableView.frame;
}

//  添加响应控制器的视图
- (void)addViewToScrollView
{
    PendingPaymentVC = [[DXMyPlacePendingPaymentViewController alloc] init];
    //    PendingPaymentVC.viewType = self.viewType;
    [self.controllerContainScrollView addSubview:PendingPaymentVC.view];
    [viewControllerArray addObject:PendingPaymentVC];
    PendingPaymentVC.view.left = 0;
    [PendingPaymentVC loadInitSourceData];
    
    makeAnPomientVC = [[DXMyPlaceMakeAnPomientViewController alloc] init];
//    makeAnPomientVC.viewType = self.viewType;
    [self.controllerContainScrollView addSubview:makeAnPomientVC.view];
    [viewControllerArray addObject:makeAnPomientVC];
    makeAnPomientVC.view.left = self.Rect_Used.size.width;
}

//  继承父类 进行数据加载
-(void)refreshCurrentPageData:(NSInteger)currentPage
{
    [super refreshCurrentPageData:currentPage];
    
    if (currentPage == 0) {
        //  无需加载数据  首个controller已加载过数据
        [PendingPaymentVC loadInitSourceData];
    }else if (currentPage == 1){
        [makeAnPomientVC loadInitSourceData];
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
