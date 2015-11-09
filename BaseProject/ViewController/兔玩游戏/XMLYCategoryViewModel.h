//
//  XMLYCategoryViewModel.h
//  shenyiItem
//
//  Created by apple-jd30 on 15/11/9.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "XiMaNetManager.h"
#import "XiMaLaYaModel.h"
@interface XMLYCategoryViewModel : BaseViewModel


/**
 *  view 层
 *
 *  @param 数据的条数
 *
 *  @return
 */
/**   行数(数据的条数)    */
@property(nonatomic)NSInteger rowNumber;
/**  某条数据的图片URL*/
-(NSURL *)iconURLForRow :(NSInteger )row;
/**  某条数据的题目*/
-(NSString *)titleForRow :(NSInteger )row;

/**  某条数据的描述*/
-(NSString *)descForRow :(NSInteger)row;


/** 某条数据的集数*/
-(NSString *)numberForRow :(NSInteger)row;
/**
 *  model层
 */

/** 当前页数*/

@property(nonatomic)NSInteger pageID;
/** 当前页数对应的数据ID*/
-(NSInteger)albumIdForRow :(NSInteger)row;
/**最大的页数*/
@property(nonatomic)NSInteger maxPageId;








@end
