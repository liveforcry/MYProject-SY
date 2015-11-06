//
//  TuWanListCell.h
//  BaseProject
//
//  Created by apple-jd30 on 15/11/6.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TRImageView.h"
@interface TuWanListCell : UITableViewCell
//题目
@property(nonatomic,strong)UILabel *titleLB;
//左侧图片
@property(nonatomic,strong)TRImageView *iconIV;
//
@property(nonatomic,strong)UILabel *longTitleLB;
//
@property(nonatomic,strong)UILabel *clicksNumLB;



@end
