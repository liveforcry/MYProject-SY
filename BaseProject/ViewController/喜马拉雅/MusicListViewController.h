//
//  MusicListViewController.h
//  shenyiItem
//
//  Created by apple-jd30 on 15/11/10.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MusicListViewController : UIViewController
-(instancetype)initWithAlbumId : (NSInteger )albumId;
@property(nonatomic)NSInteger albumId;
@property(nonatomic,strong)NSString  *titleForNavi;
@end
