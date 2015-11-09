//
//  XMLYCategoryViewModel.m
//  shenyiItem
//
//  Created by apple-jd30 on 15/11/9.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "XMLYCategoryViewModel.h"

@implementation XMLYCategoryViewModel
-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    self.dataTask = [XiMaNetManager getRankListWithPageId:_pageID completionHandle:^(RankingListModel *model, NSError *error) {
        if (!error) {
        if (_pageID == 1) {
            [self.dataArr removeAllObjects];
            
        }
        [self.dataArr addObjectsFromArray:model.list];
        _maxPageId = model.maxPageId;
        }
        completionHandle(error);
        }];
    
}
//返回行数对应的数据
-(RankListListModel *)modelForRow :(NSInteger )row{
    return self.dataArr[row];
}
- (NSInteger)rowNumber{
    return self.dataArr.count;
}
-(NSInteger)albumIdForRow:(NSInteger)row{
    return [self modelForRow:row].albumId;
}
-(NSURL *)iconURLForRow:(NSInteger)row{
    return [NSURL URLWithString:[self modelForRow:row].albumCoverUrl290];
}
-(NSString *)titleForRow:(NSInteger)row{
    return [self modelForRow:row].title;
}
- (NSString *)descForRow:(NSInteger)row{
    return [self modelForRow:row].intro;
}
-(NSString *)numberForRow:(NSInteger)row{
    return [NSString stringWithFormat:@"%ld集", [self modelForRow:row].tracks];
}
-(void)getMoreDataCompletionHandle:(CompletionHandle)completionHandle{
    //如果当前已经是最大页数了 那么就没有必要在发送获取更多请求了 者样会浪费用户流量
    if (_pageID >= _maxPageId) {
        NSError *error = [NSError errorWithDomain:@"" code:999 userInfo:@{NSLocalizedDescriptionKey:@"没有=更多数据了"}];
        completionHandle(error);
        return;
    }
    _pageID += 1;
    [self getDataFromNetCompleteHandle:completionHandle];
}

-(void)refreshDataCompletionHandle:(CompletionHandle)completionHandle{
    _pageID = 1;
    [self getDataFromNetCompleteHandle:completionHandle];
}
@end
