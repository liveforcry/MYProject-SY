//
//  MusicAlbumCell.m
//  shenyiItem
//
//  Created by apple-jd30 on 15/11/10.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "MusicAlbumCell.h"

@implementation MusicAlbumCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (TRImageView *)coverIV {
    if(_coverIV == nil) {
        _coverIV = [[TRImageView alloc] init];
        [self.contentView addSubview:_coverIV];
        [_coverIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(55, 55));
            make.centerY.mas_equalTo(0);
            make.left.mas_equalTo(10);
        }];
        //变圆
        _coverIV.layer.cornerRadius = 55 / 2;
        //添加播放标志
        UIImageView *playIV= [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"find_album_play"]];
        [_coverIV addSubview:playIV];
        [playIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(25, 25));
            make.center.mas_equalTo(0);
        }];
    }
    return _coverIV;
}

- (UILabel *)titleLb {
    if(_titleLb == nil) {
        _titleLb = [[UILabel alloc] init];
        [self.contentView addSubview:_titleLb];
        
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.coverIV.mas_right).mas_equalTo(10);
            make.top.mas_equalTo(10);
            make.right.mas_equalTo(self.timeLb.mas_left).mas_equalTo(-10);
            
        }];
        //有几行就换几行
        _titleLb.numberOfLines = 0;
    }
    return _titleLb;
}

- (UILabel *)timeLb {
    if(_timeLb == nil) {
        _timeLb = [[UILabel alloc] init];
        _timeLb.font = [UIFont systemFontOfSize:12];
        _timeLb.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview:_timeLb];
        [_timeLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-10);
            make.top.mas_equalTo(10);
            make.width.mas_equalTo(50);
        }];
        _timeLb.textAlignment = NSTextAlignmentRight; //nstextAlignmentRight juzhong 
    }
    return _timeLb;
}

- (UILabel *)sourceLB {
    if(_sourceLB == nil) {
        _sourceLB = [[UILabel alloc] init];
        [self.contentView addSubview:_sourceLB];
        [_sourceLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leftMargin.mas_equalTo(self.titleLb.mas_leftMargin);
            make.top.mas_equalTo(self.titleLb.mas_bottom).mas_equalTo(4);
            make.rightMargin.mas_equalTo(self.titleLb.mas_rightMargin); //不同号
        }];
        _sourceLB.font = [UIFont systemFontOfSize:15];
        _sourceLB.textColor = [UIColor lightGrayColor];
    }
    return _sourceLB;
}

- (UILabel *)playCountLB {
    if(_playCountLB == nil) {
        _playCountLB = [[UILabel alloc] init];
        
        UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"sound_play"]];
        [self.contentView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(20, 20));
            make.leftMargin.mas_equalTo(self.sourceLB.mas_leftMargin);
            make.bottom.mas_equalTo(-10);
            make.top.mas_equalTo(self.sourceLB.mas_bottom).mas_equalTo(8);
        }];
        [self.contentView addSubview:_playCountLB];
        [_playCountLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(imageView);
            make.left.mas_equalTo(imageView.mas_right).mas_equalTo(3);
        
        }];
        _playCountLB.textColor = [UIColor lightGrayColor];
        _playCountLB.font = [UIFont systemFontOfSize:12];
    }
    return _playCountLB;
}

- (UILabel *)favorCountLB {
    if(_favorCountLB == nil) {
        _favorCountLB = [[UILabel alloc] init];
        [self.contentView addSubview:_favorCountLB];
        UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"sound_likes_n"]];
        [self.contentView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.playCountLB);
            make.left.mas_equalTo(self.playCountLB.mas_right).mas_equalTo(7);
            make.size.mas_equalTo(CGSizeMake(20, 20));
        }];
        _favorCountLB.textColor = [UIColor lightGrayColor];
        _favorCountLB.font = [UIFont systemFontOfSize:12];
        [_favorCountLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(imageView.mas_right).mas_equalTo(3);
            make.centerY.mas_equalTo(imageView);
        }];
//        [_favorCountLB addSubview:imageView];
    }
    return _favorCountLB;
}

- (UILabel *)commentCountLB {
    if(_commentCountLB == nil) {
        _commentCountLB = [[UILabel alloc] init];
        _commentCountLB =[[UILabel alloc]init];
        [self.contentView addSubview:_commentCountLB];
         UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"sound_comments"]];
        [self.contentView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(18, 18));
            make.left.mas_equalTo(self.favorCountLB.mas_right).mas_equalTo(7);
            make.centerY.mas_equalTo(self.favorCountLB);
        }];
        [_commentCountLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(imageView);
            make.left.mas_equalTo(imageView.mas_right).mas_equalTo(3);
        }];
        _commentCountLB.font = [UIFont systemFontOfSize:12];
        _commentCountLB.textColor = [UIColor lightGrayColor];
    }
    return _commentCountLB;
}

- (UILabel *)duration {
    if(_duration == nil) {
        _duration = [[UILabel alloc] init];
 
        [self.contentView addSubview:_duration];
         UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"sound_duration"]];
        [self.contentView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(18, 18));
            make.left.mas_equalTo(self.commentCountLB.mas_right).mas_equalTo(7);
            make.centerY.mas_equalTo(self.commentCountLB);
        }];
        [_duration mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(imageView.mas_right).mas_equalTo(3);
            make.centerY.mas_equalTo(imageView);
        }];
        _duration.font = [UIFont systemFontOfSize:12];
        _duration.textColor = [UIColor lightGrayColor];
    }
    return _duration;
}

- (UIButton *)downloadBtn {
    if(_downloadBtn == nil) {
        _downloadBtn = [UIButton buttonWithType:0];
        [_downloadBtn setBackgroundImage:[UIImage imageNamed:@"cell_download"] forState:0];
        [_downloadBtn bk_addEventHandler:^(id sender) {
          NSLog(@"1按钮点金 ");
        } forControlEvents:UIControlEventTouchUpInside];
          [self.contentView addSubview:_downloadBtn];
        [_downloadBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.right.mas_equalTo(-5);
            make.size.mas_equalTo(CGSizeMake(30, 30));
        }];
       
    }
    return _downloadBtn;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    //为了触发se

    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
            self.downloadBtn.hidden = NO;
        UIView *view = [UIView new];
        view.backgroundColor  = kRGBColor(243, 255, 254);
        self.selectedBackgroundView = view;
        //分割线
        self.separatorInset = UIEdgeInsetsMake(0, 75, 0,0);
    }
    return self;
}
@end
