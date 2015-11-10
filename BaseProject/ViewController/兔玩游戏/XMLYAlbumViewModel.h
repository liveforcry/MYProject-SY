//
//  XMLYAlbumViewModel.h
//  shenyiItem
//
//  Created by apple-jd30 on 15/11/9.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "XiMaNetManager.h"

@interface XMLYAlbumViewModel : BaseViewModel


//专门的初始化方法
-(instancetype)initWithAlbumId : (NSInteger)albumId;

@property(nonatomic)NSInteger albumId;
//导航栏的标题
-(NSString *)getNaviTitle :(NSInteger )row;
//当前请求页数
@property(nonatomic)NSInteger pageId;
// 最大页数
@property(nonatomic)NSInteger maxPageId;
// 是否有更多页
@property(nonatomic,getter=isHasMore)BOOL hasMore;

/** 行数： */
@property(nonatomic)NSInteger rowNumber;

/**返回某行的封面图片URL*/

-(NSURL *)coverURLForRow : (NSInteger )row;

/** 某行的标题*/

-(NSString *)titleForRow : (NSInteger)row;

/**获取某行更新时间*/

-(NSString *)tiemForRow  : (NSInteger)row;

/**某行的出处 */

-(NSString *)sourceForRow :(NSInteger) row;

/**播放次数*/

-(NSString *)playCountForRow :(NSInteger)row;

/**喜欢的人数*/

-(NSString *)favorCountForRow : (NSInteger)row;

//某行的评论数

-(NSString *)commentCountForRow : (NSInteger)row;

//某行的播放时长

-(NSString *)durationForRow :  (NSInteger)row;

//获取下载链接地址

-(NSURL *)downLoadURlForRow : (NSInteger)row;

//某行音频播放地址

-(NSURL *)musicURLForRow :(NSInteger )row;

@end
