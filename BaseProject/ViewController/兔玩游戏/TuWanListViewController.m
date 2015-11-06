//
//  TuWanListViewController.m
//  BaseProject
//
//  Created by apple-jd30 on 15/11/6.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TuWanListViewController.h"
#import "TuWanListCell.h"
#import "TuWanViewModel.h"
#import "TuWanImageCell.h"
#import "iCarousel.h"
#import "TuWanHtmlViewController.h"
#import "Factory.h"
@interface TuWanListViewController ()<iCarouselDataSource,iCarouselDelegate>  //映入 ic 的来个协议
{
    //添加成员变量 因为不需要懒加载 所以不需要是属性
    UIPageControl *_pagecontrol;
    iCarousel *_ic;
    UILabel *_titleLb;
}
@property(nonatomic,strong)TuWanViewModel *TuWanVM;
@property(nonatomic,strong)iCarousel *ic ; // 用于
@property(nonatomic,strong)NSTimer *timer;
@end

@implementation TuWanListViewController

-(UIView *)headerView{
    //头部视图 origin 无效 宽度无效 肯定是与table 同宽的
    [_timer invalidate];
    //750 * 500
    UIView *headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 0, kWindowW * 500 / 750)];
    //如果头部不存在就返回空
    if(!self.TuWanVM.isExistIndexPic)  return nil;
    //添加底部视图
    UIView *bottomView = [UIView new];
    bottomView.backgroundColor = kRGBColor(240, 240, 240);
    [headView addSubview:bottomView];
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.mas_equalTo(10);
        make.height.mas_equalTo(35);
        make.right.mas_equalTo(-10);
    }];
    _titleLb = [UILabel new];
    [bottomView addSubview:_titleLb];
    [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.centerY.mas_equalTo(0);
    }];
    _pagecontrol = [UIPageControl new];
    _pagecontrol.numberOfPages = self.TuWanVM.indexPicNumber;
    _pagecontrol.userInteractionEnabled = NO;
    [bottomView addSubview:_pagecontrol];
    [_pagecontrol mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-10);
        make.centerY.mas_equalTo(0);
//        make.width.mas_lessThanOrEqualTo(20);
//        make.width.mas_greaterThanOrEqualTo(60);
        make.width.mas_lessThanOrEqualTo(60);
        make.width.mas_greaterThanOrEqualTo(20);
        make.left.mas_equalTo(_titleLb.mas_right).mas_equalTo(-10);
    }];
    _titleLb.text = [self.TuWanVM titleForRowInIndexPic:0];
    _ic = [iCarousel new];
    [headView addSubview:_ic
     ];
    [_ic mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(0);
        make.bottom.mas_equalTo(bottomView.mas_top).mas_equalTo(0);
    }];
    _ic.delegate = self;
    _ic.dataSource = self;
    _ic.pagingEnabled = YES;
    _ic.scrollSpeed = 1;
    //如果自由一张图
    _pagecontrol.hidesForSinglePage  = YES;
    _ic.scrollEnabled = self.TuWanVM.indexPicNumber != 1;
    _pagecontrol.pageIndicatorTintColor = [UIColor grayColor];
    _pagecontrol.currentPageIndicatorTintColor = [UIColor redColor];
    if (self.TuWanVM.indexPicNumber > 1) {
        _timer= [NSTimer bk_scheduledTimerWithTimeInterval:3 block:^(NSTimer *timer) {
            [self.ic scrollToItemAtIndex:_ic.currentItemIndex + 1 animated:YES];
            
        } repeats:YES];
    }
    return headView;
}
#pragma mark icarouser 
-(NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel{
    return self.TuWanVM.indexPicNumber;
}
//滚动到当前view
-(void)carouselCurrentItemIndexDidChange:(iCarousel *)carousel{
//    NSLog(@"%ld", carousel.currentItemIndex);
    _titleLb.text = [self.TuWanVM titleForRowInIndexPic:carousel.currentItemIndex];
    _pagecontrol.currentPage = carousel.currentItemIndex;
    
}
-(UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view{
    if (!view) {
        view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kWindowW,  kWindowW * 500 / 750 - 35)];
        UIImageView *iamge = [UIImageView new];
        [view addSubview:iamge];
        iamge.tag =100;
        iamge.contentMode =2;
        iamge.clipsToBounds  = YES;
        [iamge mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        UIImageView *imageView = [(UIImageView *)view viewWithTag:100];
        [imageView setImageWithURL:[self.TuWanVM iconURLForRowInIndexPic:index] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_4"]];
        
    }
    return view;
}
  //允许循环滚动
-(CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value{
    if (option == iCarouselOptionWrap) {
        return YES;
    }
    return value;
}
- (TuWanViewModel *)TuWanVM {
    if(_TuWanVM == nil) {
        _TuWanVM = [[TuWanViewModel alloc] initWithType:_infoType.integerValue];
    }
    return _TuWanVM;
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self.tableView registerClass:[TuWanListCell class] forCellReuseIdentifier:@"ListCell"];
    [self.tableView registerClass:[TuWanImageCell class] forCellReuseIdentifier:@"ImageCell"];
    self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.TuWanVM refreshDataCompletionHandle:^(NSError *error) {
            [self.tableView.header endRefreshing];
            self.tableView.tableHeaderView = [self headerView];
            [self.tableView reloadData];
        }];
    }];
    
    self.tableView.footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [self.TuWanVM getMoreDataCompletionHandle:^(NSError *error) {
            [self.tableView.footer endRefreshing];
            self.tableView.tableHeaderView = [self headerView];
            [self.tableView reloadData];
        }];
    }];
    //先刷新一次
    [self.tableView.header beginRefreshing];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
