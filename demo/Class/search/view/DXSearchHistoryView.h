//
//  DXSearchHistoryView.h
//  CPSActivity
//
//  Created by mlf on 16/5/4.
//  Copyright © 2016年 mlf. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DXSearchHistoryViewDelegate <NSObject>

-(void)searchBeginEditing;
-(void)didSelectCancelBtn;
-(void)searchString:(NSString *)string;
- (void)searchButtonClickAction:(NSString *)string;

@end
@interface DXSearchHistoryView : UIView<UISearchBarDelegate>

@property (nonatomic,retain)UISearchBar *searchBar;
@property (nonatomic,retain)UIButton *cancelBtn;
@property (nonatomic,assign) id <DXSearchHistoryViewDelegate>delegate;

@end
