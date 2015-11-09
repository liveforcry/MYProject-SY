//
//  TuWanPicViewModel.h
//  shenyiItem
//
//  Created by apple-jd30 on 15/11/9.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "TuWanNetManager.h"
#import "TuWanPicModel.h"
@interface TuWanPicViewModel : BaseViewModel

-(id)initWithAid :(NSString *)aid;
@property(nonatomic,strong)NSString *aid;

@property(nonatomic,strong)NSArray  *imageURLs;

@property(nonatomic,strong)TuWanPicModel *picModel;
@property(nonatomic)NSInteger rowNumber;
-(NSURL *)getPicUrl : (NSInteger)row;
@end