kRemoveCellSeparator

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.TuWanVM.rowNumber;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([self.TuWanVM containImages:indexPath.row]) {
        TuWanImageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ImageCell"];
        cell.titleLb.text = [self.TuWanVM titleForRowInList:indexPath.row];
        cell.clicksNumber.text = [self.TuWanVM clicksForRowInList:indexPath.row];
        [cell.iconIV1.iamgeView setImageWithURL:[self.TuWanVM iocnURLSForRowInList:indexPath.row][0] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_1"]];
        [cell.iconIV2.iamgeView setImageWithURL:[self.TuWanVM iocnURLSForRowInList:indexPath.row][1] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_2"]];
        [cell.iconIV3.iamgeView setImageWithURL:[self.TuWanVM iocnURLSForRowInList:indexPath.row][2] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_3"]];
        return cell;
    }
    TuWanListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ListCell" forIndexPath:indexPath];
    [cell.iconIV.iamgeView setImageWithURL:[self.TuWanVM iconURLForRowInList:indexPath.row] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_3"]];
    cell.longTitleLB.text = [self.TuWanVM descForRowInList:indexPath.row];
    cell.titleLB.text = [self.TuWanVM titleForRowInList:indexPath.row];
    cell.clicksNumLB.text = [self.TuWanVM clicksForRowInList:indexPath.row];
                         
    
    return cell;
}
//滚动栏中被选中后出发
-(void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index{
 
    if ([self.TuWanVM isHtmlInIndexPic:index]) {
        TuWanHtmlViewController *vc = [[TuWanHtmlViewController alloc]initWithURL:[self.TuWanVM detailURLForRowInIndexPic:index]];
        [self.navigationController pushViewController:vc animated:YES];
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [self.TuWanVM containImages:indexPath.row] ?  135 : 90;

}
//去掉分割线


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
   
    if ([self.TuWanVM isHtmlInIndexPic:indexPath.row]) {
        TuWanHtmlViewController *vc = [[TuWanHtmlViewController alloc]initWithURL:[self.TuWanVM detailURLForRowInList:indexPath.row]];
        [self.navigationController pushViewController:vc animated:YES];
    }
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


@end
