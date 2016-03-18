//
//  CONST.h
//  demo
//
//  Created by mlf on 16/3/18.
//  Copyright © 2016年 applecaxa. All rights reserved.
//

#ifndef CONST_h
#define CONST_h


#define ScreenStatusBarHeight [[UIApplication sharedApplication] statusBarFrame].size.height

#define ContentViewHeight (self.Rect_Used.size.height - StatusBarHeight - NavigationBarHeight)  //  内容视图高度


#define StatusBarHeight (ScreenStatusBarHeight > 20.0 ? 20.0 : ScreenStatusBarHeight)

#define NavigationBarHeight self.navigationController.navigationBar.height

#define WEAKSELF typeof(self) __weak weakSelf = self;
#define IsPad [UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad

#endif /* CONST_h */
