//
//  XMLYAlbumViewModel.h
//  shenyiItem
//
//  Created by apple-jd30 on 15/11/9.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"

@interface XMLYAlbumViewModel : BaseViewModel

/** 行数： */
@property(nonatomic)NSInteger rowNumber;

/**返回图像*/

-(NSURL *)iconForRow : (NSInteger )row;

/** 标题*/

-(NSString *)titleForRow : (NSInteger)row;

/**描述*/

-(NSString *)descForRow :(NSInteger) row;


/**作者 */

-(NSString *)authorForRow :(NSInteger) row;


/**播放次数*/

-(NSInteger )playCountForRow :(NSInteger)row;


/**喜欢的人数*/


@end
