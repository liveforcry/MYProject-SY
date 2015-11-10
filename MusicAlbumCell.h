//
//  MusicAlbumCell.h
//  shenyiItem
//
//  Created by apple-jd30 on 15/11/10.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TRImageView.h"
@interface MusicAlbumCell : UITableViewCell

//音乐封面图
@property(nonatomic,strong)TRImageView *coverIV;

//题目标签

@property(nonatomic,strong)UILabel *titleLb;

//添加时间标签

@property(nonatomic,strong)UILabel *timeLb;

//音乐来源标签

@property(nonatomic,strong)UILabel *sourceLB;

//播放次数标签
@property(nonatomic,strong)UILabel *playCountLB;

//喜欢次数标签

@property(nonatomic,strong)UILabel *favorCountLB;

//评论次数标签

@property(nonatomic,strong)UILabel *commentCountLB;

//时长标签

@property(nonatomic,strong)UILabel *duration;

//下载按钮

@property(nonatomic,strong)UIButton *downloadBtn;



@end
