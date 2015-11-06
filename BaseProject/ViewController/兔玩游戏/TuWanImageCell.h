//
//  TuWanImageCell.h
//  BaseProject
//
//  Created by apple-jd30 on 15/11/6.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TuWanImageCell : UITableViewCell
//题目
@property(nonatomic,strong)UILabel *titleLb;
//评论
@property(nonatomic,strong)UILabel *clicksNumber;
//图片1
@property(nonatomic,strong)UIImageView *iconIV1;
//图片2
@property(nonatomic,strong)UIImageView *iconIV2;
//图片3
@property(nonatomic,strong)UIImageView *iconIV3;


@end
