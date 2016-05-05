//
//  DXSearchHistoryView.m
//  CPSActivity
//
//  Created by mlf on 16/5/4.
//  Copyright © 2016年 mlf. All rights reserved.
//

#import "DXSearchHistoryView.h"

@implementation DXSearchHistoryView

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        self.backgroundColor = [UIColor colorWithRed:220/255.0 green:220/255.0 blue:220/255.0 alpha:1];
        _searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(5, 7, frame.size.width-10, 30)];
        _searchBar.placeholder = @"搜索精彩活动";
        _searchBar.delegate = self;
        _searchBar.barStyle = UIBarMetricsDefault;
        // searchBar.tintColor = [UIColor blueColor];// 搜索框的颜色，当设置此属性时，barStyle将失效
        [_searchBar setShowsCancelButton:YES animated:YES]; //显示取消的按钮
        
         _searchBar.showsScopeBar = YES;


        [_searchBar setTranslucent:YES];// 设置是否透明
        [self addSubview:_searchBar];
        _searchBar.backgroundImage = [self imageWithColor:[UIColor clearColor] size:_searchBar.bounds.size];
        
        
    }
    return self;
}


// UISearchBar得到焦点并开始编辑时，执行该方法
- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    if(searchBar.text.length==0||[searchBar.text isEqualToString:@""]||[searchBar.text isKindOfClass:[NSNull class]])
    {
        if([_delegate respondsToSelector:@selector(searchBeginEditing)])
        {
            [_delegate searchBeginEditing];
        }
    }
    else
    {
        if([_delegate respondsToSelector:@selector(searchString:)])
        {
            [_delegate searchString:searchBar.text];
        }
    }
    
    // return YES;
}
// 取消按钮被按下时，执行的方法
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    searchBar.text = nil;
    [searchBar setShowsCancelButton:NO animated:YES];
    [searchBar resignFirstResponder];
    if([_delegate respondsToSelector:@selector(didSelectCancelBtn)])
    {
        [_delegate didSelectCancelBtn];
    }
}
// 键盘中，搜索按钮被按下，执行的方法
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    if ([_delegate respondsToSelector:@selector(searchButtonClickAction:)]) {
        [_delegate searchButtonClickAction:searchBar.text];
    }
}
// 当搜索内容变化时，执行该方法。很有用，可以实现时实搜索 目前使用时时搜索功能
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    if([_delegate respondsToSelector:@selector(searchString:)])
    {
        [_delegate searchString:searchText];
    }
}





//取消searchbar背景色
- (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size
{
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
