//
//  DXSearchHistoryViewController.h
//  CPSActivity
//
//  Created by mlf on 16/5/4.
//  Copyright © 2016年 mlf. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface DXSearchHistoryViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_tableView;
}
@property (nonatomic,copy)void(^selectString)(NSString *string);

@end
