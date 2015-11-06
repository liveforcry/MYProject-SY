//
//  TRImageView.m
//  shenyiItem
//
//  Created by apple-jd30 on 15/11/6.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TRImageView.h"

@implementation TRImageView
-(id)init{
    if (self = [super init]) {
        _iamgeView = [UIImageView new];
        [self addSubview:_iamgeView];
        _iamgeView.contentMode = 2;
        [_iamgeView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        self.clipsToBounds = YES;
    }
    return self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
