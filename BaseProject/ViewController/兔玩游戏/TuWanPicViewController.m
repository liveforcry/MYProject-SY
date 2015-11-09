//
//  TuWanPicViewController.m
//  shenyiItem
//
//  Created by apple-jd30 on 15/11/9.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TuWanPicViewController.h"
#import "TuWanPicViewModel.h"
@interface TuWanPicViewController ()<MWPhotoBrowserDelegate>
@property(nonatomic,strong)TuWanPicViewModel *tuwanPicVM;
@end

@implementation TuWanPicViewController
-(id)initWithAid :(NSString *)aid{
    if (self = [super init]) {
        _aid = aid;
    }
    return self;
}
- (instancetype)init{
    if (self = [super init]) {
        NSAssert1(NO, @"%s 必须使用initWithAid 进行初始化", __func__);
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //非xib storyBoard 默认背景色是透明的
    self.view.backgroundColor = [UIColor whiteColor];
    //请求时就有增在操作的提升
    [self showProgress];
    [Factory addBackItemTovc:self];
    [self.tuwanPicVM getDataFromNetCompleteHandle:^(NSError *error) {
   
        //创建图片展示页面：
        [self hideProgress];
        MWPhotoBrowser *photoB = [[MWPhotoBrowser alloc]initWithDelegate:self];
//        [self.navigationController pushViewController:photoB animated:YES];
        //图片展示页面不应该 是当前页推出的
          //图片展示页面不应该是当前页推出的，而应该是取代当前页面在导航控制器中的位置。
        NSMutableArray *naviVCS = [NSMutableArray arrayWithArray:self.navigationController.viewControllers];
        [naviVCS removeLastObject];
        [naviVCS addObject:photoB];
        self.navigationController.viewControllers = naviVCS;
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark MWPhotoBrowserDelegagte
//展示有几个图片
- (NSUInteger)numberOfPhotosInPhotoBrowser:(MWPhotoBrowser *)photoBrowser{
    return self.tuwanPicVM.rowNumber;//
}
- (id <MWPhoto>)photoBrowser:(MWPhotoBrowser *)photoBrowser photoAtIndex:(NSUInteger)index{
    MWPhoto *photo = [MWPhoto photoWithURL:[self.tuwanPicVM getPicUrl:index]];
    
    return photo;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (TuWanPicViewModel *)tuwanPicVM {
	if(_tuwanPicVM == nil) {
        _tuwanPicVM = [[TuWanPicViewModel alloc] initWithAid:_aid];
	}
	return _tuwanPicVM;
}

@end
