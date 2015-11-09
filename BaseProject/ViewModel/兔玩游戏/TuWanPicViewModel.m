//
//  TuWanPicViewModel.m
//  shenyiItem
//
//  Created by apple-jd30 on 15/11/9.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TuWanPicViewModel.h"

@implementation TuWanPicViewModel

-(id)initWithAid :(NSString *)aid{
    if (self = [super init]) {
        _aid = aid;
    }
    return self;
}
//防御编程 为了不允许使用init 初始化
-(instancetype)init{
    if (self = [super init]) {
        //%s  __func__  会显示那个类
        NSAssert1(NO, @"%s 必须是用initWithAid初始化", __func__);
    }
    return self;
}
- (void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
  self.dataTask =  [TuWanNetManager getDetailPicWithAid:_aid completionHandle:^(id model, NSError *error) {
        self.picModel = model;
        completionHandle(error);
    }];
    
}
- (NSInteger)rowNumber{
    return self.picModel.content.count;
}
- (NSURL *)getPicUrl:(NSInteger)row{
    TuWanPicContentModel *model = self.picModel.content[row];
    return [NSURL URLWithString:model.pic];
}
@end
