//
//  PlayView.h
//  shenyiItem
//
//  Created by apple-jd30 on 15/11/10.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
@interface PlayView : UIView


+(PlayView *)sharedInstance;

@property(nonatomic,strong)AVPlayer *player; //用于播放

@property(nonatomic,strong)UIButton *playBtn;

-(void)playWithURL : (NSURL *)musciURL;
@end
