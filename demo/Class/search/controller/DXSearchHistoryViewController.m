//
//  DXSearchHistoryViewController.m
//  CPSActivity
//
//  Created by mlf on 16/5/4.
//  Copyright © 2016年 mlf. All rights reserved.
//

#import "DXSearchHistoryViewController.h"
#import "DXSearchHistoryView.h"
#import "DXSearchHistoryTableViewCell.h"




#define SCREEN_WIDTH    ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)



// 房源类型
typedef NS_ENUM(NSInteger, DXActivityHistorySearchType)
{
    DXActivityHistory = 0, //历史记录
    DXActivitySearchActivityType,   // 搜索页面
};


@interface DXSearchHistoryViewController ()<DXSearchHistoryViewDelegate>

@property (nonatomic,retain)NSMutableArray *sectionTitlesArray; // 区头数组
@property (nonatomic,retain) DXSearchHistoryView *searchView;
@property (nonatomic,retain)NSArray *hotCityArray; // 热门搜索
@property (nonatomic,retain)NSArray *historyArray; //历史记录
@property (nonatomic,retain)NSMutableArray *dataArray;// cell数据源数组

@property (nonatomic,copy) NSString *biaoshiStr; //为0表示
@property (nonatomic,assign)DXActivityHistorySearchType searchType; //搜索

@property (nonatomic,retain) NSArray *sourceDate; //数据


@end

@implementation DXSearchHistoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    
    [self loadInitView]; //加载初始化的视图
    
    
    [self loadData]; //加载数据
    
    
}

- (void)loadInitView {
    self.searchView = [[DXSearchHistoryView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH-20, 44)];
    _searchView.delegate = self;
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 20, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStylePlain];
    _tableView.backgroundColor = [UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.tableHeaderView  = _searchView;
    _tableView.showsVerticalScrollIndicator = NO;
    _tableView.sectionIndexColor = [UIColor redColor];
    _tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag; //滑动tableView的时候收回键盘
    [self.view addSubview:_tableView];
}


- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    //0.2秒之后让聚焦按钮在选中状态上
    [self performSelector:@selector(setCorrectFocus) withObject:nil afterDelay:0.2];
}

-(void) setCorrectFocus {
    [self.searchView.searchBar becomeFirstResponder];
}

-(void)loadData
{
    
    self.sectionTitlesArray = [[NSMutableArray alloc]initWithCapacity:10];
    self.dataArray = [[NSMutableArray alloc]initWithCapacity:10];
    self.hotCityArray = [[NSArray alloc]init];
    self.historyArray = [[NSArray alloc]init];
    self.searchType = DXActivityHistory; //默认为历史记页面
    
//    [self.sectionTitlesArray insertObject:@"热门搜索" atIndex:0];
    [self.sectionTitlesArray insertObject:@"历史记录" atIndex:0];
    self.hotCityArray = @[@"游乐场",@"哈哈",@"周末",@"自助"];
//    [self readTheCaxaDataBaseUpdateDscGroupGetHotTable]; //获取历史数据的数据库
//    [self.dataArray insertObject:self.hotCityArray atIndex:0];

}



#pragma mark---tableViewDelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return self.sectionTitlesArray.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if ([self.dataArray[section] count]>0) {
        return [self.dataArray[section] count]+1;
    } else {
        return 0;
    }
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    static NSString *HeaderIdentifier = @"header";
    UITableViewHeaderFooterView * headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:HeaderIdentifier];
    if( headerView == nil)
    {
        headerView = [[UITableViewHeaderFooterView alloc] initWithReuseIdentifier:HeaderIdentifier];
        UILabel * titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 80, 25)];
        titleLabel.tag = 1;
        titleLabel.backgroundColor = [UIColor clearColor];
        titleLabel.textColor = [UIColor colorWithRed:100/255.0 green:100/255.0 blue:100/255.0 alpha:1];
        [headerView.contentView addSubview:titleLabel];
    }
    headerView.contentView.backgroundColor = [UIColor colorWithRed:235/255.0 green:235/255.0 blue:235/255.0 alpha:1];
    UILabel *label = (UILabel *)[headerView viewWithTag:1];
    label.text = self.sectionTitlesArray[section];
    return headerView;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return CGFLOAT_MIN ;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 25;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == [self.dataArray[indexPath.section] count]) {
        
        //清除历史记录
        static NSString *cellName = @"DXSearchHistoryTableViewCell";
        DXSearchHistoryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellName];
        if (cell == nil) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"DXSearchHistoryTableViewCell" owner:self options:nil] lastObject];
        }
        [cell.cleanButton addTarget:self action:@selector(cleanButtonAction) forControlEvents:UIControlEventTouchUpInside];
        return cell;
        
    } else {
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        if(cell==nil)
        {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        }
        NSArray *array = self.dataArray[indexPath.section];
        cell.textLabel.text = array[indexPath.row];
        cell.textLabel.font = [UIFont systemFontOfSize:16];
        cell.textLabel.textColor = [UIColor colorWithRed:54/255.0 green:54/255.0 blue:54/255.0 alpha:1];
        return cell;
        
    }
   
    return nil;
}




- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.row == [self.dataArray[indexPath.section] count]){
        

    }else {
        NSString *string = self.dataArray[indexPath.section][indexPath.row];
//        self.selectString(string);
        NSLog(@"selectString = %@",string);
        [self dismissViewControllerAnimated:YES completion:nil];
    }

    
}


#pragma mark--buttonAction
- (void)cleanButtonAction {
    //清除搜索历史记录的表的数据
    [self delTableViewHistoryDate];
    //读取数据
    [self readTheCaxaDataBaseUpdateDscGroupGetHotTable];
    [_tableView reloadData];
}


#pragma mark---DXSearchHistoryViewDelegate
-(void)searchBeginEditing{
    

}


-(void)didSelectCancelBtn{
    [self dismissViewControllerAnimated:YES completion:nil];
}



-(void)searchString:(NSString *)string{
    
    
    
}

#pragma mark--把历史记录写进数据库里面
- (void)searchButtonClickAction:(NSString *)string {
    //把搜索的数据更新到数据库中
    [self updateTheCaxaDataBaseUpdateDscGroupGetHotTable:string];
}


#pragma mark --CustomTopViewDelegate
-(void)didSelectBackButton
{
    [self dismissViewControllerAnimated:YES completion:nil];
}




#pragma mark---加载缓存
- (void)updateTheCaxaDataBaseUpdateDscGroupGetHotTable:(NSString *)string {
    //插入每次搜索的结果到数据库中
//    [[DXDataBaseQueue sharedDatabase]insertItem:string ToTable:DSC_ACTIVITY_HISTORY];
  
}
//读出表中的数据
- (void)readTheCaxaDataBaseUpdateDscGroupGetHotTable {
    
//    self.historyArray =  [[DXDataBaseQueue sharedDatabase]readDataItemFromSQLFromTable:DSC_ACTIVITY_HISTORY];
    
    //把搜索到的历史数据放到section的数组中
    [self.dataArray insertObject:self.historyArray atIndex:0];

}

//删除表中的数据
- (void)delTableViewHistoryDate {
//    [[DXDataBaseQueue sharedDatabase]delAllItemInSQLWithTableName:DSC_ACTIVITY_HISTORY];
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
