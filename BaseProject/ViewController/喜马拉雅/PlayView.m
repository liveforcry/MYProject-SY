//
//  PlayView.m
//  shenyiItem
//
//  Created by apple-jd30 on 15/11/10.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "PlayView.h"

@implementation PlayView


+(PlayView *)sharedInstance{
    static PlayView *p = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        p = [PlayView new];
    });
    return p;
}

- (id)init{
    if (self = [super init]) {
        //就是调用 playbtn
        self.playBtn.hidden = NO;
//        self.backgroundColor = [UIColor redColor];
    }
    return self;
}

-(UIButton *)playBtn{
    if (!_playBtn) {
        _playBtn = [UIButton buttonWithType:0];
        [_playBtn setBackgroundImage:[UIImage imageNamed:@"toolbar_play_h_p"] forState:UIControlStateNormal];
        [_playBtn setBackgroundImage:[UIImage imageNamed:@"toolbar_pause_n_p"] forState:UIControlStateSelected];
        [self addSubview:_playBtn];
        [_playBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        [_playBtn bk_addEventHandler:^(UIButton *sender) {
            // selected yes 播放 no stop
            if (sender.selected) {
                [_player pause];
            }else{
                [_player play];
            }
            sender.selected = !sender.selected;
            
        } forControlEvents:UIControlEventTouchUpInside];
    }
    return _playBtn;
}
-(void)playWithURL : (NSURL *)musciURL{
    if (!musciURL) {
         self.playBtn.selected = YES;
    }else{
    //需要在info 文件中 天加 require...... 主要是为了在后台可以播放音乐
    [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayback error:nil];
        //激活
    [[AVAudioSession sharedInstance] setActive:YES error:nil];
    
    _player = [AVPlayer playerWithURL:musciURL];
    [_player play];
    self.playBtn.selected = YES;
    }
}
@end
