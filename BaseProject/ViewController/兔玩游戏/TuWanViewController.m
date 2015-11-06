//
//  TuWanViewController.m
//  BaseProject
//
//  Created by jiyingxin on 15/11/5.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TuWanViewController.h"
#import "TuWanViewModel.h"
#import "TuWanListViewController.h"
@interface TuWanViewController ()

@end

@implementation TuWanViewController

+ (UINavigationController *)standardTuWanNavi{
    static UINavigationController *navi = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        TuWanViewController *vc = [[TuWanViewController alloc]initWithViewControllerClasses:[self viewControllerClass] andTheirTitles:[self itemNames]];
        //列入设置第一个控制器的某个属性的值
        //
        vc.keys= [self vcKeys];
        vc.values = [self vcValues];
        navi = [[UINavigationController alloc] initWithRootViewController:vc];
    });
    return navi;
}
//提供每个vc 对应的的key值
+(NSArray *)vcKeys{
    NSMutableArray *array = [NSMutableArray new];
    for (id obj in [self itemNames]) {
        [array addObject:@"infoType"];
    }
    return [array copy];
}
+(NSArray *)vcValues{
    NSMutableArray *array = [NSMutableArray new];
    for (int i = 0; i < [self itemNames].count; i++) {
        [array addObject:@(i)];
    }
    return [array copy];
}
//提供题目数组
+(NSArray *)itemNames{
    return @[@"头条",@"独家",@"暗黑3",@"魔兽",@"风暴",@"炉石",@"星际2",@"守望",@"图片",@"视频",@"攻略",@"幻化",@"趣闻",@"COS",@"美女"];
}
//提供每个题目对应的控制器的类型 题目和类型的数量必须一样
+(NSArray *)viewControllerClass{
    NSMutableArray *array = [NSMutableArray new];
    for (id obj in [self itemNames]) {
        [array addObject:[TuWanListViewController class]];
    }
    return [array copy];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor greenSeaColor];
    self.title = @"兔玩";
    [Factory addMenuItemToVC:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
