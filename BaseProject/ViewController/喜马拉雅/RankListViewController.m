//
//  RankListViewController.m
//  BaseProject
//
//  Created by jiyingxin on 15/11/5.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "RankListViewController.h"
#import "XMLYCategoryViewModel.h"
#import "XIMaCategoryCell.h"
@interface RankListViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)XMLYCategoryViewModel *ximaVM;

@end

@implementation RankListViewController

- (UITableView *)tableView {
    if(_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate =self;
        _tableView.dataSource = self;
        [_tableView registerClass:[XIMaCategoryCell class] forCellReuseIdentifier:@"cell"];
        [self.view addSubview:_tableView];
        _tableView.rowHeight =  170/ 2;
        _tableView.estimatedRowHeight = 170 /2;
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
    }
    return _tableView;
}

- (XMLYCategoryViewModel *)ximaVM {
    if(_ximaVM == nil) {
        _ximaVM = [[XMLYCategoryViewModel alloc] init];
    }
    return _ximaVM;
}

+ (UINavigationController *)defaultNavi{
    static UINavigationController *navi = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        RankListViewController *vc = [[RankListViewController alloc]init];
        navi = [[UINavigationController alloc]initWithRootViewController:vc];
        
    });
    return navi;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [Factory addMenuItemToVC:self];
    self.title = @"音乐top50";
    self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.ximaVM refreshDataCompletionHandle:^(NSError *error) {
            if (error) {
                [self showErrorMsg:error.localizedDescription];
                
            }else{
                [self.tableView reloadData];
            }
            //重置脚步 没有更多数据
            [_tableView.footer resetNoMoreData];
            [_tableView.header endRefreshing];
        }];
    }];
    self.tableView.footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [self.ximaVM getMoreDataCompletionHandle:^(NSError *error) {
                if (error) {
                    [self showErrorMsg:error.localizedDescription];
                    if (error.code == 999) {
                        [self.tableView.footer  endRefreshingWithNoMoreData];
                    }else{
                        [_tableView.footer endRefreshing];
                    }
                }else{
                    [self.tableView reloadData];
                }
                [_tableView.header endRefreshing];
           
        }];
    }];
    [self.tableView.header beginRefreshing];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#define mark uitableViewDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.ximaVM.rowNumber;
}
//@property(nonatomic,strong)UILabel *orderLB;
//
///** 类型图片 */
//@property(nonatomic,strong)TRImageView *iconIV;
//
///** 类型名称 */
//@property(nonatomic,strong)UILabel *titleLB;
//
///** 类型描述 */
//@property(nonatomic,strong)UILabel *descLB;
//
///** 集数 */
//@property(nonatomic,strong)UILabel *numberLB;
//
///** 集数图标 */
////@property(nonatomic,strong)TRImageView *numberIV;
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    XIMaCategoryCell *cell =[tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.titleLB.text = [self.ximaVM titleForRow:indexPath.row];
    cell.descLB.text = [self.ximaVM descForRow:indexPath.row];
    cell.numberLB.text = [self.ximaVM numberForRow:indexPath.row];
    [cell.iconIV.iamgeView setImageWithURL:[self.ximaVM iconURLForRow:indexPath.row] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_1"]];
    cell.orderLB.text = @(indexPath.row + 1).stringValue;
    return cell;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/



@end
