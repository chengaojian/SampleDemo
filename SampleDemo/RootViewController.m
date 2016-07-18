//
//  RootViewController.m
//  SampleDemo
//
//  Created by 三海 on 16/7/16.
//  Copyright © 2016年 三海. All rights reserved.
//

#import "RootViewController.h"
#import "Masonry.h"
#import "UIButton+Custom.h"
#import "TableViewController.h"
#import "WebViewController.h"
#import "NoticeViewController.h"
#import "BlockViewController.h"
#import "DelegateViewController.h"
#import "TextFieldViewController.h"
#import "CollectionViewController.h"

@interface RootViewController ()

// UIButton
@property (nonatomic, strong) UIButton *btn;
// TableView
@property (nonatomic, strong) UIButton *tabBtn;
// WebView
@property (nonatomic, strong) UIButton *webBtn;
// TextField
@property (nonatomic, strong) UIButton *textFieldBtn;
// 代理
@property (nonatomic, strong) UIButton *delegateBtn;
// 通知
@property (nonatomic, strong) UIButton *noticeBtn;
// Block
@property (nonatomic, strong) UIButton *blockBtn;
// UICollectionView
@property (nonatomic, strong) UIButton *collectionBtn;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 创建导航控制器
    [self createNav];
    [self createUI];
    // Do any additional setup after loading the view.
}

/**
 *  创建导航栏(因为RootViewController已经成为UINavigationController的根控制器,因此在此可以设置导航栏的样式)
 */
- (void)createNav{
    
    // 设置导航栏标题
    self.title = @"首页";
    // 设置导航栏背景色
    self.navigationController.navigationBar.barTintColor = [UIColor orangeColor];
    // 设置返回字体颜色
    self.navigationController.navigationBar.tintColor = [UIColor redColor];
    // 设置导航栏的一些属性
    self.navigationController.navigationBar.titleTextAttributes = @{
        // 设置导航栏标题颜色
        NSForegroundColorAttributeName:[UIColor blueColor],
        // 设置字体大小
        NSFontAttributeName:[UIFont systemFontOfSize:20],
        // ...
    };
    
    //左边按钮
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    self.navigationItem.leftBarButtonItem = leftItem;
    //右边按钮
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithTitle:@"设置" style:UIBarButtonItemStylePlain target:self action:@selector(jump)];
    self.navigationItem.rightBarButtonItem = rightItem;
}

/**
 *  返回
 */
- (void)back{

    NSLog(@"点击了返回");
}

/**
 *  跳转
 */
- (void)jump{
    
    NSLog(@"点击了跳转");
}

/**
 *  创建界面视图
 */
