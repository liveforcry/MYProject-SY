//
//  XIMaCategoryCell.m
//  shenyiItem
//
//  Created by apple-jd30 on 15/11/9.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "XIMaCategoryCell.h"

@implementation XIMaCategoryCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (UILabel *)orderLB {
    if(_orderLB == nil) {
        _orderLB = [[UILabel alloc] init];
        _orderLB.font = [UIFont boldSystemFontOfSize:17];
       
        _orderLB.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_orderLB];
     //使用KVO-键值对 如果text 被赋值为1 颜色是
    // 如果orderL的text 属性 被赋新值 就触发task
        [_orderLB bk_addObserverForKeyPath:@"text" options:NSKeyValueObservingOptionNew task:^(id obj, NSDictionary *change) {
            NSString *value = change[@"new"];
            if ([value isEqualToString:@"1"]) {
               _orderLB.textColor = [UIColor redColor];
            }else if ([value isEqualToString:@"2"]){
                _orderLB.textColor = [UIColor purpleColor];
            }else if ([value isEqualToString:@"3"]){
                _orderLB.textColor = [UIColor greenColor];
            }else{
                _orderLB.textColor = [UIColor blackColor];
            }
        }];
    }
    return _orderLB;
}

- (TRImageView *)iconIV {
    if(_iconIV == nil) {
      _iconIV = [[TRImageView alloc] init];
        [self.contentView addSubview:_iconIV];
    }
    return _iconIV;
}

- (UILabel *)titleLB {
    if(_titleLB == nil) {
        _titleLB = [[UILabel alloc] init];
        _titleLB.font = [UIFont boldFlatFontOfSize:18];
        [self.contentView addSubview:_titleLB];
    }
    return _titleLB;
}

- (UILabel *)descLB {
    if(_descLB == nil) {
        _descLB = [[UILabel alloc] init];
        _descLB.font = [UIFont systemFontOfSize:15];
        _descLB.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview:_descLB];
    }
    return _descLB;
}

- (UILabel *)numberLB {
    if(_numberLB == nil) {
        _numberLB = [[UILabel alloc] init];
        _numberLB.font = [UIFont systemFontOfSize:12];
        _numberLB.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview:_numberLB];
    }
    return _numberLB;
}

- (TRImageView *)numberIV {
    if(_numberIV == nil) {
        _numberIV = [[TRImageView alloc] init];
        _numberIV.iamgeView.image = [UIImage imageNamed:@"album_tracks"];
        [self.contentView addSubview:_numberIV];
    }
    return _numberIV;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        //右箭头
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        //添加依赖  从左到右 从上到下
        [self.orderLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(0);
            make.left.mas_equalTo(0);
            make.width.mas_equalTo(35);
        }];
        [self.iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(0);
            make.size.mas_equalTo(CGSizeMake(65, 65));
            make.left.mas_equalTo(self.orderLB.mas_right).mas_equalTo(10);
        }];
        [self.titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.topMargin.mas_equalTo(self.iconIV.mas_topMargin).mas_equalTo(3);
            make.left.mas_equalTo(self.iconIV.mas_right).mas_equalTo(10);
            make.right.mas_equalTo(-10);
        }];
        
        [self.descLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(0);
            make.left.mas_equalTo(self.iconIV.mas_right).mas_equalTo(10);
            make.right.mas_equalTo(-10);
        }];
        [self.numberIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.iconIV.mas_rightMargin).mas_equalTo(20);
            make.size.mas_equalTo(CGSizeMake(10, 10));
        }];
        [self.numberLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.numberIV.mas_rightMargin).mas_equalTo(10);
            make.bottomMargin.mas_equalTo(self.iconIV.mas_bottomMargin).mas_equalTo(-3);
            make.centerY.mas_equalTo(self.numberIV);
        }];
        //分割线
        self.separatorInset = UIEdgeInsetsMake(0, 105, 0, 0);
    }
    return self;
}









@end
