//
//  TuWanHtmlViewController.m
//  shenyiItem
//
//  Created by apple-jd30 on 15/11/6.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TuWanHtmlViewController.h"

@interface TuWanHtmlViewController ()<UIWebViewDelegate>
@property(nonatomic,strong)UIWebView *webView;
@end

@implementation TuWanHtmlViewController
- (UIWebView *)webView {
    if(_webView == nil) {
        _webView = [[UIWebView alloc] init];
        [_webView loadRequest:[NSURLRequest requestWithURL:_url]];
        _webView.delegate = self;
    }
    return _webView;
}
- (id)initWithURL:(NSURL *)url{
    if (self = [super init]) {
        _url = url;
        
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
     [Factory addBackItemTovc:self];
    [self.view addSubview:self.webView];
    [self.webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark webViewDelegate
//- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType;
- (void)webViewDidStartLoad:(UIWebView *)webView{
    [self showProgress]; //旋转提示
}
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    [self hideProgress];
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(nullable NSError *)error{
    [self hideProgress];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
// video 和PIC http://api.tuwan.com/app/?aid=226285&appid=1
//
//图片 aid == 226285
//视频 aid == 228024

@end
