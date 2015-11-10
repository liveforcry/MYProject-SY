//
//  XMLYAlbumViewModel.m
//  shenyiItem
//
//  Created by apple-jd30 on 15/11/9.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "XMLYAlbumViewModel.h"

@implementation XMLYAlbumViewModel

-(NSInteger)rowNumber{
    return self.dataArr.count;
}

-(BOOL)isHasMore{
    return _maxPageId > _pageId;
}

-(void)refreshDataCompletionHandle:(CompletionHandle)completionHandle{
    _pageId = 1;
    [self getDataFromNetCompleteHandle:completionHandle];
}

-(void)getMoreDataCompletionHandle:(CompletionHandle)completionHandle{
    if ([self isHasMore]) {
        _pageId += 1;
        [self getDataFromNetCompleteHandle:completionHandle];
    }else{
//        NSError *error = [NSError errorWithDomain:@"" code:999 userInfo:@{NSLocalizedDescriptionKey : @"没有更多数据"}];
        NSError *error = [NSError errorWithDomain:@"" code:999 userInfo:@{NSLocalizedDescriptionKey : @"没有更多数据"}];
        completionHandle(error);
    }
    
}

-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
   self.dataTask  =  [XiMaNetManager getAlbumWithId:_albumId page:_pageId completionHandle:^(AlbumModel *model, NSError *error) {
       if (_pageId == 1) {
           [self.dataArr removeAllObjects];
       }
       [self.dataArr addObjectsFromArray:model.tracks.list];
       _maxPageId = model.tracks.maxPageId;
       completionHandle(error);
   }];
    
}

-(instancetype)initWithAlbumId:(NSInteger)albumId{
    if (self = [super init]) {
        self.albumId = albumId;
    }
    return self;
}

-(AlbumTracksListModel *)modelForRow : (NSInteger)row{
    return self.dataArr[row];
}





-(NSURL *)coverURLForRow : (NSInteger )row{
    return [NSURL URLWithString:[self modelForRow:row].coverSmall];
}

/** 某行的标题*/

-(NSString *)titleForRow : (NSInteger)row{
    return [self modelForRow:row].title;
}

/**获取某行更新时间*/

-(NSString *)tiemForRow  : (NSInteger)row{
    //获取当前的秒数
    NSTimeInterval currentTime = [[NSDate date] timeIntervalSince1970];
    //算出当前时间和创建时间的间隔秒数
    NSTimeInterval deta = currentTime - [self modelForRow:row].createdAt /1000;
    //算出秒数 转成消失
    NSInteger hour = deta / 3600 ;
    NSInteger day = hour / 24 ;
    if (hour < 24) {
        return [NSString stringWithFormat:@"%ld小时前", hour];
    }else{
        return [NSString stringWithFormat:@"%ld天前", day];
    }
}

/**某行的出处 */

-(NSString *)sourceForRow :(NSInteger) row{
   
    return [NSString stringWithFormat:@"by %@", [self modelForRow:row].nickname];
}

/**播放次数*/

-(NSString * )playCountForRow :(NSInteger)row{
    NSInteger count =[self modelForRow:row].playtimes;
    if (count < 10000) {
        return @([self modelForRow:row].playtimes).stringValue;
    }else{
        return [NSString stringWithFormat:@"%.lf万", count / 10000.0];
    }
}

/**喜欢的人数*/

-(NSString *)favorCountForRow : (NSInteger)row{
    return @([self modelForRow:row].likes).stringValue;
}

//某行的评论数

-(NSString *)commentCountForRow : (NSInteger)row{
    return  @([self modelForRow:row].comments).stringValue;
}

//某行的播放时长

-(NSString *)durationForRow :  (NSInteger)row{
    NSInteger duration = [self modelForRow:row].duration;
    NSInteger minute = duration / 60;
    NSInteger seconde = duration % 60;
    //%02ld标示 小于俩位 用0补位 列入1 显示01
    return [NSString stringWithFormat:@"%02ld:%02ld",minute,seconde];
}

//获取下载链接地址

-(NSURL *)downLoadURlForRow : (NSInteger)row{
    return [NSURL URLWithString:[self modelForRow:row].downloadUrl];
}

//某行音频播放地址

-(NSURL *)musicURLForRow :(NSInteger )row{
    return [NSURL URLWithString:[self modelForRow:row].playPathAacv164];
}


-(NSString *)getNaviTitle :(NSInteger )row{
    return [self modelForRow:row].description;
}































@end