- (void)createUI{
    
    // UIButton
     _btn = [[UIButton alloc]initWithTitle:@"UIButton" andTitleColor:WHITE_COLOR andBackgroundColor:GRAY_COLOR andFont:FONT_DEFAULE];
    [_btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_btn];
    
    // 跳转UITextField
     _textFieldBtn = [[UIButton alloc]initWithTitle:@"UITextField" andTitleColor:WHITE_COLOR andBackgroundColor:GRAY_COLOR andFont:FONT_DEFAULE];
    [_textFieldBtn addTarget:self action:@selector(textFieldBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_textFieldBtn];
    
    // 跳转UIWebView
     _webBtn = [[UIButton alloc]initWithTitle:@"UIWebView" andTitleColor:WHITE_COLOR andBackgroundColor:GRAY_COLOR andFont:FONT_DEFAULE];
    [_webBtn addTarget:self action:@selector(webViewBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_webBtn];

    // 跳转UITableView
     _tabBtn = [[UIButton alloc]initWithTitle:@"UITableView" andTitleColor:WHITE_COLOR andBackgroundColor:GRAY_COLOR andFont:FONT_DEFAULE];
    [_tabBtn addTarget:self action:@selector(tableViewBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_tabBtn];
    
    // 代理
     _delegateBtn = [[UIButton alloc]initWithTitle:@"Delegate" andTitleColor:WHITE_COLOR andBackgroundColor:GRAY_COLOR andFont:FONT_DEFAULE];
    [_delegateBtn addTarget:self action:@selector(delegateBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_delegateBtn];
    
    // 通知
     _noticeBtn = [[UIButton alloc]initWithTitle:@"NSNotification" andTitleColor:WHITE_COLOR andBackgroundColor:GRAY_COLOR andFont:FONT_DEFAULE];
    [_noticeBtn addTarget:self action:@selector(noticeBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_noticeBtn];
    
    // Block
     _blockBtn = [[UIButton alloc]initWithTitle:@"Block" andTitleColor:WHITE_COLOR andBackgroundColor:GRAY_COLOR andFont:FONT_DEFAULE];
    [_blockBtn addTarget:self action:@selector(blockBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_blockBtn];
    
    // UICollectionView
     _collectionBtn = [[UIButton alloc]initWithTitle:@"UICollectionView" andTitleColor:WHITE_COLOR andBackgroundColor:GRAY_COLOR andFont:FONT_DEFAULE];
    [_collectionBtn addTarget:self action:@selector(collectionBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_collectionBtn];
    
//    NSNotification
    
    //masonry 布局约束
    [_btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(5);
        make.top.mas_equalTo(64 + 5);
        make.width.mas_equalTo((SCREEN_WIDTH - 20) / 3);
        make.height.mas_equalTo(30);
    }];
    
    [_textFieldBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.width.height.mas_equalTo(_btn);
        make.left.mas_equalTo(_btn.mas_right).offset(5);
    }];
    
    [_webBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.width.height.mas_equalTo(_btn);
        make.left.mas_equalTo(_textFieldBtn.mas_right).offset(5);
    }];
    
    [_tabBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.width.height.mas_equalTo(_btn);
        make.top.mas_equalTo(_webBtn.mas_bottom).offset(5);
    }];
    
    [_delegateBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.width.height.mas_equalTo(_tabBtn);
        make.left.mas_equalTo(_tabBtn.mas_right).offset(5);
    }];
    
    [_noticeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.width.height.mas_equalTo(_delegateBtn);
        make.left.mas_equalTo(_delegateBtn.mas_right).offset(5);
    }];
    
    [_blockBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.width.height.mas_equalTo(_tabBtn);
        make.top.mas_equalTo(_noticeBtn.mas_bottom).offset(5);
    }];
    
    [_collectionBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.width.height.mas_equalTo(_blockBtn);
        make.left.mas_equalTo(_blockBtn.mas_right).offset(5);
    }];
}


/**
 *  按钮点击事件
 */
- (void)btnClick{
    
    NSLog(@"点击了按钮");
}

/**
 *  跳转TableView页面
 */
- (void)tableViewBtnClick{
    
    NSLog(@"点击了TableView");
    TableViewController *tableView = [[TableViewController alloc]initWithStyle:UITableViewStylePlain];
    [self.navigationController pushViewController:tableView animated:YES];
}

/**
 *  跳转WebView页面
 */
- (void)webViewBtnClick{
    
    WebViewController *webView = [[WebViewController alloc]init];
    [self.navigationController pushViewController:webView animated:YES];
    NSLog(@"点击了WebView");
}

/**
 *  跳转textField页面
 */
- (void)textFieldBtnClick{
    
    TextFieldViewController *textField = [[TextFieldViewController alloc]init];
    [self.navigationController pushViewController:textField animated:YES];
    NSLog(@"点击了textField");
}

/**
 *  跳转代理页面
 */
- (void)delegateBtnClick{
    
    DelegateViewController *delegate = [[DelegateViewController alloc]init];
    [self.navigationController pushViewController:delegate animated:YES];
    NSLog(@"点击了代理页面");
}

/**
 *  跳转通知页面
 */
- (void)noticeBtnClick{
    
    NoticeViewController *notice = [[NoticeViewController alloc]init];
    [self.navigationController pushViewController:notice animated:YES];
    NSLog(@"点击了通知页面");
}

/**
 *  跳转Block页面
 */
- (void)blockBtnClick{

    BlockViewController *block = [[BlockViewController alloc]init];
    [self.navigationController pushViewController:block animated:YES];
    NSLog(@"点击了Block页面");
}

/**
 *  跳转collection页面
 */
- (void)collectionBtnClick{
    
    CollectionViewController *collection = [[CollectionViewController alloc]init];
    [self.navigationController pushViewController:collection animated:YES];
    NSLog(@"点击了collection页面");
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
