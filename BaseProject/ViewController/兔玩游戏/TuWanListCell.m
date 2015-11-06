//
//  TuWanListCell.m
//  BaseProject
//
//  Created by apple-jd30 on 15/11/6.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TuWanListCell.h"

@implementation TuWanListCell

- (void)awakeFromNib {
    // Initialization code
}

- (UILabel *)titleLB {
    if(_titleLB == nil) {
        _titleLB = [[UILabel alloc] init];
        _titleLB.font = [UIFont systemFontOfSize:17];
    }
    return _titleLB;
}

- (TRImageView *)iconIV {
    if(_iconIV == nil) {
        _iconIV = [[TRImageView alloc] init];
        //保持比例饿 填充满
//        _iconIV.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _iconIV;
}

- (UILabel *)longTitleLB {
    if(_longTitleLB == nil) {
        _longTitleLB = [[UILabel alloc] init];
        _longTitleLB.font = [UIFont systemFontOfSize:14];
        _longTitleLB.textColor = [UIColor lightGrayColor];
        _longTitleLB.numberOfLines = 0;
    }
    return _longTitleLB;
}

- (UILabel *)clicksNumLB {
    if(_clicksNumLB == nil) {
        _clicksNumLB = [[UILabel alloc] init];
        _clicksNumLB.font = [UIFont systemFontOfSize:12];
    }
    return _clicksNumLB;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.iconIV];
        [self.contentView addSubview:self.titleLB];
        [self.contentView addSubview:self.longTitleLB];
        [self.contentView addSubview:self.clicksNumLB];
        //图片
        [self.iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.size.mas_equalTo(CGSizeMake(92, 70));
            make.centerY.mas_equalTo(0);
        }];
        [self.titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.iconIV.mas_right).mas_equalTo(8);
            make.right.mas_equalTo(-10);
            make.topMargin.mas_equalTo(_iconIV.mas_topMargin).mas_equalTo(3);
        }];
        [self.longTitleLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leftMargin.mas_equalTo(_titleLB.mas_leftMargin);
            make.rightMargin.mas_equalTo(_titleLB.mas_rightMargin);
            make.top.mas_equalTo(_titleLB.mas_bottom).mas_equalTo(8);
        }];
        [self.clicksNumLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottomMargin.mas_equalTo(_iconIV.mas_bottomMargin);
            make.rightMargin.mas_equalTo(_titleLB.mas_rightMargin);
        }];
        
        
    }
    return self;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
