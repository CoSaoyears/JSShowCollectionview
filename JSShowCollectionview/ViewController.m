//
//  ViewController.m
//  JSShowCollectionview
//
//  Created by 张喜 on 16/8/23.
//  Copyright © 2016年 zhang.com. All rights reserved.
//

#import "ViewController.h"
#import "JSCollectionView.h"
#import "JSViewManager.h"
#import "JSChannelView.h"
@interface ViewController ()
@property (nonatomic,strong)JSCollectionView *JSColleView;

@property (nonatomic,strong)JSViewManager *JSManager;

@property (nonatomic,strong)NSArray *channelAyyay;

@property (nonatomic,weak)UIScrollView *scrollView;

@property (nonatomic, weak) UIButton  *preBtn;

@property (nonatomic,weak)UIButton *topBtn;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.JSColleView=[JSCollectionView JSManagementCollectionView];
//    [self.view addSubview:self.JSColleView];
//    self.view.backgroundColor=[UIColor purpleColor];
    
    _channelAyyay=@[@"要 闻",@"治 理"];
    
//    self.JSManager=[JSViewManager managerWithChannelAyyay:_channelAyyay];
//    self.JSManager.frame=CGRectMake(0,64, screenW, screenH-64);
//    self.JSManager.layoutStyle=JSLayoutCenter;
//    [self.JSManager CollectionViewManager];
//    
//    [self.view addSubview:self.JSManager];
    
    [self CollectionViewManager];
//    [self loadChannels];
}

//加载频道
- (void)loadChannels{
    
//    self.automaticallyAdjustsScrollViewInsets=NO;
    
    UIScrollView *scrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, screenW, 48)];
    self.scrollView=scrollView;
    
    scrollView.backgroundColor=[UIColor whiteColor];
    scrollView.layer.borderWidth=1;
    scrollView.layer.borderColor=[[UIColor colorWithRed:205/255.0 green:205/255.0 blue:205/255.0 alpha:1] CGColor];
    
    CGFloat count =_channelAyyay.count;
    CGFloat btnW = screenW /count;
    CGFloat h = self.scrollView.bounds.size.height;
    
    for (int i=0; i< count; i++) {
        
        UIButton *topBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        [topBtn setTitle:_channelAyyay[i] forState:UIControlStateNormal];
        topBtn.titleLabel.font=[UIFont fontWithName:@"BebasNeue" size:24];
        
        
        topBtn.tag =i +10;
        [topBtn setTitleColor:[UIColor colorWithRed:73/255.0 green:74/255.0 blue:74/255.0 alpha:1] forState:UIControlStateNormal];
        [topBtn setTitleColor:[UIColor colorWithRed:0/255.0 green:151/255.0 blue:224/255.0 alpha:1] forState:UIControlStateSelected];
        
        topBtn.backgroundColor =[UIColor whiteColor];
        
        
        [self.scrollView addSubview:topBtn];
        
        [topBtn addTarget:self action:@selector(backgroundBtn:) forControlEvents:UIControlEventTouchUpInside];
        
        topBtn.frame = CGRectMake(btnW * i, 0, btnW, h);
        
        
        self.topBtn=topBtn;
        
        
    }
    
    
    self.scrollView.contentSize = CGSizeMake(0, 0);
    self.scrollView.showsHorizontalScrollIndicator = NO;
    JSChannelView *first = self.scrollView.subviews[0];
    
    self.preBtn =first;
    first.selected =YES;
    first.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"activity_card_bj3"]];
    [self.view addSubview:scrollView];
    
    
}


-(void)CollectionViewManager{
    
    self.automaticallyAdjustsScrollViewInsets=NO;
    
    CGFloat  scrollViewH=48;
    UIScrollView *scrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0,64, screenW, scrollViewH)];
    scrollView.backgroundColor=[UIColor redColor];
    scrollView.layer.borderWidth=1;
    scrollView.layer.borderColor=[[UIColor colorWithRed:205/255.0 green:205/255.0 blue:205/255.0 alpha:1] CGColor];
    CGFloat count =_channelAyyay.count;
    
//    inset
    
    CGFloat btnW =0.0;
    btnW = screenW /count;
    for (int i=0; i< count; i++) {
        
        UIButton *topBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        [topBtn setTitle:_channelAyyay[i] forState:UIControlStateNormal];
        topBtn.titleLabel.font=[UIFont fontWithName:@"BebasNeue" size:24];

        topBtn.tag =i +10;
        [topBtn setTitleColor:btnNormalColor forState:UIControlStateNormal];
        [topBtn setTitleColor:btnSelectedColor forState:UIControlStateSelected];
        
        topBtn.backgroundColor =[UIColor whiteColor];
        
        
        [scrollView addSubview:topBtn];
        
        [topBtn addTarget:self action:@selector(backgroundBtn:) forControlEvents:UIControlEventTouchUpInside];
        
        topBtn.frame = CGRectMake(btnW * i, 0, btnW, scrollViewH);
    }
    [self.view addSubview:scrollView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
