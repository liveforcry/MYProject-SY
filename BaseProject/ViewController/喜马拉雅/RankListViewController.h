//
//  RankListViewController.h
//  BaseProject
//
//  Created by jiyingxin on 15/11/5.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RankListViewController : UIViewController
//制作单例原因 侧边栏需要经常切换内容也  内容页不应该随着切换
+(UINavigationController *)defaultNavi;
@end
