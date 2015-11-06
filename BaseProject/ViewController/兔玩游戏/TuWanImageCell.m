//
//  TuWanImageCell.m
//  BaseProject
//
//  Created by apple-jd30 on 15/11/6.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TuWanImageCell.h"

@implementation TuWanImageCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.titleLb];
        [self.contentView addSubview:self.clicksNumber];
        [self.contentView addSubview:self.iconIV1];
        [self.contentView addSubview:self.iconIV2];
        [self.contentView addSubview:self.iconIV3];
        //加约束
        [self.titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.mas_equalTo(10);
            make.right.mas_equalTo(_clicksNumber.mas_left).mas_equalTo(-10);
        }];
        [self.clicksNumber mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(10);
            make.right.mas_equalTo(-10);
            //大于40 小于 70
            //下面俩句话不可以合写
            _clicksNumber.textAlignment = NSTextAlignmentRight;
            make.width.mas_greaterThanOrEqualTo(40);
            make.width.mas_lessThanOrEqualTo(70);
        }];
        [self.iconIV1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(88);
            make.left.mas_equalTo(10);
            make.top.mas_equalTo(self.titleLb.mas_bottom).mas_equalTo(5);
            
        }];
        [self.iconIV2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(self.iconIV1);
            make.left.mas_equalTo(self.iconIV1.mas_right).mas_equalTo(5);
            make.topMargin.mas_equalTo(_iconIV1);
        }];
        [self.iconIV3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(self.iconIV1);
            make.left.mas_equalTo(self.iconIV2.mas_right).mas_equalTo(5);
            make.topMargin.mas_equalTo(self.iconIV1);
            make.right.mas_equalTo(-10);
        }];
    }
    return self;
}
- (UILabel *)titleLb {
    if(_titleLb == nil) {
        _titleLb = [[UILabel alloc] init];
        _titleLb.font = [UIFont systemFontOfSize:17];
    
    }
    return _titleLb;
}

- (UILabel *)clicksNumber {
    if(_clicksNumber == nil) {
        _clicksNumber = [[UILabel alloc] init];
        _clicksNumber.textColor = [UIColor lightGrayColor];
        _clicksNumber.font = [UIFont systemFontOfSize:12];
    }
    return _clicksNumber;
}

- (TRImageView *)iconIV1 {
    if(_iconIV1 == nil) {
        _iconIV1 = [[TRImageView alloc] init];
        //按比例放大
//        _iconIV1.contentMode = UIViewContentModeScaleAspectFill; // 2
    }
    return _iconIV1;
}

- (TRImageView *)iconIV2 {
    if(_iconIV2 == nil) {
        _iconIV2 = [[TRImageView alloc] init];
//        _iconIV2.contentMode = UIViewContentModeScaleAspectFill;/
    }
    return _iconIV2;
}

- (TRImageView *)iconIV3 {
    if(_iconIV3 == nil) {
        _iconIV3 = [[TRImageView alloc] init];
//        _iconIV3.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _iconIV3;
}
@end
