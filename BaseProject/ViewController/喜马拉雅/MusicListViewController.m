//
//  MusicListViewController.m
//  shenyiItem
//
//  Created by apple-jd30 on 15/11/10.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "MusicListViewController.h"
#import "XMLYAlbumViewModel.h"
#import "PlayView.h"
#import "MusicAlbumCell.h"
@interface MusicListViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)XMLYAlbumViewModel *AlbumVM;
@property(nonatomic,strong)UITableView *tableView;
@end

@implementation MusicListViewController

- (XMLYAlbumViewModel *)AlbumVM {
    if(_AlbumVM == nil) {
        _AlbumVM = [[XMLYAlbumViewModel alloc]initWithAlbumId:_albumId];
    }
    return _AlbumVM;
}

- (UITableView *)tableView {
    if(_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate =self;
        _tableView.dataSource = self;
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
    }
    [_tableView registerClass:[MusicAlbumCell class] forCellReuseIdentifier:@"cell"];
    _tableView.tableFooterView = [UIView new];
    _tableView.estimatedRowHeight = UITableViewAutomaticDimension;
    _tableView .header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.AlbumVM refreshDataCompletionHandle:^(NSError *error) {
            if (error ) {
                [self showErrorMsg:error.localizedDescription];
            }else{
                
                [_tableView reloadData];
                [_tableView.footer resetNoMoreData];
            }
            [_tableView.header endRefreshing];
        }];
    }];
    
    _tableView.footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [self.AlbumVM getMoreDataCompletionHandle:^(NSError *error) {
            if (error) {
                  [self showErrorMsg:error.localizedDescription];
                [_tableView.footer endRefreshing];
            }else{
              
                [_tableView reloadData];
                if (self.AlbumVM.isHasMore) {
                    [_tableView.footer endRefreshing];
                }else{
                    [_tableView.footer endRefreshingWithNoMoreData];
                }
            }
        }];
        
    }];
    return _tableView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [Factory addBackItemTovc:self];
    [self.tableView.header beginRefreshing];
    self.title = _titleForNavi;
    //添加播放控制视图
    [self.view addSubview:[PlayView sharedInstance]];
    [[PlayView sharedInstance] mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(80, 80));
    }];
}

#pragma mark uitabledelegate

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.AlbumVM.rowNumber;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    self.title = [self.AlbumVM titleForRow:indexPath.row];
    MusicAlbumCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    [cell.coverIV.iamgeView setImageWithURL:[self.AlbumVM coverURLForRow:indexPath.row] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_4"]];
    
    cell.titleLb.text = [self.AlbumVM  titleForRow:indexPath.row];
    cell.sourceLB.text = [self.AlbumVM sourceForRow:indexPath.row];
    cell.playCountLB.text = [self.AlbumVM playCountForRow:indexPath.row];
    cell.timeLb.text = [self.AlbumVM tiemForRow:indexPath.row];
    cell.favorCountLB.text =[self.AlbumVM favorCountForRow:indexPath.row];
    cell.commentCountLB.text = [self.AlbumVM commentCountForRow:indexPath.row];
    cell.duration.text = [self.AlbumVM commentCountForRow:indexPath.row];
    
    
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [[PlayView sharedInstance] playWithURL:[self.AlbumVM musicURLForRow:indexPath.row]];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (instancetype)initWithAlbumId:(NSInteger)albumId{
    if (self = [super init]) {
        self.albumId = albumId;
    }
    return self;
}
-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}

@end
