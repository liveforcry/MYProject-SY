//
//  XIMaCategoryCell.h
//  shenyiItem
//
//  Created by apple-jd30 on 15/11/9.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TRImageView.h"
@interface XIMaCategoryCell : UITableViewCell
/** 序号标签 */
@property(nonatomic,strong)UILabel *orderLB;

/** 类型图片 */
@property(nonatomic,strong)TRImageView *iconIV;

/** 类型名称 */
@property(nonatomic,strong)UILabel *titleLB;

/** 类型描述 */
@property(nonatomic,strong)UILabel *descLB;

/** 集数 */
@property(nonatomic,strong)UILabel *numberLB;

/** 集数图标 */
@property(nonatomic,strong)TRImageView *numberIV;


@end
