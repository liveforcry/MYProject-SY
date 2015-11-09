//
//  LeftViewController.m
//  BaseProject
//
//  Created by jiyingxin on 15/11/5.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "LeftViewController.h"
#import <NSString+Icons.h>
#import "RankListViewController.h"
#import "TuWanViewController.h"
@interface LeftViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSArray *itemsName;
@end
@implementation LeftViewController
- (NSArray *)itemsName{
    return @[@"游戏资讯",@"喜马拉雅",@"英雄联盟",@"个人设置"];
}
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
        _tableView.tableFooterView = [UIView new];
        //为空
        _tableView.backgroundColor = [UIColor clearColor];
        [self.view addSubview:_tableView];
        
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(0);
            make.size.mas_equalTo(CGSizeMake(kWindowW / 2, kWindowH / 2));
            make.left.mas_equalTo(0);
        }];
    }
    return _tableView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //触发tableView的懒加载
    [self.tableView reloadData];
  
}
#pragma  mark uitableDelegate

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.itemsName.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [ tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.accessoryType = 1;
    cell.textLabel.text = self.itemsName[indexPath.row];
    cell.backgroundColor = [UIColor clearColor];
    cell.contentView.backgroundColor = [UIColor clearColor];
    cell.textLabel.textColor = [UIColor whiteColor];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
            //兔玩的视图
        case 0:
            [self.sideMenuViewController setContentViewController:[TuWanViewController standardTuWanNavi] animated:YES];
            [self.sideMenuViewController hideMenuViewController];
            break;
          //
        case 1:
            [self.sideMenuViewController setContentViewController:[RankListViewController new] animated:YES];
            [self.sideMenuViewController hideMenuViewController];
            break;
        default:
            break;
    }
}














@end
